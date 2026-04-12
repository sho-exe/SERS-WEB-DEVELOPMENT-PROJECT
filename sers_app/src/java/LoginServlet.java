/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.lab.dao.ProductDAO;
import com.lab.dao.UserDAO;
import com.lab.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sho
 */
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String name = request.getParameter("username");
            String pass = request.getParameter("password");

            User validUser = userDAO.authenticate(name, pass);

            if (validUser != null) {
                // SUCCESS: Forward to the account page
                request.setAttribute("name", validUser.getUsername());
                request.setAttribute("email", validUser.getEmail());
                request.setAttribute("accountType", validUser.getRole());

                if (validUser.getRole().equals("STUDENT")) {
                    request.getRequestDispatcher("Student_Homepage.jsp").forward(request, response);
                }

                if (validUser.getRole().equals("ADVISOR")) {
                    request.getRequestDispatcher("Advisor_Homepage.jsp").forward(request, response);
                }

                if (validUser.getRole().equals("CHAIRPERSON")) {
                    request.getRequestDispatcher("Chairman_Homepage.jsp").forward(request, response);
                }

                if (validUser.getRole().equals("HEPA")) {
                    request.getRequestDispatcher("Hepa_Homepage.jsp").forward(request, response);
                }

            } else {
                // FAILURE: Send back to login.jsp with a message
                request.setAttribute("errorMessage", "Wrong username or password!");

                // Forward back to your login page
                RequestDispatcher rd = request.getRequestDispatcher("login.html");
                rd.forward(request, response);
            }

        } catch (Exception e) {
            // Handle database connection issues or null pointers
            out.print("error");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
