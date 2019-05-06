package DBAccess;

import Beans.Users;
import Database.DatabaseConnection;
import sun.nio.cs.US_ASCII;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBEndBid {
    public ResultSet successfulBidder(int pid) throws SQLException {
        Connection connection = DatabaseConnection.dbConnection();

        String winner = "SELECT Email, MAX(Bid) FROM bidder_item WHERE P_ID = '"+ pid +"'";

        Statement stat = connection.createStatement();
        ResultSet ret = stat.executeQuery(winner);

        return ret;
    }
}
