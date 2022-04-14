<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <h1>Here are all the decks</h1>
<ul>
    <c:forEach var="ad" items="${ads}">
            <li>${ad.description}</li>
            <li>${ad.dateCreated}</li>
            <li>${ad.deckName}</li>
            <li>${ad.userId}</li>
            <li>${ad.deckId}</li>
    </c:forEach>

</ul>

</div>
<script>

</script>
