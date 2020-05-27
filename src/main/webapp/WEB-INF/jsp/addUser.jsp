<%-- 
    Document   : addUser
    Created on : Feb 25, 2020, 11:25:14 AM
    Author     : dimit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>JSP Page</title>

        <style>
            .error{
                background-color: red;
            }
        </style>

    </head>
    <body>
        <div class="container">
            <form:form method="POST" action="/addUser" modelAttribute="newUser">
                <div class="form-group">
                    <form:label path="userName">userName</form:label>
                    <form:input class="form-control" type="text" path="userName" />
                    <form:errors path="userName" class="error"/>
                </div>
                <div class="form-group">
                    <form:label path="userSurname">userSurname</form:label>
                    <form:input class="form-control" type="text" path="userSurname" />
                    <form:errors path="userSurname" class="error"/>
                </div>
                <div class="form-group">
                    <form:label path="userEmail">userEmail</form:label>
                    <form:input class="form-control" type="text" path="userEmail" />
                    <form:errors path="userEmail" class="error"/>
                </div>
                <div class="form-group">
                    <form:label path="userUsername">userUsername</form:label>
                    <form:input class="form-control" type="text" path="userUsername" />
                    <form:errors path="userUsername" class="error"/>
                </div>
                <div class="form-group">
                    <form:label path="userPassword1">userPassword</form:label>
                    <form:input class="form-control" type="password" path="userPassword1" />
                    <form:errors path="userPassword1" class="error"/>
                </div>
                <div class="form-group">
                    <form:label path="userPassword2">RetypePassword</form:label>
                    <form:input class="form-control" type="password" path="userPassword2" />
                    <form:errors path="userPassword2" class="error"/>
                </div>
                <div  class="row">
                    <div  class="row">
                        <div class="col-md-5"></div>
                        <div class="col-md-2"><input class="btn btn-primary" type="submit" value="Submit"/></div>
                        <div class="col-md-5"></div>
                    </div>
                </form:form>
                    
            </div>
            
            <a href="/loginForm">login</a>
    </body>
</html>
