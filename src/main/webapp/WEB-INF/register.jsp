<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
    <style>
        <jsp:include page="CSS/registration.css"/>
    </style>

</head>
<body>
<jsp:include page="partials/navbar.jsp"/>
<div class="container d-flex justify-content-center mt-5">
    <div class="Register">
        <form method="post" action="/register" id="form-login">
            <p class="text text-center pt-4 mb-5">Register</p>
            <div class="form-group container">
                <input type="text" name="username" required placeholder="Username" class="form-control form mt-3">
                <input type="text" id="email" name="email" required placeholder="Email" class="form-control form mt-3">
                <input type="password" name="password" id="password" required placeholder="Password" class="form-control form mt-3">
                <input type="password" name="confirm_password" id="confirm_password" required
                       placeholder="Confirm Password" class="form-control form mt-3">

                <button type="submit" value="Register" class="btn mt-4">Register Your Account</button>
            </div>

        </form>
    </div>
</div>
</body>
</html>

