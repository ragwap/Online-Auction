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
import java.util.List;

@WebServlet(name = "updateBid", urlPatterns = "/updateBid")
public class UpdateBid extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession ses = req.getSession();
        int id = Integer.parseInt(req.getParameter("pid"));
        float bid = Float.parseFloat(req.getParameter("bid"));
        String retSubmit = req.getParameter("updateBid");
        String seller = (String)ses.getAttribute("email");
        int row = 0;

        DBUpdate up = new DBUpdate();
        DBSearch view = new DBSearch();

        if (retSubmit.equals("Delete")){
            try {
                row = up.delBid(id, bid, seller);

                if (row != 0){
                    ses.setAttribute("bidUpdated", "Bid Deleted");
                    req.getRequestDispatcher("/viewBid").forward(req, resp);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        else if (retSubmit.equals("View")){
            try {

                List <Product> pro = view.myBid(id);
                ses.setAttribute("my" , pro);
                resp.sendRedirect("MyBids.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
