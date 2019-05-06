<%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 4/1/2018
  Time: 5:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/dist/css/bootstrap.css">

    <script src="node_modules/jquery/dist/jquery.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
</head>

<body background="images/reg.png" style="background-size: cover; background-attachment: fixed; background-repeat: no-repeat" >
<%@include file="includes/header.jsp" %>
<div class="container">
    <div class="row justify-content-center">
        <h1>Register</h1>
    </div>

</div>



<div class="container">
    <div class="row justify-content-center align-items-center">
        <div class="col-lg-8">
            <form id="myform2" class="jumbotron" method="post" name="form2" action="Register">
                <%--&lt;%&ndash;<a href="example">go to </a>&ndash;%&gt;--%>

                <div class="form-group">
                    <label for="name">Username</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group ">
                    <label for="pass">Password</label>
                    <input type="password" class="form-control" id="pass" name="pass" required>
                </div>
                <div class="form-group ">
                    <label for="cpass">Confirm password</label>
                    <input type="password" class="form-control" id="cpass" name="cpass" required>
                </div>

                <div class="form-group">
                    <label for="chk1">Seller</label>
                    <input type="radio" id="chk1" name="check" value="Seller" required>
                    <label for="chk2">Bidder</label>
                    <input type="radio" id="chk2" name="check" value="Bidder">

                </div>
                <div class="form-group text-center">
                    <input type="submit" value="Submit" id="reg" class="btn btn-lg btn-danger">
                    <input type="reset" value="Reset" id="ret" class="btn btn-lg btn-dark">
                </div>
                <script>
                    <%if (session.getAttribute("accountExist") != null){%>
                    alert('<%=session.getAttribute("accountExist")%>') ;
                    <%session.invalidate();
                    }
                    else if (session.getAttribute("compare") != null){%>
                    alert('<%=session.getAttribute("compare")%>');
                    <%session.invalidate();
                    }
                    else if (session.getAttribute("result") != null){ %>
                    alert('<%=session.getAttribute("result")%>');
                    <% session.invalidate();%>
                    document.write('<div class="form-group text-center"><a href="Login.jsp">Login</a></div>');
                    <%}%>

                </script>
            </form>

        </div>
    </div>
</div>

</body>
</html>
