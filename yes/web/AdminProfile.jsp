<%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 4/17/2018
  Time: 7:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Profile</title>
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
<%
    if (session.getAttribute("email") != null) {
        if (session.getAttribute("admin") != null) {
%>
<%@include file="includes/Profile.jsp" %>
<%
        }
    }
%>
</body>
</html>
