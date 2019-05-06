<%@ page import="Beans.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 5/11/2018
  Time: 10:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Bids</title>
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
        <h1>View Bids</h1>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="card-deck">
                <%
                List<Product> p = (ArrayList) session.getAttribute("Bid");
                for(Product pro: p){
                    %>
            <form method="get" action="updateBid">
                <div class="card">
                    <div class="card-body">
                        <label class="card-text" for="pid">
                            Product ID :
                        </label>
                        <input type="text" name="pid" id="pid" value="<%=pro.getP_id()%>" readonly>

                        <label class="card-text" for="bid">
                            Bid :
                        </label>
                        <input type="text" name="bid" id="bid" value="<%=pro.getBid()%>" readonly>
                        <br>
                        <div class="row justify-content-center">
                            <input class="btn btn-outline-danger" type="submit" value="Delete" name="updateBid">
                            <input class="btn btn-outline-success" type="submit" value="View" name="updateBid">
                        </div>

                    </div>
                </div>
            </form>
                <%}%>

                    <script>
                        <%if (session.getAttribute("bidUpdated") != null){%>
                          alert('<%=session.getAttribute("bidUpdated")%>');
                        <%}%>
                    </script>
</body>
</html>
