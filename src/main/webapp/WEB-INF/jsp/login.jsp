<%-- 
    Document   : login
    Created on : Feb 26, 2020, 2:46:08 PM
    Author     : dimit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      
    </head>
    <body>
        <form action="/login" method="POST">
            <input type="text" placeholder="username" name="username">
            <input type="text" placeholder="password" name="password">
            <button type="submit">login</button>
        </form>
    </body>
</html>
