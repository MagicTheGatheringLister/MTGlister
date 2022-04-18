<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <jsp:include page="/WEB-INF/partials/head.jsp"/>
    <style>
        <jsp:include page="/WEB-INF/CSS/index.css"/>
    </style>
</head>
<h1>Here are all the decks</h1>
<div class="container row">


    <c:forEach var="ad" items="${ads}">
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-body">
                    <h3 class="card-title">${ad.deckName}</h3>
                    <p class="text" style="">Deck Description: ${ad.description}</p>
                    <h6 class="ard-subtitle mb-2 text-muted">Date Created: ${ad.dateCreated}</h6>


                        <%--            <p>${ad.userId}</p>--%>
                    <div class="card-btns row">
                        <form action="/view-deck" method="POST">
                            <button class="btn ml-2 mr-1" type="submit" name="view_deck" id="view_deck" value="${ad.deckId}">View
                                Deck
                            </button>
                        </form>
                        <form action="/deck" method="POST">
                            <button class="btn mx-1" type="submit" name="deck_selected" id="deck_selected"
                                    value="${ad.deckId}">Select Deck
                            </button>
                        </form>

                        <form action="/delete" method="POST">
                            <button class="btn mx-1" type="submit" name="delete_deck" id="delete_deck" value="${ad.deckId}">
                                Delete
                            </button>
                        </form>
                    </div>

                </div>
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

