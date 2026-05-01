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

@WebServlet("/ClubEventsServlet")
public class ClubEventsServlet extends HttpServlet {

    private EventDAO eventDAO;

    @Override
    public void init() {
        eventDAO = new EventDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
        if (session.getAttribute("userId") == null || !"ADVISOR".equals(session.getAttribute("accountType"))) {
            response.sendRedirect("Logout.jsp");
            return;
        }

        int advisorId = (int) session.getAttribute("userId");
        List<Event> clubEvents = eventDAO.selectAllEventsByAdvisor(advisorId);
        request.setAttribute("clubEvents", clubEvents);
        
        request.getRequestDispatcher("ClubEvents.jsp").forward(request, response);
    }
}
