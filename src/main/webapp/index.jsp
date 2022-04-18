<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
    <style>
        <jsp:include page="/WEB-INF/CSS/homepage.css"/>
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container justify-content-center col-lg-12">


        <div class="d-flex justify-content-center row">
            <h1 class="head d-flex col-lg-11 justify-content-center">Welcome to the Magic card lister</h1>
        </div>
        <div class="d-flex justify-content-center row">
            <h3 class=" head d-flex col-lg-11 justify-content-center">Make a profile, select any cards you want and add them to a deck!</h3>
        </div>
    <div class="container-fluid d-flex row justify-content-center">
        <div id="magic" class="col-sm-6 col-md-3 justify-content-center">

        </div>
    </div>


    <div id="searchedCard">

    </div>

    <form action="/ads/add-cards" name="myForm" id="myForm" method="post">
        <input type="text" class="hidden" name="hiddenName" id="hiddenName"/>
        <input type="text" class="hidden" name="hiddenImage" id="hiddenImage"/>
        <%--use this to simplify our navbar jsp when we are logged in--%>
        <%--        <%--%>
        <%--            if (request.getSession().getAttribute("user") == null) { %>--%>
        <%--        <button type="submit" disabled="disabled">Submit</button>--%>
        <%--       <% } else { %>--%>
        <%--        <button type="submit" id="submit">Submit</button>--%>
        <%--       <% } %>--%>
        <%--        <button type="submit">submit</button>--%>
    </form>
</div>
<jsp:include page="/WEB-INF/partials/jQuery.jsp"/>
<script>
    <jsp:include page="/WEB-INF/fetchCards.js" />
</script>

</body>
</html>
