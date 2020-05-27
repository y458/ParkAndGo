


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


            <title>My Garages | AirPnG | Park & GO!</title>

            <style>
                .cid-rWPbspIEeg {
                    padding-top: 105px;
                    padding-bottom: 105px;
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
                    <div class="media-container-row pt-5" style="position: static">
                        <div class="accordion-content col-4 shadow rounded pb-3" style="position: static">
                            <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-2"  style="position: static">
                                My Garages
                            </h2>

                        <c:forEach items="${userGarages}" var="gar">
                            <div id="bootstrap-accordion_${gar.garageId}" class="panel-group accordionStyles accordion pt-5 mt-3 " role="tablist" aria-multiselectable="true">
                                <div class="card">
                                    <div class="card-header" role="tab" id="heading${gar.garageId}">

                                        <a role="button" class="collapsed panel-title text-black rounded"  onclick="getRentals(${gar.garageId})" data-toggle="collapse" data-core="" href="#collapse1_${gar.garageId}" aria-expanded="false" aria-controls="collapse1">
                                            <h4 class="mbr-fonts-style display-7">
                                                <span class="sign mbr-iconfont mbri-arrow-down inactive"> </span>  ${gar.garageAddress}
                                            </h4>
                                        </a>
                                    </div>
                                    <div id="collapse1_${gar.garageId}" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="heading${gar.garageId}" data-parent="#bootstrap-accordion_${gar.garageId}">
                                        <div class="panel-body p-4">
                                            <p class="mbr-fonts-style panel-text display-7">

                                            <div class="content">
                                                <div class="container">


                                                    <form action="/addDates/${gar.garageId}">
                                                        <div class="form-group">
                                                            <label for="datetimes">Select dates:</label>
                                                            <input type="text" class="form-control" name="datetimes">

                                                        </div>
                                                        <div class="form-group">
                                                           <label for="pph">Price per Hour:</label>
                                                            <input type="number" class="form-control"  step="0.01" name="pph" required>
                                                        </div>

                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                    </form>
                                                        <div style="border: 1px solid black;" id="${gar.garageId}"></div>
                                                </div>	
                                            </div>

                                            </p>
                                        </div>
                                    </div>
                                </div>




                            </div>
                        </c:forEach>

                    </div>
                    <div class="mbr-figure col-5" style="width: 105%; ">
                        <div id="garageImageWrap" style='display:none'>
                            <div id="garageImage" ></div>
                        </div>
                        <div  id="garageDetails">

                            <div style="border: 1px solid black;"></div>
                        </div>

                    </div>


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
                                                    console.log(data);
                                                    document.getElementById(divName).innerHTML = "";


                                                    if (data.length > 0) {
                                                        $('#garageImageWrap').fadeOut(function () {
                                                            document.getElementById('garageImage').innerHTML = "<img class='shadow rounded'  src=" + data[0].rentalGarageid.garageBillimageurl + " alt='ParkingSpot'>"


                                                        });

                                                        $('#garageImageWrap').fadeIn();
                                                    }

                                                    document.getElementById('garageDetails').innerHTML = "";

                                                    $.each(data, function (i, element) {
                                                        let startDate = new Date(element.rentalStart);
                                                        let endDate = new Date(element.rentalEnd);
                                                        let rentedhours = (endDate - startDate) / 1000 / 60 / 60;
                                                        let formatted_startdate = startDate.getDate() + "-" + (startDate.getMonth() + 1) + "-" + startDate.getFullYear() + " " + startDate.getHours() + ":" + startDate.getMinutes() + ":" + startDate.getSeconds()
                                                        let formatted_enddate = endDate.getDate() + "-" + (endDate.getMonth() + 1) + "-" + endDate.getFullYear() + " " + endDate.getHours() + ":" + endDate.getMinutes() + ":" + endDate.getSeconds();


                                                        if (element.rentalUserid !== null) {

                                                            document.getElementById('garageDetails').innerHTML += "<table class='table shadow rounded'>\n\
                                                                                                                                <thead>\n\
                                                                                                                             <tr><th colspan='7'><h4>RENTALS</h4></th></tr>\n\
                                                                                                                                    <tr>\n\
                                                                                                                                        <th scope='col'>From</th>\n\
                                                                                                                                        <th scope='col'>To</th>\n\
                                                                                                                                        <th scope='col'>Price/Hour</th>\n\
                                                                                                                                        <th scope='col'>Total</th>\n\
                                                                                                                                     <th scope='col'>By User</th>\n\
                                                                                                                                        <th scope='col'></th>\n\
                                                                                                                                        <th scope='col'></th>\n\
                                                                                                                                 </tr>\n\
                                                                                                                                </thead>\n\
                                                                                                                                <tbody>\n\
                                                                                                                                    <tr>\n\
                                                                                                                                        <td>" + formatted_startdate + "</td>\n\
                                                                                                                                        <td>" + formatted_enddate + "</td>\n\
                                                                                                                                        <td>" + element.rentalPriceperhour + "</td>\n\
                                                                                                                                     <td>" + rentedhours * element.rentalPriceperhour + "$</td>\n\
                                                                                                                                     <td>" + element.rentalUserid.userName + " " + element.rentalUserid.userSurname + "</td>\n\
                                                                                                                                     <td><a href='reviewUser/" + element.rentalUserid.userId + "'> <i class='fas fa-star' style='color:yellow' title='Review User'></i></a></td>\n\
                                                                                                                                     <td><a href='removeRental/" + element.rentalId + "'><i class='fas fa-minus-circle' style='color:red' title='Cancel'></i></a></td>\n\
                                                                                                                                    </tr>\n\
                                                                                                                                </tbody>\n\
                                                                                                                            </table>";







                                                        } else {

//                                                            document.getElementById('garageDetails').innerHTML += "<div>From: " + formatted_startdate + ", to: " + formatted_enddate + "  for " + rentedhours + " hours at " + element.rentalPriceperhour + "$ per hour</div>\n\
//                                                                              <div>Total price : " + rentedhours * element.rentalPriceperhour + "$   Rented: No</div>\n\
//                                                                              <a href='removeRental/" + element.rentalId + "'>cancel</a>";

                                                            document.getElementById('garageDetails').innerHTML += "<table class='table shadow rounded'>\n\
                                                                                                                                <thead>\n\
                                                                                                                             <tr><th colspan='7'><h4>AVAILABILITIES</h4></th></tr>\n\
                                                                                                                                    <tr>\n\
                                                                                                                                        <th scope='col'>From</th>\n\
                                                                                                                                        <th scope='col'>To</th>\n\
                                                                                                                                        <th scope='col'>Price/Hour</th>\n\
                                                                                                                                        <th scope='col'>Total</th>\n\
                                                                                                                                        <th scope='col'></th>\n\
                                                                                                                                 </tr>\n\
                                                                                                                                </thead>\n\
                                                                                                                                <tbody>\n\
                                                                                                                                    <tr>\n\
                                                                                                                                        <td>" + formatted_startdate + "</td>\n\
                                                                                                                                        <td>" + formatted_enddate + "</td>\n\
                                                                                                                                        <td>" + element.rentalPriceperhour + "</td>\n\
                                                                                                                                     <td>" + rentedhours * element.rentalPriceperhour + "$</td>\n\
                                                                                                                                     <td><a href='removeRental/" + element.rentalId + "'><i class='fas fa-minus-circle' style='color:red' title='Cancel'></i></a></td>\n\
                                                                                                                                    </tr>\n\
                                                                                                                                </tbody>\n\
                                                                                                                            </table>";

                                                        }
                                                    });


                                                }
                                            }

        </script>


    </body>
</html>
