


<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>



        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
        <link rel="shortcut icon" href="assets/images/logo-102x121.png" type="image/x-icon">
        <meta name="description" content="">
        <!--    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
                <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
                <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
                <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />-->

        <jsp:include page = "includes_for_css.jsp"></jsp:include>  


            <title>Customer Support | AirPnG | Park & GO!</title>

            <style>
                .cid-rWPbspIEeg {
                    padding-top: 105px;
                    padding-bottom: 350px;
                    background-color: #f9f9f9;

                }
                .cid-rWPbspIEeg .mbr-figure {
                    -webkit-align-self: flex-start;
                    align-self: flex-start;
                    padding-left: 4rem;
                }

                .cid-rWPbspIEeg .accordion-content {

                    -webkit-flex-basis: 100%; 
                }

                .cid-rWPbspIEeg .card .card-header a.panel-title h4 {
                    padding: 1rem 1rem;
                    border: 1px solid #ccc;
                    margin-bottom: 0;}

                .display-7 {
                    font-family: 'Rubik', sans-serif;
                    font-size: 1rem;
                    font-display: swap;}

                .pt-5, .py-5 {
                    padding-top: 0rem!important; 
                }
                .mt-3, .my-3 {
                    margin-top: 0rem!important; 
                }
                .pt-5, .py-5 {
                    padding-top: 0rem!important; 
                }
                .mt-3, .my-3 {
                    margin-top: 0rem!important;
                }

                .card-header {
                    padding: 0rem 0rem!important;
                    background-color:#dfdfdf;
                }

                .mbr-figure{ 
                    position: -webkit-sticky;
                    position: sticky;
                    top: 100px;}

                .fancybox-slide--iframe .fancybox-content {
                    width  : 800px;
                    height : 600px;
                    max-width  : 80%;
                    max-height : 80%;
                    margin: 0;
                }
            </style>

        </head>
        <body>

        <jsp:include page = "includes/navBarSide.jsp"></jsp:include>


            <div class="preloader"></div>


        <jsp:include page = "includes/navBar.jsp"></jsp:include>

            <section class="accordion2 cid-rWPbspIEeg" id="accordion2-v" style="position: static">

                <div class="container-fluid" style="position:static">



                    <div class="container" style="position:static">
                        <h1>Customer Support</h1><br>

                        <table class="table table-striped table-dark rounded shadow">
                           <h4> Our Assistant Team</h4>
                            <tbody>
                            <c:forEach items="${admins}" var="adm">
                                <tr>
                                    <td>${adm.userName}</td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <br/>
                    <br/>
                    
                    <div class ="container align-center">
                        <p>Send a message to our admins:</p>
                    <form   action="/custSendMessage" method="post">
                        <input class="form-control shadow" style="background-color:#ffffff"type="text" name="message">
                        <input type="submit" class="btn btn-primary">
                    </form>
                        </div>
                    <br/>
                    <br/>
                    <br/>
                    <div id="messages"></div>
                    
                </div>

            </div>
            </br></br></br></br></br></br> </section>




        <jsp:include page = "includes/footer.jsp"></jsp:include>  

        <jsp:include page = "includes_for_scripts_bottom.jsp"></jsp:include>  
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


   <script>
            $(document).ready(function () {
                getRentals();
            });
            
            setInterval(function(){ getRentals(); }, 5000);
            
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
                    document.getElementById("messages").innerHTML = "";
                    document.getElementById("messages").innerHTML += "<p>Your Messages</p>\n\
             <table class='table table-striped shadow table-hover'><thead style='font-weight: bold;'><td>message</td><td>date</td></thead><tbody id='mesbody'></tbody></table>";
                    $.each(data, function (i, element) {
                        let fromAdmin="";
                            if (element.cmessageFromuserid === null) {
                                fromAdmin="(from Admin)";
                            }
                        let date = new Date(element.cmessageDaytime);
                        let formatted_date = date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
                        console.log(element);
                        document.getElementById("mesbody").innerHTML += "<tr><td>" + fromAdmin +" "+element.cmessageMessage + "</td><td>" + formatted_date + "</td></tr>";

                    });
                }

            }
        </script>


    </body>
</html>
