package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    public static Connection dbConnection() {

            Connection connection = null;

            String hostname = "jdbc:mysql://localhost:3308/auction";
            String username = "root";
            String password = "";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(hostname, username, password);

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            return connection;
    }
}
