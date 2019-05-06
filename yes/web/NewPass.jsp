<%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 4/26/2018
  Time: 12:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sell</title>
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
        <div class="col-lg-10">
            <form class="jumbotron" method="post" action="updateuser">
                <div class="row">
                    <h2 class="h2 justify-content-center">Change Password</h2>
                </div>
                <div class="form-group">
                    <label for="mail">Email : </label>
                    <input class="form-control" type="email" id="mail" name="mail" required>
                </div>
                <div class="form-group">
                    <label for="uname">Username : </label>
                    <input class="form-control" type="text" id="uname" name="uname" required>
                </div>
                <div class="form-group">
                    <label for="curpass">Current Password : </label>
                    <input class="form-control" type="password" id="curpass" name="curpass" required>
                </div>
                <div class="form-group">
                    <label for="newpass">New Password : </label>
                    <input class="form-control" type="password" id="newpass" name="newpass" required>
                </div>
                <div class="form-group">
                    <label for="confirm">Confirm New Password : </label>
                    <input class="form-control" type="password" id="confirm" name="confirm" required>
                </div>
                <% if (session.getAttribute("admin") == null){%>
                <div class="form-group">
                    <label for="chk1">Seller</label>
                    <input type="radio" id="chk1" name="check1" value="Seller" required>
                    <label for="chk2">Bidder</label>
                    <input type="radio" id="chk2" name="check1" value="Bidder">
                </div>
                <div class="form-group text-center">
                    <input type="submit" value="Change" id="change" name="change" class="btn btn-lg btn-success">
                </div>
                <%}
                else {%>
                <div class="form-group text-center">
                    <input type="submit" value="Change Admin Password" id="adminchange" name="change" class="btn btn-lg btn-success">
                </div>
                <%}%>
                <div class="form-group text-center">
                <input type="reset" value="Reset" id="reset" class="btn btn-lg btn-danger">
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    <%if (session.getAttribute("Incorrect") != null){%>
    alert('<%=session.getAttribute("Incorrect")%>');
    <%}
    else if (session.getAttribute("Mismatch") != null){%>
    alert('<%=session.getAttribute("Mismatch")%>');
    <%}
    else if (session.getAttribute("email mismatch") != null){%>
    alert('<%=session.getAttribute("email mismatch")%>');
    <%}
    else if (session.getAttribute("not changed") != null){%>
    alert('<%=session.getAttribute("not changed")%>');
    <%}
    else if (session.getAttribute("Pass changed") != null){%>
    alert('<%=session.getAttribute("Pass changed")%>');
    <%}%>
</script>

</body>
</html>
