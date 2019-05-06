<%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 3/30/2018
  Time: 12:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/dist/css/bootstrap.css">

    <script src="node_modules/jquery/dist/jquery.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
</head>

<body background="images/login.jpg" style="background-repeat: no-repeat; background-attachment: fixed; background-size: cover">
<%@include file="includes/header.jsp" %>
<div class="container">
    <div class="row justify-content-center">
        <h1>Login</h1>
    </div>

</div>

<div class="container">
    <div class="row justify-content-center align-items-center">
        <div class="col-lg-8">
            <form id="myform1" class="jumbotron" method="post" name="form1" action="login">
                <%--&lt;%&ndash;<a href="example">go to </a>&ndash;%&gt;--%>

                <div class="form-group">
                    <label for="name">Email</label>
                    <input type="email" class="form-control" id="name" name="email" required>
                </div>

                <div class="form-group ">
                    <label for="pass">Password</label>
                    <input type="password" class="form-control" id="pass" name="password" required>
                </div>
                <div class="form-group">
                    <label for="chk1">Seller</label>
                    <input type="radio" id="chk1" name="check1" value="Seller" required>
                    <label for="chk2">Bidder</label>
                    <input type="radio" id="chk2" name="check1" value="Bidder">
                </div>
                <div class="form-group text-center">
                    <input type="submit" value="Submit" id="reg" class="btn btn-lg btn-danger">
                    <input type="reset" value="Reset" id="ret" class="btn btn-lg btn-dark">
                </div>
                <div class="form-group text-center">
                    <a href="AdminLogin.jsp">Admin?</a>
                </div>
                <script>
                    <%if (session.getAttribute("wrong") != null){%>
                    alert('<%=session.getAttribute("wrong")%>');
                    <%session.invalidate();}
                    else if (session.getAttribute("wrongMail") != null){%>
                    alert('<%= session.getAttribute("wrongMail")%>');
                    <%session.invalidate();}
                    else if (session.getAttribute("wrongPass") != null){%>
                    alert('<%=session.getAttribute("wrongPass")%>');
                    <%session.invalidate();}
                    else if (session.getAttribute("wrongDetails") != null){%>
                    alert('<%=session.getAttribute("wrongDetails")%>');
                    <%session.invalidate();}
                    else if (session.getAttribute("wrongType") != null){%>
                    alert('<%=session.getAttribute("wrongType")%>');
                    <%session.invalidate();}%>

                </script>

            </form>

        </div>
    </div>
</div>


</body>
</html>

