<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <h1>Here are all the decks</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <p>${ad.description}</p>
            <p>${ad.dateCreated}</p>
            <p>${ad.deckName}</p>
            <p>${ad.userId}</p>
            <form action="/deck" method="POST">
            <button type="submit" name="deck_selected" id="deck_selected" value="${ad.deckId}">select deck</button>
            </form>
        </div>
    </c:forEach>
</div>

