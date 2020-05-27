<%-- 
    Document   : confirmGarages
    Created on : Mar 22, 2020, 9:55:31 AM
    Author     : dimit
--%>

<%@page import="java.util.Objects"%>
<%@page import="com.example.parkbnb.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%-- 
    Document   : allUsers
    Created on : Jan 22, 2020, 9:45:36 PM
    Author     : dimit
        --%>

        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
        <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
            <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
            <title>JSP Page</title>

            <style>
                body {
                    background-color: #f2f2f2;
                }

                .table {
                    background-color: #fff;
                    box-shadow: 0px 2px 2px #aaa;
                    margin-top: 50px;
                    text-align: center;
                }

            </style>

        </head>
        <body>
            <%  User current = (User) session.getAttribute("userSession");
                if (Objects.nonNull(current)) {
                    if (current.getUserType() == 2) {



            %>

            <div class="container">
                <div class="row">
                    <h1 style="margin-top: 40px">A List Of All Products</h1>

                    <table class="table table-bordered">

                        <thead style="font-weight: bold;">
                        <td>#</td>
                        <td>name</td>
                        <td>quantity</td>
                        <td colspan="2">Actions</td>
                        </thead>
                        <tbody>
                            <c:set var="i" value="0"/>
                            <c:forEach items="${unconfirmedGarages}" var="gar">
                                <tr>
                                    <c:set var="i" value="${i + 1}" scope="page"/>
                                    <td>${i}</td>
                                    <td>${gar.garageAddress}</td>
                                    <td>${gar.garageOwnercomment}</td>

                                    <td><image src ="${gar.garageBillimageurl}"  width="100" height="100"><br/>
                                        <a href="${gar.garageBillimageurl}" target="_blank">Open in new tab</a></td>
                                    <td><image src ="${gar.garageSpotimageurl}"  width="100" height="100" alt="not available"><br/>
                                        <a href="${gar.garageSpotimageurl}" target="_blank">Open in new tab</a></td>
                                    <td><image src ="${gar.garageEntranceimageurl}"  width="100" height="100"><br/>
                                        <a href="${gar.garageEntranceimageurl}" target="_blank">Open in new tab</a></td>

                                    <td><a href="garageConfirm/${gar.garageId}">Confirm</a></td>






                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="messages"></div>


            <script>
                $(document).ready(function () {
                    getRentals();
                });
                function getRentals() {
                    const URL = "/getMessages";
                    const settings = {
                        url: URL,
                        success: handleSuccess,
                        type: "POST"
                                // handleSuccess( dataFromServer )
                    };
                    $.ajax(settings);
                    function handleSuccess(data) {
                        let userIds = [];
                        console.log(data);
                        $.each(data, function (i, element) {
                            if (element.cmessageFromuserid !== null) {
                                userIds.push(element.cmessageFromuserid.userId);
                            }
                            if (element.cmessageTouserid !== null) {
                                userIds.push(element.cmessageTouserid.userId);
                            }
                        });
                        console.log(userIds);
                        userIds = removeDups(userIds);
                        console.log(userIds);
                        $.each(userIds, function (i, user) {
                            document.getElementById("messages").innerHTML += "<div style='border: 1px solid black'><div>From " + user + " <a href='manageUser/"+user+"'>Manage this user</a></div><form action='/adminSendMessage/" + user + "' method='post'>\n\
                        <input type='text' name='message'><input type='submit'></form>\n\
                        <table class='table table-bordered'><thead style='font-weight: bold;'><td>message</td><td>date</td></thead>\n\
                        <tbody id='mesbody" + user + "'></tbody></table>";
                        });
                        $.each(data, function (i, element) {
                            let date = new Date(element.cmessageDaytime);
                            let formatted_date = date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
                            let divname = "";
                            let fromAdmin = "";
                            if (element.cmessageFromuserid === null) {
                                divname = "mesbody" + element.cmessageTouserid.userId;
                                fromAdmin = "(fromAdmin)"
                            } else {
                                divname = "mesbody" + element.cmessageFromuserid.userId;
                            }

                            document.getElementById(divname).innerHTML += "<tr><td>" + fromAdmin + element.cmessageMessage + "</td><td>" + formatted_date + "</td></tr>";
                        });
                    }

                }
                function removeDups(array) {
                    let unique = {};
                    array.forEach(function (i) {
                        if (!unique[i] && i !== null) {
                            unique[i] = true;
                        }
                    });
                    return Object.keys(unique);
                }
            </script>

            <%  }
                }
            %>
        </body>
    </html>

</body>
</html>
