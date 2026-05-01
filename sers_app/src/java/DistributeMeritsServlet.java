import com.lab.dao.EventDAO;
import com.lab.dao.MeritDAO;
import com.lab.model.Event;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DistributeMeritsServlet")
public class DistributeMeritsServlet extends HttpServlet {

    private EventDAO eventDAO;
    private MeritDAO meritDAO;

    @Override
    public void init() {
        eventDAO = new EventDAO();
        meritDAO = new MeritDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
        if(session.getAttribute("userId") == null || !"HEPA".equals(session.getAttribute("accountType"))) {
            response.sendRedirect("Logout.jsp");
            return;
        }

        List<Event> approvedEvents = eventDAO.selectApprovedEvents();
        
        request.setAttribute("approvedEvents", approvedEvents);
        request.setAttribute("meritDAO", meritDAO); // For checking distribution status dynamically
        request.getRequestDispatcher("DistributeMerits.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
        if(session.getAttribute("userId") == null || !"HEPA".equals(session.getAttribute("accountType"))) {
            response.sendRedirect("Logout.jsp");
            return;
        }
        
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        int points = Integer.parseInt(request.getParameter("points"));
        
        // Execute dynamic routing
        meritDAO.distributeMerits(eventId, points);
        
        response.sendRedirect("DistributeMeritsServlet?success=true");
    }
}
