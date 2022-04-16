<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">

        <jsp:param name="title" value="Please Log In"/>
    </jsp:include>
    <style>
        <jsp:include page="login.css"/>
    </style>
</head
<body style="">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<%--<div class="mainC">--%>
<%--    <div class="cont">--%>
<div class="container d-flex justify-content-center mt-5">

    <div class="Login">
        <form action="/login" method="POST" id="form-login">
            <p class="text text-center pt-4 mb-5">Please Log In!</p>
            <div class="form-group container">
                <input type="text" name="username" placeholder="username" class="form-control form mt-3">
                <input type="password" name="password" placeholder="password" class="form-control mt-3">
                <button type="submit" value="Log In" class="btn mt-4">Log In</button>
            </div>




        </form>
    </div>

</div>
</body>
</html>



