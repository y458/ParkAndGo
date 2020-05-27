<%-- 
    Document   : managePage
    Created on : Apr 28, 2020, 11:46:01 AM
    Author     : dimit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        ${userToManage.userName} ${userToManage.userSurname} Report Points: ${userToManage.userReportpoints} 
        <a href="addReportPoint/${userToManage.userId}">add Report point</a>
        <a href="ban/${userToManage.userId}">ban User</a>

    <c:if test="${userToManage.userActive=='3'}">
        Banned
    </c:if>
    <c:if test="${userToManage.userActive!='3'}">
        Active
    </c:if>

    <div class="container">
        <c:forEach items="${userReviews}" var="gar">
            <div class="row" style="border: 1px solid black; margin-top: 3px">
                <div class="col-3">

                    <c:forEach var = "i" begin = "1" end = "${gar.ureviewRating}">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </c:forEach>
                </div>
                <br/>
                <div class="col-8">

                    ${gar.ureviewComment}
                </div>
            </div>

        </c:forEach>
    </div>
</body>
</html>
