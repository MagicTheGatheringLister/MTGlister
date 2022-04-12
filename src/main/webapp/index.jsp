
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
    <div class="container-fluid">
        <div id="magic" class="row row-cols-6">
        </div>
    </div>
    <div id="searchedCard">

    </div>

<jsp:include page="/WEB-INF/partials/jQuery.jsp"/>
    <script>
<jsp:include page="/WEB-INF/fetchCards.js" />
    </script>
</body>
</html>
