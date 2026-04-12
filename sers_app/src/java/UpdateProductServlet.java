import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Filename must be UpdateProductServlet.java
public class UpdateProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    // GET: Show the form with existing data
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        int id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = productDAO.selectProduct(id); 

        if (existingProduct != null) {
            out.println("<html><body>");
            out.println("<h2>Update Product</h2>");
            // Action must match the mapping in web.xml
            out.println("<form action='UpdateProductServlet' method='POST'>");
            out.println("<input type='hidden' name='id' value='" + existingProduct.getId() + "'>");
            
            out.println("Product Name: <input type='text' name='name' value='" + existingProduct.getName() + "' required><br><br>");
            
            out.println("Category: <input type='text' name='category' value='" + existingProduct.getCategory() + "' required><br><br>");
            
            out.println("Price: <input type='number' step='0.01' name='price' value='" + existingProduct.getPrice() + "' required><br><br>");
            
            out.println("Quantity: <input type='number' name='quantity' value='" + existingProduct.getQuantity() + "' required><br><br>");
            
            out.println("<input type='submit' value='Update Product'>");
            out.println("</form>");
            out.println("<br><a href='ViewProductServlet'>Back to List</a>");
            out.println("</body></html>");
        }
    }

    // POST: Save the updated data
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product product = new Product(id, name, category, price, quantity);
        productDAO.updateProduct(product); 
        
        // Redirect back to the view list
        response.sendRedirect("ViewProductServlet");
    }
}