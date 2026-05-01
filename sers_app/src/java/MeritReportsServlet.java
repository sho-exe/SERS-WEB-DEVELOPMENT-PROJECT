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

@WebServlet("/MeritReportsServlet")
public class MeritReportsServlet extends HttpServlet {

    private MeritDAO meritDAO;

    @Override
    public void init() {
        meritDAO = new MeritDAO();
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
        
        Map<String, Integer> metrics = meritDAO.getAdvisorMetrics(advisorId);
        List<Map<String, Object>> topStudents = meritDAO.getTopStudentsForAdvisor(advisorId);
        
        request.setAttribute("metrics", metrics);
        request.setAttribute("topStudents", topStudents);
        
        request.getRequestDispatcher("MeritReports.jsp").forward(request, response);
    }
}
