package Controllers;

import Beans.Product;
import DBAccess.DBSearch;
import Database.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "search", urlPatterns = "/search")
public class Search extends HttpServlet{


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String keyword = req.getParameter("keyword");

        req.getSession().setAttribute("search", keyword);

        DBSearch s1 = new DBSearch();
        List<Product> product = s1.searchProduct(keyword);

        session.setAttribute("products", product);
        req.getRequestDispatcher("Product.jsp").forward(req, resp);

    }
}
