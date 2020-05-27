<%-- 
    Document   : myGarages
    Created on : Mar 24, 2020, 10:16:38 AM
    Author     : dimit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <title>My Garages!</title>
        
   <jsp:include page = "includes_for_css.jsp"></jsp:include>  
        <style>
            body {
                background-color: #f2f2f2;
            }


            .collapsible {
                background-color: #777;
                color: white;
                cursor: pointer;
                padding: 18px;
                width: 100%;
                border: none;
                text-align: left;
                outline: none;
                font-size: 15px;
                margin: 10px;
            }

            .active, .collapsible:hover {
                background-color: #555;
            }

            .content {
                padding: 0 18px;
                display: none;
                overflow: hidden;
                background-color: #f1f1f1;
            }

        </style>

    </head>
    <body>
        
         <jsp:include page = "includes/navBarSide.jsp"></jsp:include>


            <div class="preloader"></div>


        <jsp:include page = "includes/navBar.jsp"></jsp:include>
        
        <div class="container" style="position: static ; padding-top: 120px">
            <div class="row">
                <h1 style="margin-top: 40px">My Garages</h1>

                <table class="table table-bordered">


                    <c:forEach items="${userGarages}" var="gar">
                        <button type="button" onclick="getRentals(${gar.garageId})" class="collapsible">${gar.garageAddress}</button>
                        <div class="content">
                            <div class="container">
                                <form action="/addDates/${gar.garageId}">
                                    <label for="datetimes">Select dates:</label>
                                    <input type="text" name="datetimes" style="width:250px;"/>
                                    <label for="pph">Price per Hour:</label>
                                    <input type="number" step="0.01" name="pph" required>
                                    <button type="submit">Add dates</button>
                                </form>
                                <div style="border: 1px solid black;" id="${gar.garageId}"></div>


                            </div>	
                        </div>
                    </c:forEach>

            </div>
        </div>
        
            <%--<jsp:include page = "includes/footer.jsp"></jsp:include>--%>  

        <jsp:include page = "includes_for_scripts_bottom.jsp"></jsp:include>  
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
      
        
        <script>
            $(function () {
                $('input[name="datetimes"]').daterangepicker({
                    timePicker: true,
                    timePicker24Hour: true,
                    startDate: moment().startOf('hour'),
                    endDate: moment().startOf('hour').add(32, 'hour'),
                    minDate: moment().startOf('hour'),
                    locale: {
                        format: 'DD/MM/YYYY HH:00'
                    }
                });
            });

            var coll = document.getElementsByClassName("collapsible");
            var i;

            for (i = 0; i < coll.length; i++) {
                coll[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var content = this.nextElementSibling;
                    if (content.style.display === "block") {
                        content.style.display = "none";
                    } else {
                        content.style.display = "block";
                    }
                });
            }



            function getRentals(garageId) {
                const URL = "/garageRentals/" + garageId;
                const settings = {
                    url: URL,
                    success: handleSuccess,
                    type: "POST"
                            // handleSuccess( dataFromServer )
                };
                $.ajax(settings);
                function handleSuccess(data) {
                    let divName = garageId;
                    document.getElementById(divName).innerHTML = "";
                    $.each(data, function (i, element) {
                        let startDate = new Date(element.rentalStart);
                        let endDate = new Date(element.rentalEnd);
                        let rentedhours = (endDate - startDate) / 1000 / 60 / 60;
                        let formatted_startdate = startDate.getDate() + "-" + (startDate.getMonth() + 1) + "-" + startDate.getFullYear() + " " + startDate.getHours() + ":" + startDate.getMinutes() + ":" + startDate.getSeconds()
                        let formatted_enddate = endDate.getDate() + "-" + (endDate.getMonth() + 1) + "-" + endDate.getFullYear() + " " + endDate.getHours() + ":" + endDate.getMinutes() + ":" + endDate.getSeconds();

                        if (element.rentalUserid !== null) {
                            document.getElementById(divName).innerHTML += "<div>From: " + formatted_startdate + ", to: " + formatted_enddate + "  for " + rentedhours + " hours at " + element.rentalPriceperhour + "$ per hour</div>\n\
                                                                        <div>Total price : " + rentedhours * element.rentalPriceperhour + "$   Rented: Yes      By User:" + element.rentalUserid.userName+" "+ element.rentalUserid.userSurname+ "</div>\n\
                                                                        <a href='removeRental/" + element.rentalId + "'>cancel</a>&nbsp<a href='reviewUser/"+element.rentalUserid.userId+"'>Review this user</a>";
                        } else {

                            document.getElementById(divName).innerHTML += "<div>From: " + formatted_startdate + ", to: " + formatted_enddate + "  for " + rentedhours + " hours at " + element.rentalPriceperhour + "$ per hour</div>\n\
                                                                        <div>Total price : " + rentedhours * element.rentalPriceperhour + "$   Rented: No</div>\n\
                                                                        <a href='removeRental/" + element.rentalId + "'>cancel</a>";
                        }
                    });


                }
            }

        </script>
    </body>
</html>
