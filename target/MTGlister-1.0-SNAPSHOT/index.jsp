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
        <div id="magic" style="padding-left: 50px" class="row row-cols-6">
        </div>
    </div>
    <script>
        let promises = [];
        const fetchMagicCards = () => {

            let url = `https://api.magicthegathering.io/v1/cards`;
            console.log(url)
            fetch(url)
                .then((response) => response.json())
                .then((json) => {
                    promises.push(json)
                    for(let i = 0; i < promises[0].cards.length; i++) {
                        console.log(promises[0].cards[i].imageUrl)
                        if (promises[0].cards[i].imageUrl == undefined){

                        }else{
                            $("#magic").append(`<img alt="MagicCard" src="${promises[0].cards[i].imageUrl}">`)
                        }

                    }})};

        fetchMagicCards();
    </script>
</body>
</html>
