import com.lab.dao.EventDAO;
import com.lab.model.Event;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/GlobalEventsServlet")
public class GlobalEventsServlet extends HttpServlet {

    private EventDAO eventDAO;

    @Override
    public void init() {
        eventDAO = new EventDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
if (session.getAttribute("userId") == null || 
    (!"HEPA".equals(session.getAttribute("accountType")) && 
     !"ADVISOR".equals(session.getAttribute("accountType")))) {            response.sendRedirect("Logout.jsp");
            return;
        }

        List<Event> globalEvents = eventDAO.selectAllEvents();
        request.setAttribute("globalEvents", globalEvents);
        
        request.getRequestDispatcher("GlobalEvents.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
if (session.getAttribute("userId") == null || 
    (!"HEPA".equals(session.getAttribute("accountType")) && 
     !"ADVISOR".equals(session.getAttribute("accountType")))) {            response.sendRedirect("Logout.jsp");
            return;
        }
            
        String action = request.getParameter("action");
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        
        if ("approve".equals(action)) {
            eventDAO.updateEventStatus(eventId, "APPROVED");
        } else if ("reject".equals(action)) {
            eventDAO.updateEventStatus(eventId, "REJECTED");
        }
        
        response.sendRedirect("GlobalEventsServlet");
    }
}
