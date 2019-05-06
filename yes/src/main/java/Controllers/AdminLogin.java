package Controllers;

import DBAccess.DBLogin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "admin", urlPatterns = "/admin")
public class AdminLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();
        ResultSet resultSet = null;
        String emailRet = null;
        String passwordRet = null;
        String usernameRet = null;
        String typeRet = null;

        DBLogin dbLogin = new DBLogin();

        try {
            resultSet = dbLogin.adminLogin();

            while (resultSet.next()) {
                usernameRet = resultSet.getString("Username");
                emailRet = resultSet.getString("Email");
                passwordRet = resultSet.getString("Password");
                typeRet = resultSet.getString("Type");

            }

            String encryptedPass = Encryption.encryption(password);

            if (encryptedPass.equals(passwordRet)) {
                if (usernameRet.equals("Admin")) {
                    session.setAttribute("email", emailRet);
                    session.setAttribute("username", usernameRet);
                    session.setAttribute("admin", typeRet);
                    resp.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("not", "The user is not an Admin");
                    resp.sendRedirect("Login.jsp");
                }
            } else {
                session.setAttribute("wrongPass", "Incorrect Password");
                resp.sendRedirect("Login.jsp");
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
