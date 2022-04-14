
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="d-flex justify-content-center">
        <h1>Welcome to the Magic card lister</h1>
    </div>
    <div class="d-flex justify-content-center">
        <h3>Make a profile, select any cards you want and add them to a deck!</h3>
    </div>
    <div class="container-fluid">
        <div id="magic" class="row row-cols-6">
        </div>
    </div>
    <div id="searchedCard">

    </div>
    <form action="/ads/add-cards" id="myForm" method="post">
        <input type="text" name="hiddenName" id="hiddenName"/>
        <input type="text" name="hiddenImage" id="hiddenImage"/>

        <%--use this to simplify our navbar jsp when we are logged in--%>
        <%
            if (request.getSession().getAttribute("user") == null) { %>
        <button type="submit" disabled="disabled">Submit</button>
       <% } else { %>
        <button type="submit" id="submit">Submit</button>
       <% } %>
<%--        <button type="submit">submit</button>--%>
    </form>

<jsp:include page="/WEB-INF/partials/jQuery.jsp"/>
    <script>
<jsp:include page="/WEB-INF/fetchCards.js" />
    </script>
</body>
</html>
