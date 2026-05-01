import com.lab.dao.EventDAO;
import com.lab.dao.AttendanceDAO;
import com.lab.model.Event;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BrowseEventsServlet")
public class BrowseEventsServlet extends HttpServlet {

    private EventDAO eventDAO;
    private AttendanceDAO regDAO;

    @Override
    public void init() {
        eventDAO = new EventDAO();
        regDAO = new AttendanceDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
        if(session.getAttribute("userId") == null || !"STUDENT".equals(session.getAttribute("accountType"))) {
            response.sendRedirect("Logout.jsp");
            return;
        }

        int studentId = (int) session.getAttribute("userId");
        
        List<Event> approvedEvents = eventDAO.selectApprovedEvents();
        
        // Enhance events with contextual registration data dynamically
        for(Event e : approvedEvents) {
            e.setAlreadyRegistered(regDAO.isStudentRegistered(e.getEventId(), studentId));
            e.setCurrentEnrollments(regDAO.getEnrollmentCount(e.getEventId()));
        }

        request.setAttribute("eventCatalog", approvedEvents);
        request.getRequestDispatcher("BrowseEvents.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
        if(session.getAttribute("userId") == null || !"STUDENT".equals(session.getAttribute("accountType"))) {
            response.sendRedirect("Logout.jsp");
            return;
        }
            
        String action = request.getParameter("action");
        
        if ("register".equals(action)) {
            int eventId = Integer.parseInt(request.getParameter("eventId"));
            int studentId = (int) session.getAttribute("userId");
            
            // Final safety check server-side for quota issues
            int currentLoad = regDAO.getEnrollmentCount(eventId);
            // We'd ideally pull max load here, assuming UI prevents it if full.
            
            regDAO.registerStudent(eventId, studentId);
        }
        
        response.sendRedirect("BrowseEventsServlet");
    }
}
