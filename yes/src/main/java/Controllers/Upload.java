package Controllers;

import Beans.Product;
import DBAccess.DBUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "upload", urlPatterns = "/upload")
public class Upload extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int rows = 0;
        HttpSession session = req.getSession();

        String name = req.getParameter("pname");
        String brand = req.getParameter("pbrand");
        int qty = Integer.parseInt(req.getParameter("pqty"));
        float price = Float.parseFloat(req.getParameter("pprice"));
        String description = req.getParameter("pdesc");
        String type = req.getParameter("ptype");
        String img = req.getParameter("pimg");
        String seller_mail = req.getParameter("psmail");




        DBUpload dbUpload = new DBUpload();

        Product product = new Product();
        product.setP_name(name);
        product.setBrand(brand);
        product.setQty(qty);
        product.setPrice(price);
        product.setDescription(description);
        product.setType(type);
        product.setImgPath(img);
        product.setSeller_mail(seller_mail);

        try {
            rows = dbUpload.upload(product);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (rows != 0){
            session.setAttribute("done", "Post added to pending list");
        }
        else {
            session.setAttribute("failed", "Couldn't accomplish request");
        }
        req.getRequestDispatcher("Sell.jsp").forward(req,resp);
    }
}
