<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        <jsp:include page="profile.css"/>
    </style>
    <style>
        .zoom {
            padding: 50px;
            transition: transform .2s; /* Animation */
            width: 200px;
            height: 200px;
            margin: 0 auto;
        }

        .zoom:hover {
            transform: scale(1.5); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
        }
    </style>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div id="content" class="content content-full-width">
                <!-- begin profile -->
                <div class="profile">
                    <div class="profile-header">
                        <!-- BEGIN profile-header-cover -->
                        <div class="profile-header-cover"></div>
                        <!-- END profile-header-cover -->
                        <!-- BEGIN profile-header-content -->
                        <div class="profile-header-content">
                            <!-- BEGIN profile-header-img -->
                            <div class="profile-header-img">
                                <%--Empty--%>
                            </div>
                            <!-- END profile-header-img -->
                            <!-- BEGIN profile-header-info -->
                            <div class="profile-header-info">
                                <h3 class="m-t-10 m-b-5">Welcome, ${sessionScope.user.username}!</h3>
                                <a href="#" class="btn btn-sm btn-info mb-2">Edit Profile</a>
                            </div>
                            <!-- END profile-header-info -->
                        </div>
                        <!-- END profile-header-content -->
                        <!-- BEGIN profile-header-tab -->
                        <ul class="profile-header-tab nav nav-tabs">
                            <li class="nav-item">
                                <a href="#profile-post" class="nav-link active show" data-toggle="tab">My Collection</a>
                            </li>
                        </ul>
                    </div>

                    <div class="container-fluid">
                        <div id="magic" class="row row-cols-6">
                        </div>
                    </div>
                    <div id="searchedCard">

                    </div>
<%--                    <form action="/ads/add-cards" method="post">--%>
<%--                        <input type="text" name="hiddenName" id="hiddenName"/>--%>
<%--                    </form>--%>
<%--                    <form action="/ads/add-cards" method="post">--%>
<%--                        <input type="text" name="hiddenImage" id="hiddenImage"/>--%>
<%--                    </form>--%>

                    <jsp:include page="/WEB-INF/partials/jQuery.jsp"/>
                    <script>
                        <jsp:include page="/WEB-INF/fetchCards.js" />
                    </script>
                </div>
            </div>

            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                    crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                    crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                    crossorigin="anonymous"></script>

</body>
</html>
