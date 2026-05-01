import com.lab.dao.MeritDAO;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MeritHistoryServlet")
public class MeritHistoryServlet extends HttpServlet {

    private MeritDAO meritDAO;

    @Override
    public void init() {
        meritDAO = new MeritDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("accountType");
        
        if (session.getAttribute("userId") == null || (!"STUDENT".equals(role) && !"CHAIRPERSON".equals(role))) {
            response.sendRedirect("Logout.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        
        int totalMerits = meritDAO.getTotalMerits(userId);
        List<Map<String, Object>> meritHistory = meritDAO.getMeritHistoryForUser(userId);
        
        request.setAttribute("totalMerits", totalMerits);
        request.setAttribute("meritHistory", meritHistory);
        
        request.getRequestDispatcher("MeritHistory.jsp").forward(request, response);
    }
}
