package DBAccess;

import Beans.Users;
import Controllers.Login;
import Database.DatabaseConnection;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class DBLogin {
    public ResultSet login(String email, String type) throws SQLException {
        String admin = null;
        String adminMail = null;

        ResultSet adminSet = adminLogin();

        ResultSet resultSet = null;

        while (adminSet.next()) {
            adminMail = adminSet.getString("Email");
            admin = adminSet.getString("Type");
        }

        assert adminMail != null;
        if (adminMail.equals(email)) {
            if (!(admin.equals(type))) {
                resultSet = null;
            }
        }
        else {
                Connection dbcon = DatabaseConnection.dbConnection();
                String sql = "SELECT * FROM user WHERE Email = '" + email + "' AND Type = '" + type + "'";
                Statement statement = dbcon.createStatement();
                resultSet = statement.executeQuery(sql);
            }
        return resultSet;
    }

    public ResultSet adminLogin(){
        ResultSet resultSet = null;
        Connection connection = DatabaseConnection.dbConnection();
        String admin = "SELECT * FROM user WHERE Type = 'Admin'";

        Statement stat = null;
        try {
            stat = connection.createStatement();
            resultSet = stat.executeQuery(admin);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }


}
