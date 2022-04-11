<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
    <style>
        <jsp:include page="registration.css"/>
    </style>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />
<p class="text">Register</p>
<div class="Register">
    <form method="post" action="/register.jsp">

        <span class="fontawesome-user"></span><input type="text" required placeholder="Username" autocomplete="off">
        <span class="fontawesome-envelope-alt"></span><input type="text" id="email" required placeholder="Email" autocomplete="off">
        <span class="fontawesome-lock"></span><input type="password" name="password" id="password" required placeholder="Password" autocomplete="off">
        <input type="submit" value="Register" title="Register Your Account">

</body>
</html>

