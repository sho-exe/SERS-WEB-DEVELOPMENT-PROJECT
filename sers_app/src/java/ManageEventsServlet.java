import com.lab.dao.ClubDAO;
import com.lab.dao.EventDAO;
import com.lab.model.Club;
import com.lab.model.Event;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ManageEventsServlet")
public class ManageEventsServlet extends HttpServlet {

    private ClubDAO clubDAO;
    private EventDAO eventDAO;

    @Override
    public void init() {
        clubDAO = new ClubDAO();
        eventDAO = new EventDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
        if(session.getAttribute("userId") == null) {
            response.sendRedirect("Logout.jsp");
            return;
        }
        
        int chairId = (int) session.getAttribute("userId");
        
        // Check if this chairperson is actually assigned to a club
        Club myClub = clubDAO.selectClubByChairperson(chairId);
        
        if (myClub != null) {
            List<Event> myEvents = eventDAO.selectEventsByClub(myClub.getClubId());
            request.setAttribute("club", myClub);
            request.setAttribute("eventList", myEvents);
        }
        // If club is null, JSP will render the fallback "No Club Assigned" message automatically
        
        request.getRequestDispatcher("ManageEvents.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        String action = request.getParameter("action");
        
        if ("proposeEvent".equals(action)) {
            String eventName = request.getParameter("eventName");
            String description = request.getParameter("description");
            Date date = Date.valueOf(request.getParameter("date")); // HTML5 date inputs match SQL Date format YYYY-MM-DD
            String venue = request.getParameter("venue");
            int quota = request.getParameter("quota") != null && !request.getParameter("quota").isEmpty() ? Integer.parseInt(request.getParameter("quota")) : 0;
            String criteria = request.getParameter("criteria");
            String category = request.getParameter("kategori");
            int clubId = Integer.parseInt(request.getParameter("clubId"));
            
            Event newEvent = new Event();
            newEvent.setEventName(eventName);
            newEvent.setDescription(description);
            newEvent.setDate(date);
            newEvent.setVenue(venue);
            newEvent.setQuota(quota);
            newEvent.setCriteria(criteria);
            newEvent.setCategory(category);
            newEvent.setClubId(clubId); // DB default forces it to PENDING initially
            
            eventDAO.insertEvent(newEvent);
        }
        
        response.sendRedirect("ManageEventsServlet");
    }
}
