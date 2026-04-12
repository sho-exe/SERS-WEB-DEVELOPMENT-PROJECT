// Class DeleteServlet

import com.lab.dao.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteProductServlet extends HttpServlet {

    private ProductDAO ProductDAO;

    public void init() {
        ProductDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDAO.deleteProduct(id); // Panggil DAO
        response.sendRedirect("ViewProductServlet");
    }
}
