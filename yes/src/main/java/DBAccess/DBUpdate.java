package DBAccess;

import Beans.Product;
import Beans.Users;
import Controllers.User;
import Database.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBUpdate {
    public int updateUser(Users user) throws SQLException {
        int updates = 0;

        Connection con = DatabaseConnection.dbConnection();

        String sql = "UPDATE user SET Password = ? WHERE Email = ? AND Type = ? ";

        PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
        statement.setString(1, user.getPassword());
        statement.setString(2, user.getEmail());
        statement.setString(3, user.getType());

        updates = statement.executeUpdate();

        return updates;
    }

    public int delete(Users u) throws SQLException {
        int deluser = 0;
        Connection connection = DatabaseConnection.dbConnection();

        String deleteuser = "DELETE FROM user WHERE Email = ? AND Type = ?";

        PreparedStatement statement = connection.prepareStatement(deleteuser);
        statement.setString(1, u.getEmail());
        statement.setString(2, u.getType());

        deluser = statement.executeUpdate();

        return deluser;
    }

    public List<Users> view() throws SQLException {
        Users u = null;
        List<Users> users = new ArrayList<Users>();
        try {
            Connection connection = DatabaseConnection.dbConnection();
            String view = "SELECT Email, Type FROM user ";

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(view);

            while (resultSet.next()){
                u = new Users();
                u.setEmail(resultSet.getString("Email"));
                u.setType(resultSet.getString("Type"));

                users.add(u);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return users;

    }

    public int delBid(int pID, float bid, String seller) throws SQLException {
        Connection con = DatabaseConnection.dbConnection();

        String del = "DELETE FROM bidder_item WHERE P_ID = '" + pID +"' AND Bid = '" + bid + "' AND Email = '" + seller + "'";

        PreparedStatement statement = con.prepareStatement(del);

        int delRow = statement.executeUpdate();

        return delRow;


    }


    public int cascadeDel(int pid) throws SQLException {
        Connection connection = DatabaseConnection.dbConnection();

        String del = "DELETE FROM bidder_item WHERE P_ID = '" + pid +"'";

        PreparedStatement statement = connection.prepareStatement(del);

        int delRow = statement.executeUpdate();

        return delRow;
    }

    public int updateProduct(String email) throws SQLException {
        Connection connection = DatabaseConnection.dbConnection();

        String up = "UPDATE products SET Seller_mail = 'Untrusted Seller' WHERE Seller_mail = '" + email + "'";

        PreparedStatement statement = connection.prepareStatement(up);

        int updateRow = statement.executeUpdate();

        return updateRow;
    }

    public int updateCurrents(int pid, int qty, float limit){
        Connection connection = DatabaseConnection.dbConnection();
        int updaterows = 0;

        try{
            String query = "UPDATE products SET QTY = ?, Price = ? WHERE P_ID = ?";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1,qty);
            statement.setFloat(2,limit);
            statement.setInt(3,pid);
            
            updaterows = statement.executeUpdate();
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        
        return updaterows;
    }

    public int swipeUser(String mail) throws SQLException {
        Connection connection = DatabaseConnection.dbConnection();

        String swipe = "DELETE FROM bidder_item WHERE Email = '"+ mail +"'";

        PreparedStatement prep = connection.prepareStatement(swipe);

        int del = prep.executeUpdate();

        return del;
    }
}
