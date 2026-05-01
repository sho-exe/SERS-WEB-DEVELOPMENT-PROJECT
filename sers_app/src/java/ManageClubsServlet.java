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

@WebServlet("/ManageClubsServlet")
public class ManageClubsServlet extends HttpServlet {

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
            
        List<Club> clubList = clubDAO.selectAllClubs();
        List<User> userList = userDAO.selectAllUsers(); // Need this to populate the assignment dropdowns!
        
        request.setAttribute("clubList", clubList);
        request.setAttribute("userList", userList);
        
        request.getRequestDispatcher("ManageClubs.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        String action = request.getParameter("action");
        
        if ("createClub".equals(action)) {
            String name = request.getParameter("clubName");
            String desc = request.getParameter("description");
            Club newClub = new Club(name, desc);
            clubDAO.insertClub(newClub);
        } 
        else if ("updateClub".equals(action) || "assignRoles".equals(action)) {
            int clubId = Integer.parseInt(request.getParameter("clubId"));
            String name = request.getParameter("clubName");
            String desc = request.getParameter("description");
            
            // Allow empty assignments as nulls
            String advStr = request.getParameter("advisorId");
            String chairStr = request.getParameter("chairpersonId");
            
            Integer advisorId = (advStr != null && !advStr.trim().isEmpty()) ? Integer.parseInt(advStr) : null;
            Integer chairpersonId = (chairStr != null && !chairStr.trim().isEmpty()) ? Integer.parseInt(chairStr) : null;
            
            // Protect against empty names accidentally sent (default to existing logic if needed, but jsp requires it)
            if (name == null || name.trim().isEmpty()) name = "Unnamed Club";
            
            clubDAO.updateClub(clubId, name, desc, advisorId, chairpersonId);
        }
        else if ("deleteClub".equals(action)) {
            int clubId = Integer.parseInt(request.getParameter("clubId"));
            clubDAO.deleteClub(clubId);
        }
        
        // Refresh interface
        response.sendRedirect("ManageClubsServlet");
    }
}
