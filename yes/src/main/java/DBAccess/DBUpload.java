package DBAccess;

import Beans.Product;
import Beans.Users;
import Database.DatabaseConnection;

import java.sql.*;

public class DBUpload {
    public int upload(Product p1) throws SQLException {
        int tuple = 0;

        Connection connection = DatabaseConnection.dbConnection();

        String insert = "INSERT INTO temp_products(Temp_Name, Temp_Brand, Temp_QTY, Temp_Price, Temp_Description, Temp_Image, Temp_Type, Temp_Seller_mail) VALUES(?,?,?,?,?,?,?,?)";

        PreparedStatement statement = connection.prepareStatement(insert);

        statement.setString(1, p1.getP_name());
        statement.setString(2, p1.getBrand());
        statement.setInt(3, p1.getQty());
        statement.setFloat(4, p1.getPrice());
        statement.setString(5, p1.getDescription());
        statement.setString(6, p1.getImgPath());
        statement.setString(7, p1.getType());
        statement.setString(8, p1.getSeller_mail());
//        statement.setString(9, p1.getDeadline());

        tuple = statement.executeUpdate();

        return tuple;
    }


    public int insertBid(Product p, Users u) throws SQLException {
        Connection con = DatabaseConnection.dbConnection();
        int bid = 0;

        String done = "INSERT INTO bidder_item(Email, P_ID, Bid) VALUES (?,?,?)";

        PreparedStatement stat = con.prepareStatement(done);
        stat.setString(1, u.getEmail());
        stat.setInt(2, p.getP_id());
        stat.setFloat(3, p.getBid());

        bid = stat.executeUpdate();

        return bid;
    }
}
