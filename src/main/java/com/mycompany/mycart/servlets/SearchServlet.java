import com.mycompany.mycart.entities.Product;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String query = request.getParameter("query");

        try (Session session = FactoryProvider.getFactory().openSession()) {
            List<Product> products = session.createQuery("from Product where pName like :key", Product.class)
                .setParameter("key", "%" + query + "%")
                .getResultList();

            request.setAttribute("products", products);
            request.getRequestDispatcher("search_result.jsp").forward(request, response);
        }
    }
}
