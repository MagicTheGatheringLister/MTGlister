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
<div class="mainC">
    <div class="cont">
        <p class="text">Please Log In</p>
        <div class="Login">

            <form action="/login" method="POST">

                <span class="fontawesome-user"></span><input type="text" name="username" required placeholder="Username"
                                                             autocomplete="off">
                <span class="fontawesome-lock"></span><input type="password" name="password" id="password" required
                                                             placeholder="Password" autocomplete="off">

                <input type="submit" value="Log In">

            </form>
        </div>
    </div>
</div>
</body>
</html>
