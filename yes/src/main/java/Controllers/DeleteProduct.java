package Controllers;

import Beans.Product;
import DBAccess.DBSearch;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "delete", urlPatterns = "/delete")
public class DeleteProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String button = req.getParameter("act");
        int row = 0;
        HttpSession session = req.getSession();

        int id = Integer.parseInt(req.getParameter("pid"));

        if (button.equals("Authenticate")){
            String name = null;
            String brand = null;
            int qty = 0;
            float price = 0;
            String desc = null;
            String imgPath = null;
            String type = null;
            String sellerMail = null;
            String dead = null;

            DBSearch auth = new DBSearch();
            Product product = new Product();
            ResultSet ret = null;

            try {
                ret = auth.authenticate(id);
                while (ret.next()){
                    name = ret.getString("Temp_Name");
                    brand = ret.getString("Temp_Brand");
                    qty = ret.getInt("Temp_QTY");
                    price = ret.getFloat("Temp_Price");
                    desc = ret.getString("Temp_Description");
                    imgPath = ret.getString("Temp_Image");
                    type = ret.getString("Temp_Type");
                    sellerMail = ret.getString("Temp_Seller_mail");

                }
                product.setP_name(name);
                product.setBrand(brand);
                product.setQty(qty);
                product.setPrice(price);
                product.setDescription(desc);
                product.setImgPath(imgPath);
                product.setType(type);
                product.setSeller_mail(sellerMail);


                row = auth.permenant(product);

                if (row != 0){

                    session.setAttribute("product accepted", "Product added for bidding");
                    req.getRequestDispatcher("/pending").forward(req, resp);

                }
                else {
                    session.setAttribute("product failed", "Product couldn't be added successfully");
                    req.getRequestDispatcher("/pending").forward(req,resp);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }



            DBSearch del = new DBSearch();
            try {
                Product product = new Product();
                product.setP_id(id);
                System.out.println(id);

                assert false;
                row = del.delete(product);
                if (row != 0) {
                    if (button.equals("Reject")) {
                        System.out.println(row);
                        session.setAttribute("deleted", "Product Rejected");
                        req.getRequestDispatcher("/pending").forward(req, resp);
                    }
                } else {
                    System.out.println(row);
                    session.setAttribute("not deleted", "Product could not be deleted");
                    req.getRequestDispatcher("PendingList.jsp").forward(req, resp);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

    }
}
