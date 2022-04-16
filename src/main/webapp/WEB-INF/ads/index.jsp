<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    <jsp:include page="/WEB-INF/ads/index.css"/>
</style>
<div class="container">
    <h1>Here are all the decks</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <p>${ad.deckName}</p>
            <p>${ad.description}</p>
            <p>${ad.dateCreated}</p>
<%--            <p>${ad.userId}</p>--%>
            <form action="/view-deck" method="POST">
                <button type="submit" name="view_deck" id="view_deck" value="${ad.deckId}">View Deck</button>
            </form>
            <form action="/deck" method="POST">
            <button type="submit" name="deck_selected" id="deck_selected" value="${ad.deckId}">Select Deck</button>
            </form>

            <form action="/delete" method="POST">
                <button type="submit" name="delete_deck" id="delete_deck" value="${ad.deckId}">Delete</button>
            </form>
        </div>
    </c:forEach>
    <c:forEach var="card" items="${cards}">
        <div >
                ${card.cardName}
        </div>
        <div>
            <img src="${card.cardImage}">
        </div>
    </c:forEach>




</div>
<script>
    <jsp:include page="/WEB-INF/fetchCards.js" />
</script>

