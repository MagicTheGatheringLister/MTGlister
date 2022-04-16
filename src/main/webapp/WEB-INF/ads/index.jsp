


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="deck-display-card card">
    <div class="card-body">


        <c:forEach var="ad" items="${ads}">
            <div class="col-md-6">
                <h5 class="card-title">${ad.deckName}</h5>
                <p class="card-text">${ad.description}</p>
                <p class="card-text">Date Created: ${ad.dateCreated}</p>
<%--ad.rating should go here--%>
<%--                <p>${ad.userId}</p>--%>
                <form action="/deck" method="POST">
                    <button type="submit" name="deck_selected" id="deck_selected" value="${ad.deckId}">select deck
                    </button>
                </form>

                <form action="/delete" method="POST">
                    <button type="submit" name="delete_deck" id="delete_deck" value="${ad.deckId}">Delete</button>
                </form>
            </div>
        </c:forEach>
    </div>

    <c:forEach var="card" items="${cards}">
        <div class="hidden">
                ${card.cardName}
        </div>
        <div>
            <img class="hidden" src="${card.cardImage}">
        </div>
    </c:forEach>

</div>
<script>
    <jsp:include page="/WEB-INF/fetchCards.js" />
</script>

