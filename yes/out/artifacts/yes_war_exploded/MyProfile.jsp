<%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 5/5/2018
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Profile</title>
    <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/dist/css/bootstrap.css">

    <script src="node_modules/jquery/dist/jquery.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
</head>

<body>


<%@include file="includes/header.jsp" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <%@include file="includes/Profile.jsp"%>
        </div>
    </div>
</div>


</body>
</html>
