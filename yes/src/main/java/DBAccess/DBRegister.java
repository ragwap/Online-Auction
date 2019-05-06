package DBAccess;

import Beans.Users;
import Database.DatabaseConnection;
import org.omg.CORBA.MARSHAL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBRegister {
    public int regUser(Users u1) {
        int rowsEntered = 0;
        try {
            Connection connection = DatabaseConnection.dbConnection();

            String insertSql = "INSERT INTO user VALUES (?,?,?,?)";

            PreparedStatement statement = connection.prepareStatement(insertSql);
            statement.setString(1, u1.getUsername());
            statement.setString(2, u1.getEmail());
            statement.setString(3, u1.getPassword());
            statement.setString(4, u1.getType());

            rowsEntered = statement.executeUpdate();


        }
        catch (SQLException exception){
            exception.printStackTrace();
        }
        return rowsEntered;
    }

    public ResultSet validateReg(String email, String type) throws SQLException {

        Connection connect = DatabaseConnection.dbConnection();
        String sql = "SELECT Email, Type FROM user WHERE Email = '" + email +"' AND Type = '" + type + "'";
        Statement stat = connect.createStatement();

        ResultSet set = stat.executeQuery(sql);

        return set;
    }



}
