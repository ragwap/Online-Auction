<%@ page import="Beans.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 5/12/2018
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Items</title>
    <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/dist/css/bootstrap.css">

    <script src="node_modules/jquery/dist/jquery.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
</head>

<body>
<%
    if (session.getAttribute("email") == null){
        response.sendRedirect("Login.jsp");
    }
%>

<%@include file="includes/header.jsp" %>
<%if (session.getAttribute("email") != null) {%>
<div class="container">

    <div class="row justify-content-center float-lg-right">
        <%@include file="includes/Profile.jsp" %>
        <%}%>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="card-deck">
            <%
                List<Product> pro = (ArrayList) session.getAttribute("updateItems");
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

                        <%if (session.getAttribute("updatePressed") == null) {%>
                        <p class="card-text">
                            Quantity remaining : <%=product.getQty()%>
                        </p>
                        <%} else if (session.getAttribute("updatePressed") != null) {%>
                        <label for="qty">Quantity remaining : </label>
                        <input id="qty" type="number" name="qty" value="<%=product.getQty()%>">
                        <%}%>

                        <p class="card-text">
                            Seller : <%=product.getSeller_mail()%>
                        </p>

                        <%if (session.getAttribute("updatePressed") == null) {%>
                        <p class="card-text">
                            Bid limit : <font color="red">$<%=product.getPrice()%>
                        </font>
                                <%}
                                else if (session.getAttribute("updatePressed") != null){%>
                            <label for="price"> Bid Limit : </label>
                            <input id="price" type="number" name="price" value="<%=product.getPrice()%>">
                                <%}%>
                        <div>
                            <input name="post" type="submit" class="btn btn-outline-danger" value="Delete Post">
                            <input name="post" type="submit" class="btn btn-outline-primary" value="End Bid">
                        <%if (session.getAttribute("updatePressed") == null){%>
                            <input name="post" type="submit" class="btn btn-outline-success" value="Update">
                        <% }
                        else if (session.getAttribute("updatePressed") != null){%>
                        <input name="post" type="submit" class="btn btn-outline-success" value="Save Changes">
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
    <% if (session.getAttribute("won") != null){%>
    alert('Successful Bidder : <%=session.getAttribute("won")%> Price : <%=session.getAttribute("max")%>');
    <%}%>
</script>

<script>
    <%if (session.getAttribute("updatedCurrents") != null){%>
      alert('<%=session.getAttribute("updatedCurrents")%>');
    <%}%>
</script>

</body>
</html>
