<%@ page import="java.util.List" %>
<%@ page import="Beans.Product" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 5/18/2018
  Time: 7:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Bids</title>
    <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/dist/css/bootstrap.css">

    <script src="node_modules/jquery/dist/jquery.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
</head>

<body>
<%
    if (session.getAttribute("email") == null) {
        response.sendRedirect("Login.jsp");
    }
%>

<%@include file="includes/header.jsp" %>


<div class="container">
    <div class="row justify-content-center">
        <h1>My Bids</h1>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="card-deck">
            <%
                List<Product> p = (ArrayList) session.getAttribute("my");
                for (Product p1 : p) {
            %>
            <form method="get" action="updateBid">
                <div class="card">
                    <img src="<%=p1.getImgPath()%>" alt="" class="card-img-top">
                    <div class="card-body">
                        <h4><%=p1.getP_name()%>
                        </h4>
                        <p>
                            Product ID : <%=p1.getP_id()%>
                        </p>
                        <p class="card-text">
                            Product Type : <%=p1.getType()%>
                        </p>
                        <p class="card-text">
                            Brand : <%=p1.getBrand()%>
                        </p>

                        <p class="card-text">
                            Description : <%=p1.getDescription()%>
                        </p>

                        <p class="card-text">
                            Quantity remaining : <%=p1.getQty()%>
                        </p>
                        <p class="card-text">
                            Seller : <%=p1.getSeller_mail()%>
                        </p>

                        <p class="card-text">
                            Bid limit : <font color="red">$<%=p1.getPrice()%>
                        </font>
                        </p>


                    </div>
                </div>
            </form>
            <%}%>

        </div>
    </div>
</div>

</body>
</html>
