<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mario
  Date: 4/15/22
  Time: 8:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>

  <div class="container">
      <c:forEach var="us" items="${allUsers}">
          <p>id: ${us.id}</p>
          <p>username: ${us.username}</p>
          <c:forEach var="ad" items="${ads}">

              <div class="col-md-6">
                  <p>Deck Name: ${ad.deckName}</p>
                  <p>Date Created: ${ad.dateCreated}</p>
                      <%--            <p>${ad.userId}</p>--%>
              </div>
              <c:forEach var="card" items="${cards}">
                  <div >
                          ${card.cardName}
                  </div>
                  <div>
                      <img src="${card.cardImage}">
                  </div>
              </c:forEach>
          </c:forEach>
      </c:forEach>

  </div>

  </body>
</html>
