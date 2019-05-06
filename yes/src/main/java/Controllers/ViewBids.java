package Controllers;

import Beans.Product;
import DBAccess.DBSearch;
import DBAccess.DBUpdate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "viewBid", urlPatterns = "/viewBid")
public class ViewBids extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        DBSearch searchBid = new DBSearch();
        String email = (String) session.getAttribute("email");

        try {
            List<Product> products = searchBid.viewBids(email);

            session.setAttribute("Bid", products);
            req.getRequestDispatcher("ViewBids.jsp").forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
