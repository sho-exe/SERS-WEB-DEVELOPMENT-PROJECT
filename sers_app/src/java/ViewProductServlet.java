import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Class name must match filename: ViewProductServlet.java
public class ViewProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Ambil senarai produk dari DAO
        List<Product> listProduct = productDAO.selectAllProducts(); 
        
        out.println("<html><body>");
        out.println("<h2>Product List (Using ProductDAO)</h2>");
        
        // Header jadual dikemaskini untuk produk
        out.println("<table border='1' cellpadding='5' cellspacing='0'>");
        out.println("<tr>"
                + "<th>ID</th>"
                + "<th>Name</th>"
                + "<th>Category</th>"
                + "<th>Price (RM)</th>"
                + "<th>Quantity</th>"
                + "<th>Actions</th>"
                + "</tr>");

        for (Product product : listProduct) {
            out.println("<tr>");
            out.println("<td>" + product.getId() + "</td>");
            out.println("<td>" + product.getName() + "</td>");
            out.println("<td>" + product.getCategory() + "</td>");
            // Format harga kepada 2 tempat perpuluhan
            out.println("<td>" + String.format("%.2f", product.getPrice()) + "</td>");
            out.println("<td>" + product.getQuantity() + "</td>");
            
            // Link ke Servlet Update dan Delete (Ikut nama dalam web.xml)
            out.println("<td>");
            out.println("<a href='UpdateProductServlet?id=" + product.getId() + "'>Edit</a> | ");
            out.println("<a href='DeleteProductServlet?id=" + product.getId() + "' onclick=\"return confirm('Delete this product?')\">Delete</a>");
            out.println("</td>");
            out.println("</tr>");
        }
        
        out.println("</table>");
        
        // Link untuk tambah produk baru
        out.println("<br><a href='add_product.html'>Add New Product</a>");
        out.println("</body></html>");
    }
}