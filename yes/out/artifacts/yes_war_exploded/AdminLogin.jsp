<%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 4/17/2018
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin?</title>
    <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/dist/css/bootstrap.css">

    <script src="node_modules/jquery/dist/jquery.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
</head>
<body>
<%@include file="includes/header.jsp" %>
<div class="container">
    <div class="row justify-content-center">
        <h1>Login</h1>
    </div>

</div>

<div class="container">
    <div class="row justify-content-center align-items-center">
        <div class="col-lg-8">
            <form id="myform1" class="jumbotron" method="post" name="form1" action="admin">
                <%--&lt;%&ndash;<a href="example">go to </a>&ndash;%&gt;--%>

                <div class="form-group">
                    <label for="name">Email</label>
                    <input type="email" class="form-control" id="name" name="email" required>
                </div>

                <div class="form-group ">
                    <label for="pass">Password</label>
                    <input type="password" class="form-control" id="pass" name="password" required>
                </div>

                <div class="form-group text-center">
                    <input type="submit" value="Submit" id="reg" class="btn btn-lg btn-danger">
                    <input type="reset" value="Reset" id="ret" class="btn btn-lg btn-dark">
                </div>
                <script>
                    <%if (session.getAttribute("not") != null){%>
                    alert('<%=session.getAttribute("not")%>');
                    <%session.invalidate();
                    }
                    else if (session.getAttribute("wrongPass") != null){%>
                    alert('<%=session.getAttribute("wrongPass")%>');
                    <%session.invalidate();
                    }%>
                </script>

            </form>

        </div>
    </div>
</div>
</body>
</html>
