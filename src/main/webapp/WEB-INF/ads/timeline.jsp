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
    <jsp:include page="/WEB-INF/partials/head.jsp"/>
  </head>
  <body>
  <jsp:include page="/WEB-INF/partials/navbar.jsp"/>

  <div class="container">
      <c:forEach var="us" items="${allUsers}">
          <div class="card">
              <div class="card-body">
          <p>id: ${us.id}</p>
                  <h5 class="card-title">${us.username}</h5>
          <c:forEach var="ad" items="${ads}">

              <div class="col-md-6">
                  <p class="card-subtitle">${ad.deckName}</p>
                  <p>Date Created: ${ad.dateCreated}</p>
                      <%--            <p>${ad.userId}</p>--%>
              </div>
              </div>
              <c:forEach var="card" items="${cards}">
                  <div >
                      <p class="card-text"><small class="text-lead">${card.cardName}</small></p>
                  </div>
                  <div>
                      <img src="${card.cardImage}" style="height: 30px; width: 40px;" class="card-img-bottom" alt="card">
                  </div>
              </c:forEach>
          </c:forEach>
      </div>
      </c:forEach>

  </div>
  <jsp:include page="/WEB-INF/partials/jQuery.jsp"/>
  </body>
</html>








