<%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 4/1/2018
  Time: 6:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>About</title>
    <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/dist/css/bootstrap.css">

    <script src="node_modules/jquery/dist/jquery.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
</head>

<body background="images/contact.jpg" style="background-repeat: no-repeat; background-attachment: fixed; background-size: cover">
<%@include file="includes/header.jsp"%>
<div class="container">
    <div class="row">
        <h1 id="about" style="color: azure;">About</h1>
    </div>
    <div class="row">
        <p style="color: azure">We are a leading business auction most essential items providing an interface for sellers and bidders to interact</p>
    </div>
    <div class="row">
        <h4 style="color: aquamarine">Countries we trade with: </h4>
    </div>
    <div class="row">
        <img class="img-fluid" src="images/flags-of-countries-ko8mf2zb.png">
    </div>
    <br>

    <div class="row">
            <h1 id="contact" style="color: azure;">Contact</h1>

    </div>
    <div class="row">
        <h4 style="color: blue">Facebook : <a href="https://www.facebook.com/"><img src="images/newfb.jpg"></a></h4>
    </div>
    <div class="row">
        <h4 style="color: purple">Instagram : <a href="https://www.instagram.com/accounts/emailsignup/?hl=en"><img src="images/newinsta.jpg"></a></h4>
    </div>


    <script>
        $('.dropdown-toggle').dropdown()
    </script>

</div>
</body>
</html>
