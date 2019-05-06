package Controllers;

import Beans.Users;
import DBAccess.DBRegister;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.Buffer;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.MessageFormat;

@WebServlet(name = "Register", urlPatterns = "/Register")
public class User extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatch = req.getRequestDispatcher("../../../../../web/Register.jsp");
        dispatch.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String user = req.getParameter("name");
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
        String cpass = req.getParameter("cpass");
        String check = req.getParameter("check");

        String verifyMail = null;
        String verifyType = null;
        DBRegister dbreg = new DBRegister();

        try {
            ResultSet set = dbreg.validateReg(email, check);

            while (set.next()){
                verifyMail = set.getString("Email");
                verifyType = set.getString("Type");

                if (verifyMail.equals(email)) {
                    if (verifyType.equals(check)) {
                        HttpSession session = req.getSession();
                        session.setAttribute("accountExist", "This account already exists");
                        req.getRequestDispatcher("Register.jsp").forward(req, resp);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        if (pass.equals(cpass)) {
            String encryptedPass = Encryption.encryption(pass);

            Users use = new Users(user, email, encryptedPass, check);



            int rows = dbreg.regUser(use);


            if (rows != 0) {

                HttpSession ses = req.getSession();
                ses.setAttribute("result", "Registered Successfully!");
                req.getRequestDispatcher("Register.jsp").forward(req, resp);

            }
        }
        else{
            HttpSession ses1 = req.getSession();
            ses1.setAttribute("compare", "Passwords do not match!");
            req.getRequestDispatcher("Register.jsp").forward(req, resp);
        }

    }

}
