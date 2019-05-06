<%--
  Created by IntelliJ IDEA.
  User: GURA
  Date: 4/4/2018
  Time: 6:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<div>
    <div class="row justify-content-center bg-danger">
        <h1 class="bg-warning m-0 font-italic">BidQ.lk</h1>
    </div>
</div>
<div class="container">
    <nav class="navbar navbar-expand-lg bg-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="menu">
            <ul class="nav nav-fill d-lg-flex d-block">
                <li class="nav-item"><a class="nav-link" href="index.jsp" aria-pressed="true">Home</a>
                </li>
                <%if (session.getAttribute("email") == null) {%>
                <li class="nav-item active">
                    <a class="nav-link" href="Login.jsp" aria-pressed="true">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Register.jsp" aria-pressed="true">Register</a>
                </li>
                <%}%>

                <li class="nav-item active">
                    <a class="nav-link" href="viewPro" aria-pressed="true">View Products</a>

                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href=""
                       aria-expanded="false" aria-haspopup="true">About Us</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="About.jsp#contact">Contact Us</a>
                        <a class="dropdown-item" href="About.jsp#about">About</a>
                    </div>
                </li>
                <%if (session.getAttribute("Seller") != null) {%>
                <li class="nav-item">
                    <a class="nav-link" href="Sell.jsp" aria-pressed="true">Sell</a>

                </li>

                <%}%>
                <%if (session.getAttribute("email") != null){%>
                <li class="nav-item">
                    <a class="nav-link" href="MyProfile.jsp" aria-pressed="true">My Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout" aria-pressed="true">Logout</a>

                </li>

                <%}%>
                <%--<li class="nav-item dropdown">--%>
                <%--<a class="nav-link dropdown-toggle" data-toggle="dropdown" href=""--%>
                <%--aria-expanded="false" aria-haspopup="true">Category</a>--%>
                <%--<div class="dropdown-menu">--%>
                <%--<a class="dropdown-item" href="display">Electric Items</a>--%>
                <%--<a class="dropdown-item" href="display">Sports Equipment</a>--%>
                <%--<a class="dropdown-item" href="display">Musical Instruments</a>--%>
                <%--</div>--%>
                <%--</li>--%>
            </ul>
            <form class="form-inline m-0 d-lg-none d-block" action="search" method="get">
                <div class="form-group">
                    <input type="text" id="search2" class="form-control mr-1" placeholder="Enter keyword"
                           name="keyword">
                    <button class="btn btn-outline-success">Search</button>
                </div>

            </form>
        </div>
        <form class="form-inline m-0 d-lg-block d-none" action="search" method="get">
            <div class="form-group">
                <input type="text" id="search" class="form-control mr-1" placeholder="Enter keyword" name="keyword">
                <button class="btn btn-outline-success">Search</button>
            </div>
        </form>
    </nav>
</div>

