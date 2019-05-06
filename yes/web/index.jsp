<%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 3/30/2018
  Time: 11:00 AM
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

<body background="images/1.jpg" style="background-size: cover; background-attachment: fixed; background-repeat: no-repeat">
<%@include file="includes/header.jsp" %>

<div class="container">
    <div class="row">
        <div id="caro" class="carousel slide m-5" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#slide" data-slide-to="0" class="active"></li>
                <li data-target="#slide" data-slide-to="1"></li>
                <li data-target="#slide" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="images/1c33f96a9f3709006fb1a81841fc2f0e.jpg"
                         alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/2.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/3.jpg" alt="Third slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/Untitled.jpg" alt="Third slide">
                </div>

            </div>
            <a class="carousel-control-prev" href="#caro" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#caro" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>
<div class="container">
    <div class="row justify-content-center bg-secondary">
        <h2 class="font-italic font-weight-bold" style="color: azure">You name it, We have it!</h2>
    </div>
</div>
<script>

</script>

</body>
</html>
