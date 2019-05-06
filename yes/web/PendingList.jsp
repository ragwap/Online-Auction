<%@ page import="Beans.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 4/20/2018
  Time: 11:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Products</title>
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
<div class="container">
    <div class="row justify-content-center">
        <h1 class="h1">Pending Products</h1>
    </div>
</div>

<div>
    <%
        if (session.getAttribute("email") != null) {
            if (session.getAttribute("admin") != null) {
    %>
    <div class="container">

        <div class="row justify-content-center float-lg-right">
            <%@include file="includes/Profile.jsp" %>
        </div>
    </div>


    <%
            }
        }
    %>
</div>
<script>
    <%if (session.getAttribute("deleted") != null){%>
    alert('<%=session.getAttribute("deleted")%>');
    <%}
    else if (session.getAttribute("not deleted") != null){%>
    alert('<%=session.getAttribute("not deleted")%>');
    <%}%>
</script>

<div class="container">
    <div class="row">
        <div class="card-deck">
                <%List<Product> pro = (ArrayList) session.getAttribute("pending");
                for (Product product : pro) {
            %>
            <form action="/delete" method="get">
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
                        <input type="submit" name="act" value="Authenticate" class="btn btn-block btn-outline-success">
                        <input type="submit" name="act" value="Reject" class="btn btn-block btn-outline-danger">


                    </div>
                </div>
            </form>
            <%
                }
//                }
            %>
        </div>
    </div>
</div>

<script>
    <%if (((ArrayList) session.getAttribute("pending")).size() == 0){%>
        alert('Pending List is empty');
    <%}
    else if (session.getAttribute("product accepted") != null){%>
        alert('<%=session.getAttribute("product accepted")%>');
    <%} %>

</script>
</body>
</html>
