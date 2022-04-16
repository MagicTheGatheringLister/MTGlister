<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <jsp:include page="/WEB-INF/partials/head.jsp"/>
    <style>
        <jsp:include page="/WEB-INF/CSS/index.css"/>
    </style>
</head>
<div class="container">
    <h1>Here are all the decks</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <p>Deck Name: ${ad.deckName}</p>
            <p>Deck Description: ${ad.description}</p>
            <p>Date Created: ${ad.dateCreated}</p>
                <%--            <p>${ad.userId}</p>--%>
            <div class="d-flex">
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
        </div>
    </c:forEach>

    <div class="row row-cols-6">
        <c:forEach var="card" items="${cards}">

            <div><p>${card.cardName}</p>
                <img src="${card.cardImage}" style="width: 235px; height: 300px;" class="card-img-top" alt="...">
            </div>

        </c:forEach>
    </div>




</div>
<script>
    <jsp:include page="/WEB-INF/fetchCards.js" />
</script>

