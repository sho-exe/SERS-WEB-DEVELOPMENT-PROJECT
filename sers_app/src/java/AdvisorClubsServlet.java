import com.lab.dao.ClubDAO;
import com.lab.dao.UserDAO;
import com.lab.model.Club;
import com.lab.model.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdvisorClubsServlet")
public class AdvisorClubsServlet extends HttpServlet {

    private ClubDAO clubDAO;
    private UserDAO userDAO;

    @Override
    public void init() {
        clubDAO = new ClubDAO();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
        if(session.getAttribute("userId") == null) {
            response.sendRedirect("Logout.jsp");
            return;
        }
        
        int advisorId = (int) session.getAttribute("userId");
        
        // Fetch only clubs owned by this exact advisor
        List<Club> myClubs = clubDAO.selectClubsByAdvisor(advisorId);
        List<User> userList = userDAO.selectAllUsers();
        
        request.setAttribute("clubList", myClubs);
        request.setAttribute("userList", userList);
        
        request.getRequestDispatcher("AdvisorClubs.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        String action = request.getParameter("action");
        if ("assignChairperson".equals(action)) {
            int clubId = Integer.parseInt(request.getParameter("clubId"));
            
            // Advisors can only change the chairperson, they pass their own ID along so HEPA doesn't get overridden by null
            String chairStr = request.getParameter("chairpersonId");
            Integer chairpersonId = (chairStr != null && !chairStr.trim().isEmpty()) ? Integer.parseInt(chairStr) : null;
            
            int advisorId = (int) request.getSession().getAttribute("userId");
            
            // Get original club name and description so we don't wipe it out since updateClub requires everything
            // Actually, we can just fetch the club from the DB to preserve its name/description
            Club targetClub = clubDAO.selectAllClubs().stream().filter(c -> c.getClubId() == clubId).findFirst().orElse(null);
            if(targetClub != null && targetClub.getAdvisorId() != null && targetClub.getAdvisorId() == advisorId) {
                clubDAO.updateClub(clubId, targetClub.getClubName(), targetClub.getDescription(), advisorId, chairpersonId);
            }
        }
        
        response.sendRedirect("AdvisorClubsServlet");
    }
}
