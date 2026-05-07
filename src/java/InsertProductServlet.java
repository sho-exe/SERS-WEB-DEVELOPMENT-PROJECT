import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Filename must be InsertProductServlet.java
public class InsertProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Get parameters from your HTML form (product-form.html)
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        
        // 2. Convert price and quantity to the correct numbers
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // 3. Create a new Product object using your Product Model
        Product newProduct = new Product(name, category, price, quantity);

        // 4. Call the ProductDAO to save it to MySQL
        productDAO.insertProduct(newProduct); 

        // 5. Redirect back to the view page
        response.sendRedirect("ViewProductServlet");
    }
}