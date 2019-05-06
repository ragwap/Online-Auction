package Controllers;

import Beans.Product;
import Beans.Users;
import DBAccess.DBEndBid;
import DBAccess.DBSearch;
import DBAccess.DBUpdate;
import DBAccess.DBUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "add", urlPatterns ="/add")
public class AddBid extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String retButton = req.getParameter("post");
        HttpSession ses = req.getSession();
        int product = Integer.parseInt(req.getParameter("pid"));
        String bidder = (String) ses.getAttribute("email");
        float bidLimit = (float) 0.0;

        Product p1 = new Product();
        Users u = new Users();


        int row = 0;

        if (retButton.equals("Bid!")) {
            float retBid = Float.parseFloat(req.getParameter("retBid"));

            p1.setP_id(product);
            p1.setBid(retBid);
            u.setEmail(bidder);

            DBUpload upbid = new DBUpload();
            DBSearch valid = new DBSearch();

            try {
                ResultSet resultSet = valid.validBid(product);
                while (resultSet.next()){
                    bidLimit = Float.parseFloat(resultSet.getString("Price"));

                    if (retBid <= bidLimit && retBid != 0){
                        row = upbid.insertBid(p1, u);

                        if (row != 0){
                            ses.setAttribute("added", "You added a bid");
                            resp.sendRedirect("/viewPro");
                        }
                        else {
                            ses.setAttribute("you failed", "Bid could not be added!");
                            resp.sendRedirect("/viewPro");
                        }
                    }
                    else {
                        ses.setAttribute("invalidBid", "Exceeds bid limit or entered value is 0. Enter again");
                        resp.sendRedirect("/viewPro");
                    }
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }


        }

        else if (retButton.equals("Delete Post")){
            DBSearch del = new DBSearch();
            DBUpdate upDel = new DBUpdate();
            try {
                Product p = new Product();
                p.setP_id(product);


                assert false;
                row = del.permenantDelete(p);
                if (row != 0) {

                    upDel.cascadeDel(product);
                    ses.setAttribute("deleted permanently", "Product Deleted");
                    resp.sendRedirect("index.jsp");
                } else {

                    ses.setAttribute("not", "Product could not be deleted");
                    resp.sendRedirect("index.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if (retButton.equals("Update")){
            ses.setAttribute("updatePressed", retButton);
            resp.sendRedirect("UpdateItems.jsp");
        }

        else if (retButton.equals("Save Changes")){
            int id = Integer.parseInt(req.getParameter("pid"));
            float limit = Float.parseFloat(req.getParameter("price"));
            int qty = Integer.parseInt(req.getParameter("qty"));



            DBUpdate dbUpdate = new DBUpdate();
            int row2 = dbUpdate.updateCurrents(id, qty, limit);

            if (row2 != 0){
                ses.setAttribute("updatedCurrents", "Product Updated");
                resp.sendRedirect("/viewPro");
            }
        }

        else if (retButton.equals("End Bid")){
            String mail = null;
            float bid = (float) 0.0;
            DBEndBid end = new DBEndBid();
            try {
                ResultSet set = end.successfulBidder(product);
                while (set.next()){
                    mail = set.getString("Email");
                    bid = set.getFloat("MAX(Bid)");
                    ses.setAttribute("won", mail);
                    ses.setAttribute("max", bid);
                }
                resp.sendRedirect("/myProducts");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
