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

@WebServlet(name = "myProducts", urlPatterns = "/myProducts")
public class MyProducts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        DBSearch my = new DBSearch();
        String seller = (String) session.getAttribute("email");

        try {
            List<Product> pList = my.searchMyProducts(seller);
            session.setAttribute("updateItems", pList);
            req.getRequestDispatcher("UpdateItems.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
