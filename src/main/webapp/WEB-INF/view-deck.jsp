<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: noahbruno
  Date: 4/15/22
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="card" items="${cards}">
    <div >
            ${card.cardName}
    </div>
    <div>
        <img src="${card.cardImage}">
    </div>
</c:forEach>
</body>
</html>
