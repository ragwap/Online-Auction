<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 4/15/2018
  Time: 8:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("email") == null){
        response.sendRedirect("Login.jsp");
    }
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../node_modules/bootstrap/dist/css/bootstrap.css">
    <script src="../node_modules/jquery/dist/jquery.js"></script>
    <script src="../node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
</head>
<body>

<form class="jumbotron" method="get" action="logout">
    <%if (session.getAttribute("username") != null) {%>
    <h2 class="h2 form-group text-center">Welcome <%=session.getAttribute("username")%>
    </h2>
    <h4 class="h4 form-group text-center">Details</h4>
    <div class="text-center">
        <img class="form-group" src="../images/avatar.jpeg"><br>
    </div>

    <p class="form-group text-center">Email : <a href="https://accounts.google.com"
                                                 target="_blank"><%=session.getAttribute("email")%>
    </a>
    </p>
    <p class="form-group text-center">User Type : <%if (session.getAttribute("admin") != null) {%>
        <%=session.getAttribute("admin")%>
        <%} else {%>
        <%=session.getAttribute("type")%>
        <%}%>
    </p>
    <%}%>



    <%if (session.getAttribute("admin") != null) {%>
    <%--<form method="get" action="pending">--%>
    <%--<div class="form-group text-center">--%>
    <%--<input type="submit" value="View Pending List" class="btn btn-outline-success">--%>
    <%--</div>--%>
    <%--</form>--%>
    <div class="form-group form-group text-center">
        <a class="btn btn-outline-secondary" href="pending">View Pending list</a>
    </div>
    <div class="form-group form-group text-center">
        <a class="btn btn-outline-secondary" href="view">View Registered Users</a>
    </div>

    <%
        }
        if (session.getAttribute("Bidder") != null) {
    %>
    <div class="form-group form-group text-center">
        <a class="btn btn-outline-primary" href="/viewBid">View My Bids</a>
    </div>
    <%}%>

    <%
        if (session.getAttribute("Seller") != null) {
    %>
    <div class="form-group form-group text-center">
        <a class="btn btn-outline-primary" href="/myProducts">Update added items</a>
    </div>
    <%}%>
    <div class="form-group form-group text-center">
        <a class="btn btn-outline-success" href="NewPass.jsp">Change Password</a>
    </div>
    <div class="form-group text-center">
        <input type="submit" class="btn btn-outline-danger justify-content-center" value="Logout">
    </div>
</form>

</body>
</html>
