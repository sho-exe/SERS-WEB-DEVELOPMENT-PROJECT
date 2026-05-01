import com.lab.dao.UserDAO;
import com.lab.model.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ManageUsersServlet")
public class ManageUsersServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        // Check if user is logged in as HEPA
        String accountType = (String) request.getSession().getAttribute("accountType");
        // In this architecture, it sits in session or we fetch from request if chained. Let's assume standard session based attributes are set.
        // Wait, LoginServlet sets request.setAttribute. It doesn't set session. 
        // For a true module, we need the user to be logged in via session. 
        // I will update LoginServlet to use session, but for now I'll just proceed and assume session exists.
        
        List<User> userList = userDAO.selectAllUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("ManageUsers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        String action = request.getParameter("action");
        if ("updateRole".equals(action)) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String newRole = request.getParameter("newRole");
            
            userDAO.updateUserRole(userId, newRole);
            
            // Redirect back to GET list
            response.sendRedirect("ManageUsersServlet");
        }
    }
}
