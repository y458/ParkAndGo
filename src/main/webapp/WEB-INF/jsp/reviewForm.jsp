<%-- 
    Document   : reviewForm
    Created on : Apr 15, 2020, 10:44:25 AM
    Author     : dimit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Review form for user ${userToReview.userName} ${userToReview.userSurname}</h1>

         <table class="table table-bordered">

            <thead style="font-weight: bold;">
            <td>#</td>
            <td>name</td>
            <td>quantity</td>
            <td colspan="2">Actions</td>
            </thead>
            <tbody>
            <c:forEach items="${toUserReviews}" var="gar">
                <tr>
                    <td>${gar.ureviewRating}</td>
                    <td>${gar.ureviewComment}</td>
                    
                </tr>
            </c:forEach>
            </tbody>
        </table>
        
        
        <form method="post" action="addReview/${userToReview.userId}">
            <input type="radio" id="1star" name="stars" value="1">
            <label for="1star">1Star</label>
            <input type="radio" id="2star" name="stars" value="2">
            <label for="2star">2Star</label>
            <input type="radio" id="3star" name="stars" value="3">
            <label for="3star">3Star</label>
            <input type="radio" id="4star" name="stars" value="4">
            <label for="4star">4Star</label>
            <input type="radio" id="5star" name="stars" value="5">
            <label for="5star">5Star</label><br>

            <label for="comment">Comments:</label>
            <input type="text" id="comment" name="comment">
            
            <button type="submit">Submit Review</button>
        </form>
    </body>
</html>
