


<%@page import="com.example.parkbnb.models.User"%>
<%@page import="java.util.Objects"%>
<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
    <head>



        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
        <link rel="shortcut icon" href="assets/images/logo-102x121.png" type="image/x-icon">
        <meta name="description" content="">


        <jsp:include page = "includes_for_css.jsp"></jsp:include>  


            <title>AirPnG | Park & GO!</title>

            <style>

            </style>

        </head>
        <body>

        <%  User current = (User) session.getAttribute("userSession");
            if (Objects.nonNull(current)) {
                if (current.getUserType() == 2) {
                    response.sendRedirect("/confirmGarages");
                }
            }

            if (session.getAttribute("userSession") == null || session.getAttribute("userSession").equals("")) {

                response.sendRedirect("/");
            }


        %>


        <jsp:include page = "includes/navBarSide.jsp"></jsp:include>


            <div class="preloader"></div>


        <jsp:include page = "includes/navBar.jsp"></jsp:include>

            <section class="tabs3 cid-rU8UTzIOoj" id="tabs3-i" style="position: static">





                <div class="container" >

                    <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-2">
                        <br>Three Steps Away!</h2>

                    <h3 class="mbr-section-subtitle  display-5 align-center mbr-light mbr-fonts-style">
                        Make your selections below and enjoy your parking spot!
                        <div>Your Waller has ${userSession.userWalletmoney} €</div></h3>

            </div>
            <div class="container-fluid" style="position:static">
                <div class="row tabcont" >
                    <ul class="nav nav-tabs pt-3 mt-5" role="tablist">
                        <li class="nav-item mbr-fonts-style"><a id="parkTab" class="nav-link show active display-7" role="tab"
                                                                data-toggle="tab" href="#tabs3-i_tab0" aria-selected="true">1. Choose Parking Spot</a></li>
                        <li class="nav-item mbr-fonts-style"><a  id="dateTab" class="nav-link  show active display-7 disabled" role="tab"
                                                                 data-toggle="tab" href="#tabs3-i_tab1" aria-selected="true">
                                2. Choose Parking Duration</a></li>
                        <li class="nav-item mbr-fonts-style"><a  id="checkoutTab" class="nav-link show active display-7 disabled" role="tab"
                                                                 data-toggle="tab" href="#tabs3-i_tab2" aria-selected="true">
                                3. Checkout</a></li>



                    </ul>
                </div>
            </div>

            <div class="container">
                <div class="row px-1">
                    <div class="tab-content">
                        <div id="tab1" class="tab-pane in active mbr-table" role="tabpanel">
                            <div class="row tab-content-row">
                                <div class="col-xs-12 col-md-10">

                                    <section class="map1 cid-rSzIQODBwc" id="map1-9">

                                        <div class="row">
                                            <div class="col-4"style="margin-top: 17px;padding-left: 25px">Filter your options:</div>
                                            <div class="col-4">
                                                <label for="minpph">Min price per Hour:</label></br>
                                                <input id="minPph" type="number" value="0" step="0.1" name="minpph" min="0" max="0" style="width: 80%">
                                            </div>
                                            <div class="col-4">
                                                <label for="pph">Max price per Hour:</label></br>
                                                <input id="maxPph" type="number" value="0" step="0.1" name="pph" min="0" style="width: 80%">
                                            </div>
                                        </div>

                                        <div class="google-map rounded shadow"><iframe frameborder="0" style="border:0" 
                                                                                       src="../assets/custom/map/mainMap.html" allowfullscreen=""></iframe></div>

                                        <div id="garageInfo" class="align-center shadow" style='display:none'> </div>

                                    </section>
                                    </br></br>
                                </div>
                            </div>
                        </div>

                        <div id="tab2" class="tab-pane  mbr-table" role="tabpanel">
                            <div class="row tab-content-row">
                                <div class="col-xs-12 col-md-6">
                                    <!--                                        <div class="card-img ">
                                                                                <span class="mbri-bootstrap mbr-iconfont"></span>
                                                                            </div>
                                                                            <h4 class="mbr-element-title  align-center mbr-fonts-style pb-2 display-5">
                                                                                PICK YOUR DATE AND TIME
                                                                            </h4>-->
                                    <div id="datePick"  class="align-center"></div></br></br></br></br></br></br>

                                </div>
                            </div>
                        </div>

                        <div id="tab3" class="tab-pane  mbr-table" role="tabpanel">
                            <div class="row tab-content-row">
                                <div class="col-xs-12 col-md-6">
                                    <div class="card-img ">
                                        <span class="mbri-extension mbr-iconfont"></span>
                                    </div>
                                    <h4 class="mbr-element-title  align-center mbr-fonts-style pb-2 display-5">
                                        Checkout
                                    </h4>
                                    <p class="mbr-section-text  align-center mbr-fonts-style display-7">
                                        CheckOut section
                                    </p>
                                    <div id="checkout"></div>
                                </div>


                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




