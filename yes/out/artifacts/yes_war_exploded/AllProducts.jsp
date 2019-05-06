<%@ page import="Beans.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 5/7/2018
  Time: 4:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/dist/css/bootstrap.css">

    <script src="node_modules/jquery/dist/jquery.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
</head>

<body background="images/display.jpg" style="background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">

<%@include file="includes/header.jsp" %>

<div class="container">
    <div class="row">
        <div class="card-deck">
            <%
                List<Product> pro = (ArrayList) session.getAttribute("pro");
                Iterator<Product> iterator = pro.iterator();
                while (iterator.hasNext()) {
                    Product product = iterator.next();%>
            <form method="get" action="add">
                <div class="card">
                    <img src="<%=product.getImgPath()%>" alt="" class="card-img-top">
                    <div class="card-body">
                        <h4><%=product.getP_name()%>
                        </h4>
                        <label class="card-text" for="pid">
                            Product ID :
                        </label>
                        <input type="number" name="pid" id="pid" value="<%=product.getP_id()%>" readonly>
                        <p class="card-text">
                            Product Type : <%=product.getType()%>
                        </p>
                        <p class="card-text">
                            Brand : <%=product.getBrand()%>
                        </p>

                        <p class="card-text">
                            Description : <%=product.getDescription()%>
                        </p>

                        <p class="card-text">
                            Quantity remaining : <%=product.getQty()%>
                        </p>
                        <p class="card-text">
                            Seller : <%=product.getSeller_mail()%>
                        </p>

                        <p class="card-text">
                            Bid limit : <font color="red">$<%=product.getPrice()%>
                        </font>
                        </p>

                        <div>
                            <%if (session.getAttribute("Bidder") != null) {%>
                            <input type="number" name="retBid" required>
                            <input name="post" type="submit" class="btn btn-outline-success" value="Bid!">
                            <%}%>
                        </div>
                        <div>
                            <%if (session.getAttribute("admin") != null) {%>
                            <input type="number" name="retBid">
                            <input name="post" type="submit" class="btn btn-outline-success" value="Bid!">

                            <br>
                            <input name="post" type="submit" class="btn btn-outline-danger" value="Delete Post">

                            <%}%>
                        </div>

                    </div>
                </div>
            </form>
            <%
                }
            %>

        </div>
    </div>
</div>


<script>
    <%if (session.getAttribute("added") != null){%>
    alert('<%=session.getAttribute("added")%>') ;
    <%}else if (session.getAttribute("you failed") != null){%>
    alert('<%=session.getAttribute("you failed")%>');
    <%}else if (session.getAttribute("invalidBid") != null){%>
     alert(<%=session.getAttribute("invalidBid")%>);
    <%}%>
</script>

</body>
</html>