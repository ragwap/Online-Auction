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
import java.util.List;

@WebServlet(name = "view", urlPatterns = "/view")
public class ViewUsers extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBUpdate view = new DBUpdate();
        HttpSession session = req.getSession();
        try {
            List<Users> usersList = view.view();
            session.setAttribute("viewuser", usersList);
            req.getRequestDispatcher("Users.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
