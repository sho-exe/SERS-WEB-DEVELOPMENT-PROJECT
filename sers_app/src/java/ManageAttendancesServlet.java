import com.lab.dao.AttendanceDAO;
import com.lab.dao.EventDAO;
import com.lab.model.Attendance;
import com.lab.model.Event;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ManageAttendancesServlet")
public class ManageAttendancesServlet extends HttpServlet {

    private AttendanceDAO attendanceDAO;
    private EventDAO eventDAO;

    @Override
    public void init() {
        attendanceDAO = new AttendanceDAO();
        eventDAO = new EventDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
        if(session.getAttribute("userId") == null || !"CHAIRPERSON".equals(session.getAttribute("accountType")) && !"HEPA".equals(session.getAttribute("accountType"))) {
            response.sendRedirect("Logout.jsp");
            return;
        }

        String eventIdParam = request.getParameter("eventId");
        if(eventIdParam == null || eventIdParam.isEmpty()) {
            response.sendRedirect("Homepage.jsp");
            return;
        }
        
        int eventId = Integer.parseInt(eventIdParam);
        
        // Find the event to contextualize the dashboard
        Event targetEvent = null;
        List<Event> allEvs = eventDAO.selectAllEvents();
        for(Event e : allEvs) {
            if(e.getEventId() == eventId) {
                targetEvent = e;
                break;
            }
        }
        
        if (targetEvent == null) {
            response.sendRedirect("Homepage.jsp");
            return;
        }

        List<Attendance> roster = attendanceDAO.getAttendancesForEvent(eventId);
        
        request.setAttribute("targetEvent", targetEvent);
        request.setAttribute("roster", roster);
        request.getRequestDispatcher("ManageAttendances.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
        if(session.getAttribute("userId") == null) {
            response.sendRedirect("Logout.jsp");
            return;
        }
        
        int verifierId = (int) session.getAttribute("userId");
        String action = request.getParameter("action");
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        int attendanceId = Integer.parseInt(request.getParameter("attendanceId"));
        
        if ("approve".equals(action)) {
            attendanceDAO.updateAttendanceStatus(attendanceId, "ATTENDED", verifierId);
        } else if ("reject".equals(action)) {
            attendanceDAO.updateAttendanceStatus(attendanceId, "MISSED", verifierId);
        }
        
        response.sendRedirect("ManageAttendancesServlet?eventId=" + eventId);
    }
}
