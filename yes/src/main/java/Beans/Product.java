package Beans;

public class Product {
    private int p_id;
    private String p_name;
    private String Brand;
    private int qty;
    private float price;
    private String description;
    private String imgPath;
    private String type;
    private String seller_mail;
    private float bid;

    public void setBid(float bid) {
        this.bid = bid;
    }

    public float getBid() {
        return bid;
    }


    public void setSeller_mail(String seller_mail) {
        this.seller_mail = seller_mail;
    }

    public String getSeller_mail() {
        return seller_mail;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setBrand(String brand) {
        Brand = brand;
    }

    public String getBrand() {
        return Brand;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_name() {
        return p_name;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getPrice() {
        return price;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public int getQty() {
        return qty;
    }

}
