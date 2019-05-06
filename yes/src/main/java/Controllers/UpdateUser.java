package Controllers;

import Beans.Users;
import DBAccess.DBLogin;
import DBAccess.DBUpdate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "updateuser", urlPatterns = "/updateuser")
public class UpdateUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int rows = 0;
        ResultSet resultSet = null;
        HttpSession session = req.getSession();
        String change = req.getParameter("change");

        DBUpdate dbUpdate = new DBUpdate();
        DBLogin dbLogin = new DBLogin();

        String emailRet = null;
        String typeRet = null;
        String passRet = null;


        String email = req.getParameter("mail");
        String username = req.getParameter("uname");
        String newpass = Encryption.encryption(req.getParameter("newpass"));
        String cpass = Encryption.encryption(req.getParameter("confirm"));
        String current = Encryption.encryption(req.getParameter("curpass"));
        if (change.equals("Change")) {
            String type = req.getParameter("check1");

            try {
                if (cpass.equals(newpass)) {


                    resultSet = dbLogin.login(email, type);
                    while (resultSet.next()) {
                        emailRet = resultSet.getString("Email");
                        typeRet = resultSet.getString("Type");
                        passRet = resultSet.getString("Password");

                    }


                    assert emailRet != null;
                    if (emailRet.equals(email)) {

                        if (typeRet.equals(type)) {

                            if (current.equals(passRet)) {

                                Users users = new Users(username, email, newpass, type);
                                rows = dbUpdate.updateUser(users);

                                if (rows != 0) {

                                    session.setAttribute("Pass changed", "Password successfully changed");
                                    req.getRequestDispatcher("NewPass.jsp").forward(req, resp);
                                } else {
                                    session.setAttribute("not changed", "Password could not be changed");
                                }
                            } else {

                                session.setAttribute("Mismatch", "Incorrect Password");
                                req.getRequestDispatcher("NewPass.jsp").forward(req, resp);

                            }
                        } else {

                            session.setAttribute("type error", "Type Mismatch");
                            req.getRequestDispatcher("NewPass.jsp").forward(req, resp);

                        }
                    } else {

                        session.setAttribute("email mismatch", "Email Mismatch");
                        req.getRequestDispatcher("NewPass.jsp").forward(req, resp);

                    }

                } else {

                    session.setAttribute("Incorrect", "New Password and Confirm Password do not match");
                    req.getRequestDispatcher("NewPass.jsp").forward(req, resp);

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if (change.equals("Change Admin Password")) {

            try {

                if (cpass.equals(newpass)) {
                    resultSet = dbLogin.adminLogin();

                    while (resultSet.next()) {
                        emailRet = resultSet.getString("Email");
                        typeRet = resultSet.getString("Type");
                        passRet = resultSet.getString("Password");
                    }

                    assert emailRet != null;
                    if (emailRet.equals(email)) {

                        if (typeRet.equals("Admin")) {

                            if (current.equals(passRet)) {

                                Users users = new Users();
                                users.setUsername(username);
                                users.setEmail(email);
                                users.setPassword(newpass);
                                users.setType(typeRet);

                                rows = dbUpdate.updateUser(users);

                                if (rows != 0) {

                                    session.getAttribute("Pass changed");
                                    req.getRequestDispatcher("NewPass.jsp").forward(req, resp);
                                } else {
                                    session.setAttribute("not changed", "Password could not be changed");
                                }
                            } else {

                                session.getAttribute("Mismatch");
                                req.getRequestDispatcher("NewPass.jsp").forward(req, resp);

                            }
                        } else {

                            session.setAttribute("type error", "Type Mismatch");
                            req.getRequestDispatcher("NewPass.jsp").forward(req, resp);

                        }
                    } else {

                        session.setAttribute("email mismatch", "Email Mismatch");
                        req.getRequestDispatcher("NewPass.jsp").forward(req, resp);

                    }
                }
                 else{

                        session.setAttribute("Incorrect", "New Password and Confirm Password do not match");
                        req.getRequestDispatcher("NewPass.jsp").forward(req, resp);

                    }


            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}


