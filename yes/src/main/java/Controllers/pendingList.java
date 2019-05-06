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

@WebServlet(name = "pending", urlPatterns = "/pending")
public class pendingList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBSearch dbSearch = new DBSearch();
        HttpSession session = req.getSession();
        try {
            List<Product> products = dbSearch.pendingList();
            session.setAttribute("pending", products);
            req.getRequestDispatcher("PendingList.jsp").forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
