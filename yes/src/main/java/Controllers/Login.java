package Controllers;

import DBAccess.DBLogin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "login", urlPatterns = "/login")

public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String type = req.getParameter("check1");

        HttpSession session = req.getSession();
        ResultSet resultSet = null;
        String emailRet = null;
        String passwordRet = null;
        String usernameRet = null;
        String typeRet = null;

        DBLogin dbLogin = new DBLogin();

        try {
            resultSet = dbLogin.login(email, type);

            if (resultSet == null){

                session.setAttribute("wrongDetails", "Incorrect credentials");
                resp.sendRedirect("Login.jsp");
            }
            else {
                while (resultSet.next()) {
                    usernameRet = resultSet.getString("Username");
                    emailRet = resultSet.getString("Email");
                    passwordRet = resultSet.getString("Password");
                    typeRet = resultSet.getString("Type");

                }

                if (typeRet != null && typeRet.equals("Bidder")) {
                    session.setAttribute("Bidder", typeRet);
                }

                if (typeRet != null && typeRet.equals("Seller")) {
                    session.setAttribute("Seller", typeRet);
                }
                if (typeRet == null){
                    session.getAttribute("wrongDetails");
                    req.getRequestDispatcher("Login.jsp").forward(req,resp);
                }
                String encryptedPass = Encryption.encryption(password);

                if (email.equals(emailRet)) {
                    if (encryptedPass.equals(passwordRet)) {
                        if (type.equals(typeRet)) {
                            session.setAttribute("email", emailRet);
                            session.setAttribute("username", usernameRet);
                            session.setAttribute("type", typeRet);
                            resp.sendRedirect("index.jsp");
                        } else {
                            session.setAttribute("wrongType", "The user is not a " + type);
                            resp.sendRedirect("Login.jsp");
                        }
                    } else {
                        session.setAttribute("wrongPass", "Incorrect Password");
                        resp.sendRedirect("Login.jsp");
                    }
                } else {
                    session.setAttribute("wrongMail", "This mail doesn't exist");
                    resp.sendRedirect("Login.jsp");
                }

            }
        } catch (
                SQLException e)

        {
            e.printStackTrace();
        }
    }
}

