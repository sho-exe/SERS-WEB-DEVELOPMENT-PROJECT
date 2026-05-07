import com.lab.dao.UserDAO;
import com.lab.model.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/users")
public class UserController extends HttpServlet {

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
        if (accountType == null || !"HEPA".equals(accountType)) {
            response.sendRedirect("Logout.jsp");
            return;
        }

        String action = request.getParameter("action");
        if (action == null || "manage".equals(action)) {
            List<User> userList = userDAO.selectAllUsers();
            request.setAttribute("userList", userList);
            request.getRequestDispatcher("ManageUsers.jsp").forward(request, response);
        } else {
            response.sendRedirect("Homepage.jsp");
        }
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
            response.sendRedirect("users?action=manage");
        }
    }
}