<jsp:include page = "includes/footer.jsp"></jsp:include>  

<jsp:include page = "includes_for_scripts_bottom.jsp"></jsp:include>  
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script>
    $.fn.outerFind = function (selector) {
        return this.find(selector).addBack(selector);
    };
    function initTabs(target) {
        if ($(target).find('.nav-tabs').length !== 0) {
            $(target).outerFind('section[id^="tabs"]').each(function () {
                var componentID = $(this).attr('id');
                var $tabsNavItem = $(this).find('.nav-tabs .nav-item');
                var $tabPane = $(this).find('.tab-pane');

                $tabPane.removeClass('active').eq(0).addClass('active');

                $tabsNavItem.find('a').removeClass('active').removeAttr('aria-expanded')
                        .eq(0).addClass('active');

                $tabPane.each(function () {
                    $(this).attr('id', componentID + '_tab' + $(this).index());
                });

                $tabsNavItem.each(function () {
                    $(this).find('a').attr('href', '#' + componentID + '_tab' + $(this).index());
                });
            });
        }
    }


    var isBuilder = $('html').hasClass('is-builder');
    if (isBuilder) {
        $(document).on('add.cards', function (e) {
            initTabs(e.target);
        });
    } else {
        if (typeof window.initTabsPlugin === 'undefined') {
            window.initTabsPlugin = true;
            console.log('init tabs by plugin');
            initTabs(document.body);
        }
    }

    function rentalRent(rentalid) {


        document.getElementById("parkTab").className = "nav-link show display-7";
        document.getElementById("tabs3-i_tab0").className = "tab-pane in mbr-table show";
        document.getElementById("dateTab").className = "nav-link  show display-7 active";
        document.getElementById("tabs3-i_tab1").className = "tab-pane  mbr-table show active";


        let dates;
        $.ajax({
            url: "/getRental/" + rentalid,
            type: "POST"

        }).done(function (data) {
            let startDate = new Date(data.rentalStart);
            let endDate = new Date(data.rentalEnd);

            document.getElementById("datePick").innerHTML = "<form  action='/addDates/" + data.rentalId + "'>\n\
                    <input class='form-control' type='text' name='datetimes' style='background-color:#ffffff ;font-size:1.5rem ; text-align:center'/>\n\
                    </br><button class='btn btn-primary btn-form display-4' type='submit' id='datesSelected'>Select these dates</button>\n\
                       </form>";



            document.getElementById("dateTab").click();
            $(function () {



                $('input[name="datetimes"]').daterangepicker({
                    timePicker: true,
                    timePicker24Hour: true,
                    startDate: startDate,
                    endDate: endDate,
                    minDate: startDate,
                    maxDate: endDate,
                    locale: {
                        format: 'DD/MM/YYYY HH:00'
                    }
                });
                document.getElementById("datesSelected").addEventListener("click", function (event) {
                    event.preventDefault();
                    setTimeout(function () {
                        document.getElementById("dateTab").className = "nav-link show display-7";
                        document.getElementById("tabs3-i_tab1").className = "tab-pane in mbr-table show";
                        document.getElementById("checkoutTab").className = "nav-link  show display-7 active";
                        document.getElementById("tabs3-i_tab2").className = "tab-pane  mbr-table show active";
                    }, 100);

                    dates = $('input[name="datetimes"]').val();
                    var res = dates.split("-");

                    var sd = res[0].trim().split(" ");
                    var sday = sd[0].split("/");
                    var sdates = sday[2] + "-" + sday[1] + "-" + sday[0] + "T" + sd[1];
                    let startDate = new Date(sdates);
                    var ed = res[1].trim().split(" ");
                    var eday = ed[0].split("/");
                    var edates = eday[2] + "-" + eday[1] + "-" + eday[0] + "T" + ed[1];
                    let endDate = new Date(edates);

                    let totalPrice = data.rentalPriceperhour * ((endDate - startDate) / 1000 / 60 / 60);

                    document.getElementById("checkoutTab").click();
                    //if pay done
                    document.getElementById("checkout").innerHTML = "<form method='post' action='/book/" + rentalid + "'>\n\
                                                                    <input value='" + dates + "' name='dates' type='hidden'>\n\
\                                                                   <input value='" + totalPrice + "' name='totalPrice' type='hidden'>\n\
                                                                    <button type='submit'>Checkout</button>\n\
                                                                    </form>";


                    let bookDetails = {
                        rentalId: rentalid,
                        dates: dates
                    };
                    console.log(bookDetails);




                });

            });

        });

    }
</script>




</body>
</html>
