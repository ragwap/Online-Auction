package Controllers;

import Beans.Users;
import DBAccess.DBUpdate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "deluser", urlPatterns = "/deluser")
public class DeleteUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String delMail = req.getParameter("umail");
        String delType = req.getParameter("utype");
        int row = 0;

        Users users = new Users();
        users.setEmail(delMail);
        users.setType(delType);

        HttpSession session = req.getSession();

        DBUpdate delUser = new DBUpdate();
        try {
            row = delUser.delete(users);

            if (row != 0) {
                if (delType.equals("Bidder")) {
                    DBUpdate swipe = new DBUpdate();
                    int r = swipe.swipeUser(delMail);
                }
                if (delType.equals("Seller")) {
                    DBUpdate upProduct = new DBUpdate();
                    int row2 = upProduct.updateProduct(delMail);

                }
                session.setAttribute("userDeleted", "User Deleted from Database");
                req.getRequestDispatcher("/view").forward(req, resp);
            } else {
                session.setAttribute("userNot", "User could not be Deleted from the Database");
                req.getRequestDispatcher("/view").forward(req, resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
