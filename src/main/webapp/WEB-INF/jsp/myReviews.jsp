


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


            <title>My Reviews | AirPnG | Park & GO!</title>

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

            </style>

        </head>
        <body>

        <jsp:include page = "includes/navBarSide.jsp"></jsp:include>


            <div class="preloader"></div>


        <jsp:include page = "includes/navBar.jsp"></jsp:include>

            <section class="accordion2 cid-rWPbspIEeg" id="accordion2-v" style="position: static">

                <div class="container-fluid" style="position:static">

                    <h1 align="center">MyReviews</h1>


                    <div class="container">
                    <c:forEach items="${userReviews}" var="gar">
                        <div class="row" style="border: 1px solid black; margin-top: 3px">
                            <div class="col-3">

                                <c:forEach var = "i" begin = "1" end = "${gar.ureviewRating}">
                                    <i class="fa fa-star" aria-hidden="true" style="color:yellow"></i>
                                    
                                </c:forEach>
                            </div>
                            <br/>
                            <div class="col-8">

                                ${gar.ureviewComment}
                               
                                
                            </div>
                        </div>

                    </c:forEach>
                </div>
                

            </div>
            </br></br></br></br></br></br> </section>




        <jsp:include page = "includes/footer.jsp"></jsp:include>  

        <jsp:include page = "includes_for_scripts_bottom.jsp"></jsp:include>  
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


   


    </body>
</html>
