<%@ page import="Beans.Users" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 4/30/2018
  Time: 4:22 PM
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
    </div>
</div>
<%}%>

<div class="container">
    <div class="row justify-content-center">
        <h1>Registered Users</h1>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="card-deck">
                <%
                List<Users> u = (ArrayList) session.getAttribute("viewuser");
                Iterator<Users> iterator = u.iterator();
                while (iterator.hasNext()){
                    Users users = iterator.next();
            %>
            <form method="get" action="deluser">
                <div class="card">
                    <div class="card-body">
                        <label class="card-text" for="umail">
                            User Mail :
                        </label>
                        <input type="email" name="umail" id="umail" value="<%=users.getEmail()%>" readonly>

                        <label class="card-text" for="utype">
                            User Type :
                        </label>
                        <input type="text" name="utype" id="utype" value="<%=users.getType()%>" readonly>
                        <br>
                        <%if (!users.getType().equals("Admin")){%>
                        <div class="row justify-content-center">
                        <input class="btn btn-danger" type="submit" value="Delete">
                        </div>
                        <%}%>
                    </div>
                </div>
            </form>
                <%}%>

                    <script>
                        <%if (session.getAttribute("userDeleted") != null){%>
                          alert('<%=session.getAttribute("userDeleted")%>');
                        <%}
                        else if (session.getAttribute("userNot") != null){%>
                           alert('<%=session.getAttribute("userNot")%>');
                       <% }%>
                    </script>

</body>
</html>
