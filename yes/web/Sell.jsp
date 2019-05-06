<%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 4/16/2018
  Time: 3:34 PM
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

<body background="images/fail-2.jpg" style="background-repeat: no-repeat; background-attachment: fixed; background-size: cover">
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
        <%}%>
    </div>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <form  method="post" action="upload" style="-moz-opacity: initial">
                <div class="row">
                    <h2 class="h2 justify-content-center">Add Products</h2>
                </div>

                <div class="form-group">
                    <label for="pname">Product Name : </label>
                    <input class="form-control" type="text" id="pname" name="pname" required>
                </div>

                <div class="form-group">
                    <label for="pbrand">Brand : </label>
                    <input class="form-control" type="text" id="pbrand" name="pbrand" required>
                </div>
                <div class="form-group">
                    <label for="pqty">Quantity Available : </label>
                    <input class="form-control" type="number" id="pqty" name="pqty" required>
                </div>
                <div class="form-group">
                    <label for="pprice">Price per unit : </label>
                    <input class="form-control" type="number" id="pprice" name="pprice" required>
                </div>
                <div class="form-group">
                    <label for="pimg">Product image path : </label>
                    <select class="form-control" id="pimg" name="pimg">
                        <option name="pimg">images/electric.jpg</option>
                        <option name="pimg">images/music.jpg</option>
                        <option name="pimg">images/sports.jpg</option>
                    </select>
                    <%--<input type="file" id="pimg" name="pimg">--%>
                </div>
                <div class="form-group">
                    <label for="pdesc">Description : </label>
                    <input type="text" id="pdesc" name="pdesc" class="form-control">
                </div>
                <div class="form-group">
                    <label for="ptype">Product Type : </label>
                    <select class="form-control" id="ptype" name="ptype">
                        <option name="ptype">Electric Item</option>
                        <option name="ptype">Musical Instrument</option>
                        <option name="ptype">Sports Equipment</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="psmail">Seller Mail : </label>
                    <input type="email" id="psmail" name="psmail" class="form-control"
                           value="<%=session.getAttribute("email")%>" readonly>
                </div>

                <div class="form-group text-center">
                    <input type="submit" value="Submit for Approval" class="btn btn-success">
                    <input type="reset" value="Reset" class="btn btn-danger">
                </div>

            </form>
        </div>
    </div>
    <script>
        <%if (session.getAttribute("email") != null){
        if (session.getAttribute("done") != null){%>
        alert('<%=session.getAttribute("done")%>');
        <%
        }
        }else {%>
        alert('<%=session.getAttribute("failed")%>');
        <%
        }%>
    </script>

</div>
</body>
</html>
