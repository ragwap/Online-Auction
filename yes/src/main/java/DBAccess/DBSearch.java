package DBAccess;

import Beans.Product;
import Database.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBSearch {
    public List<Product> searchProduct(String keyword) {
        Product p1 = null;
        List<Product> products = new ArrayList<Product>();

        try {
            Connection connection = DatabaseConnection.dbConnection();

            String sql = "select * from products where P_Name LIKE '%" + keyword + "%'";
            Statement stat = connection.createStatement();
            ResultSet res;
            res = stat.executeQuery(sql);

            while (res.next()) {
                p1 = new Product();
                p1.setP_id(res.getInt("P_ID"));
                p1.setP_name(res.getString("P_Name"));
                p1.setBrand(res.getString("Brand"));
                p1.setQty(res.getInt("Qty"));
                p1.setPrice(res.getFloat("Price"));
                p1.setDescription(res.getString("Description"));
                p1.setImgPath(res.getString("Image_Path"));
                p1.setType(res.getString("Item_Type"));
                p1.setSeller_mail(res.getString("Seller_mail"));


                products.add(p1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> selectAll() throws SQLException {
        Connection con = DatabaseConnection.dbConnection();
        Product p3 = new Product();
        List<Product> products = new ArrayList<Product>();

        String all = "SELECT * FROM products";

        Statement st = con.createStatement();
        ResultSet ret = st.executeQuery(all);
        while (ret.next()) {
            p3 = new Product();
            p3.setP_id(ret.getInt("P_ID"));
            p3.setP_name(ret.getString("P_Name"));
            p3.setBrand(ret.getString("Brand"));
            p3.setQty(ret.getInt("Qty"));
            p3.setPrice(ret.getFloat("Price"));
            p3.setDescription(ret.getString("Description"));
            p3.setImgPath(ret.getString("Image_Path"));
            p3.setType(ret.getString("Item_Type"));
            p3.setSeller_mail(ret.getString("Seller_mail"));

            products.add(p3);
        }
        return products;
    }

    public int delete(Product p) throws SQLException {
        int cleared = 0;
        Connection connection = DatabaseConnection.dbConnection();

        String delete = "DELETE FROM temp_products WHERE Temp_ID = ?";

        PreparedStatement statement = connection.prepareStatement(delete);
        statement.setInt(1, p.getP_id());

        cleared = statement.executeUpdate();

        return cleared;
    }

    public List<Product> pendingList() throws SQLException {
        List<Product> pro = new ArrayList<Product>();
        Product p2 = null;
        Connection connection = DatabaseConnection.dbConnection();

        String pending = "SELECT * FROM temp_products";

        Statement statement = connection.createStatement();
        ResultSet set = statement.executeQuery(pending);

        while (set.next()) {
            p2 = new Product();
            p2.setP_id(set.getInt("Temp_ID"));
            p2.setP_name(set.getString("Temp_Name"));
            p2.setBrand(set.getString("Temp_Brand"));
            p2.setQty(set.getInt("Temp_QTY"));
            p2.setPrice(set.getFloat("Temp_Price"));
            p2.setDescription(set.getString("Temp_Description"));
            p2.setImgPath(set.getString("Temp_Image"));
            p2.setType(set.getString("Temp_Type"));
            p2.setSeller_mail(set.getString("Temp_Seller_mail"));

            pro.add(p2);
        }
        return pro;
    }

    public int permenant(Product p) throws SQLException {
        Connection connection = DatabaseConnection.dbConnection();
        int inserts = 0;

        String enter = "INSERT INTO products (P_Name,Brand,QTY,Price,Description,Image_Path,Item_Type,Seller_mail) VALUES (?,?,?,?,?,?,?,?)";

        PreparedStatement statement = connection.prepareStatement(enter);

        statement.setString(1, p.getP_name());
        statement.setString(2, p.getBrand());
        statement.setInt(3, p.getQty());
        statement.setFloat(4, p.getPrice());
        statement.setString(5, p.getDescription());
        statement.setString(6, p.getImgPath());
        statement.setString(7, p.getType());
        statement.setString(8, p.getSeller_mail());


        inserts = statement.executeUpdate();

        return inserts;
    }

    public ResultSet authenticate(int pid) throws SQLException {
        ResultSet resultSet = null;
        Product p2 = new Product();
        Connection con = DatabaseConnection.dbConnection();

        String accept = "SELECT * FROM temp_products WHERE Temp_ID = '" + pid + "'";

        Statement statement = con.createStatement();
        resultSet = statement.executeQuery(accept);

        return resultSet;
    }

    public int permenantDelete(Product p2) throws SQLException {
        int cleared = 0;
        Connection connection = DatabaseConnection.dbConnection();

        String delete = "DELETE FROM products WHERE P_ID = ?";

        PreparedStatement statement = connection.prepareStatement(delete);
        statement.setInt(1, p2.getP_id());

        cleared = statement.executeUpdate();

        return cleared;
    }

    public List<Product> viewBids(String email) throws SQLException {
        Product product = null;
        ArrayList<Product> pro = new ArrayList<Product>();
        Connection con = DatabaseConnection.dbConnection();

        String bids = "SELECT b.P_ID, b.Bid FROM bidder_item b WHERE  b.Email = '" + email + "'";

        Statement statement = con.createStatement();

        ResultSet res = statement.executeQuery(bids);

        while (res.next()) {
            product = new Product();
            product.setP_id(Integer.parseInt(res.getString("P_ID")));
            product.setBid(res.getFloat("Bid"));

            pro.add(product);
        }

        return pro;
    }

    public List<Product> searchMyProducts(String seller) throws SQLException {
        Product p = null;
        List<Product> products = new ArrayList<Product>();
        Connection connection = DatabaseConnection.dbConnection();

        String myProducts = "SELECT * FROM products WHERE Seller_mail = '" + seller + "'";

        Statement stat = connection.createStatement();

        ResultSet ret = stat.executeQuery(myProducts);

        while (ret.next()) {
            p = new Product();
            p.setP_id(ret.getInt("P_ID"));
            p.setP_name(ret.getString("P_Name"));
            p.setBrand(ret.getString("Brand"));
            p.setQty(ret.getInt("Qty"));
            p.setPrice(ret.getFloat("Price"));
            p.setDescription(ret.getString("Description"));
            p.setImgPath(ret.getString("Image_Path"));
            p.setType(ret.getString("Item_Type"));
            p.setSeller_mail(ret.getString("Seller_mail"));

            products.add(p);
        }
        return products;
    }

    public List<Product> myBid(int pid) throws SQLException {

        Connection con = DatabaseConnection.dbConnection();
        List<Product> p1 = new ArrayList<Product>();
        Product p = null;

        String view = "SELECT * FROM products WHERE P_ID = '" + pid + "'";

        Statement stat = con.createStatement();
        ResultSet ret = stat.executeQuery(view);

        while (ret.next()) {
            p = new Product();
            p.setP_id(ret.getInt("P_ID"));
            p.setP_name(ret.getString("P_Name"));
            p.setBrand(ret.getString("Brand"));
            p.setQty(ret.getInt("Qty"));
            p.setPrice(ret.getFloat("Price"));
            p.setDescription(ret.getString("Description"));
            p.setImgPath(ret.getString("Image_Path"));
            p.setType(ret.getString("Item_Type"));
            p.setSeller_mail(ret.getString("Seller_mail"));

            p1.add(p);
        }
        return p1;
    }

    public ResultSet validBid(int pid) throws SQLException {
        Connection connection = DatabaseConnection.dbConnection();

        String valid = "SELECT Price FROM products WHERE P_ID = '" + pid + "'";

        Statement statement = connection.createStatement();
        ResultSet ret = statement.executeQuery(valid);

        return ret;
    }


}

