package Controllers;

import Beans.Product;
import DBAccess.DBSearch;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "viewPro", urlPatterns = "/viewPro")
public class ViewProducts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        DBSearch s1 = new DBSearch();
        List<Product> products = null;

        try {
            products = s1.selectAll();
            session.setAttribute("pro", products);
            req.getRequestDispatcher("AllProducts.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
