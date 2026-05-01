import com.lab.dao.AttendanceDAO;
import com.lab.model.Attendance;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MyAttendanceServlet")
public class MyAttendanceServlet extends HttpServlet {

    private AttendanceDAO attendanceDAO;

    @Override
    public void init() {
        attendanceDAO = new AttendanceDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
        if(session.getAttribute("userId") == null || !"STUDENT".equals(session.getAttribute("accountType"))) {
            response.sendRedirect("Logout.jsp");
            return;
        }

        int studentId = (int) session.getAttribute("userId");
        
        List<Attendance> myRegistrations = attendanceDAO.getStudentRegistrations(studentId);
        
        request.setAttribute("myRegistrations", myRegistrations);
        request.getRequestDispatcher("MyRegistrations.jsp").forward(request, response);
    }
}
