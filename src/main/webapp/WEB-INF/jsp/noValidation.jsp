<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dimit
  Date: 07-Mar-20
  Time: 10:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <h1>
            Sry, no validation

            <form action="/resendConfirmation" method="get">
                resend to
                <input type="text" placeholder="email" name="mail">
                <button type="submit">resend confirmation</button>
            </form>
            <a href="/login">Back to login page</a>
        </h1>
    </body>
</html>
