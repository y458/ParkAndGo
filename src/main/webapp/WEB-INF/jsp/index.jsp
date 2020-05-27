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


        </head>
        <body>

            <!--<div class="alert alert-warning alert-dismissible fade show" role="alert">
              <strong>Holy guacamole!</strong> You should check in on some of those fields below.
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>-->
            <div class="preloader"></div>

        <jsp:include page = "modalLoginForm.jsp"></jsp:include>  


        <jsp:include page = "includes/navBar.jsp"></jsp:include>

            <section class="header12 cid-rSzxKBDqj1 mbr-fullscreen mbr-parallax-background" id="header12-1">
                <div class="bg"></div>


                <div class="mbr-overlay" style="opacity: 0.6; background-color: rgb(35, 35, 35);">
                </div>

                <div class="container  ">
                    <div class="media-container">
                        <div class="col-md-12 align-center">
                            <h1 class="mbr-section-title pb-3 mbr-white mbr-bold mbr-fonts-style display-1">Park &amp; Go!</h1>
                            <p class="mbr-text pb-3 mbr-white mbr-fonts-style display-5">
                                Find your parking spot easy and safely</p>


                            <div class="icons-media-container mbr-white">
                                <div class="card col-12 col-md-6 col-lg-3">
                                    <div class="icon-block">
                                        <a>
                                            <span class="mbr-iconfont mbri-smile-face"></span>
                                        </a>
                                    </div>
                                    <h5 class="mbr-fonts-style display-5">We</h5>
                                </div>

                                <div class="card col-12 col-md-6 col-lg-3">
                                    <div class="icon-block">
                                        <a>
                                            <span class="mbri-sun mbr-iconfont"></span>
                                        </a>
                                    </div>
                                    <h5 class="mbr-fonts-style display-5">make</h5>
                                </div>

                                <div class="card col-12 col-md-6 col-lg-3">
                                    <div class="icon-block">
                                        <a >
                                            <span class="mbr-iconfont mbri-like"></span>
                                        </a>
                                    </div>
                                    <h5 class="mbr-fonts-style display-5">a better</h5>
                                </div>

                                <div class="card col-12 col-md-6 col-lg-3">
                                    <div class="icon-block">
                                        <a >
                                            <span class="mbr-iconfont mbri-globe"></span>
                                        </a>
                                    </div>
                                    <h5 class="mbr-fonts-style display-5">World!</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mbr-arrow hidden-sm-down" aria-hidden="true">
                    <a href="#next">
                        <i class="mbri-down mbr-iconfont"></i>
                    </a>
                </div>
            </section>

            <section class="mbr-section content4 cid-rSzJ0MkCRS" id="content4-b">



                <div class="container">
                    <div class="media-container-row">
                        <div class="title col-12 col-md-8">
                            <h2 class="align-center pb-3 mbr-fonts-style display-2">
                                Parking Spots Available near you!</h2>
                        </div>
                    </div>
                </div>
            </section>

            <section class="map1 cid-rSzIQODBwc" id="map1-9">



                <div class="google-map"><iframe frameborder="0" style="border:0" 
                                                src="../assets/custom/map/indexMap.html" allowfullscreen=""></iframe></div>
            </section>

            <section class="features15 cid-rSzyFAz4oe" id="features15-5">




                <div class="container">
                    <h2 class="mbr-section-title pb-3 align-center mbr-fonts-style display-2">
                        How it works</h2>
                    <h3 class="mbr-section-subtitle display-5 align-center mbr-fonts-style"><b>For garage owners:</b><br><br>Register your private garage in our platform, let others know when is free and get paid for your service!<br><br><b>For parking spot seekers:</b></h3>

                    <div class="media-container-row container pt-5 mt-2">

                        <div class="col-12 col-md-6 mb-4 col-lg-3">
                            <div class="card flip-card p-5 align-center">
                                <div class="card-front card_cont">
                                    <img src="assets/images/background1.jpg" alt="Mobirise">
                                </div>
                                <div class="card_back card_cont">
                                    <h4 class="card-title display-5 py-2 mbr-fonts-style">Search for a parking spot&nbsp;</h4>
                                    <p class="mbr-text mbr-fonts-style display-7">Use our app to search for a parking spot&nbsp;</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-6 mb-4 col-lg-3">

                            <div class="card flip-card p-5 align-center">
                                <div class="card-front card_cont">
                                    <img src="assets/images/background2.jpg" alt="Mobirise">
                                </div>
                                <div class="card_back card_cont">
                                    <h4 class="card-title py-2 mbr-fonts-style display-5">Check for availability</h4>
                                    <p class="mbr-text mbr-fonts-style display-7">Lorem</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-6 mb-4 col-lg-3">
                            <div class="card flip-card p-5 align-center">
                                <div class="card-front card_cont">
                                    <img src="assets/images/background3.jpg" alt="Mobirise">
                                </div>
                                <div class="card_back card_cont">
                                    <h4 class="card-title py-2 mbr-fonts-style display-5">
                                        Book your spot online</h4>
                                    <p class="mbr-text mbr-fonts-style display-7">lorema</p>
                                </div>
                            </div> 
                        </div>

                        <div class="col-12 col-md-6 mb-4 col-lg-3">
                            <div class="card flip-card p-5 align-center">
                                <div class="card-front card_cont">
                                    <img src="assets/images/background4.jpg" alt="Mobirise">
                                </div>
                                <div class="card_back card_cont">
                                    <h4 class="card-title py-2 mbr-fonts-style display-5">
                                        Pay on the go</h4>
                                    <p class="mbr-text mbr-fonts-style display-7">lorem</p>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div></section>

            <section class="testimonials1 cid-rSzzd8qa7P" id="testimonials1-8">




                <div class="container">
                    <div class="media-container-row">
                        <div class="title col-12 align-center">
                            <h2 class="pb-3 mbr-fonts-style display-2">
                                WHAT OUR FANTASTIC USERS SAY
                            </h2>

                        </div>
                    </div>
                </div>

                <div class="container pt-3 mt-2">
                    <div class="media-container-row">
                        <div class="mbr-testimonial p-3 align-center col-12 col-md-6 col-lg-4">
                            <div class="panel-item p-3">
                                <div class="card-block">
                                    <div class="testimonial-photo">
                                        <img src="assets/images/face1.jpg">
                                    </div>
                                    <p class="mbr-text mbr-fonts-style display-7">
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, aspernatur, voluptatibus, atque, tempore molestiae.
                                    </p>
                                </div>
                                <div class="card-footer">
                                    <div class="mbr-author-name mbr-bold mbr-fonts-style display-7">
                                        John Smith
                                    </div>
                                    <small class="mbr-author-desc mbr-italic mbr-light mbr-fonts-style display-7">
                                        Developer
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="mbr-testimonial p-3 align-center col-12 col-md-6 col-lg-4">
                            <div class="panel-item p-3">
                                <div class="card-block">
                                    <div class="testimonial-photo">
                                        <img src="assets/images/face2.jpg">
                                    </div>
                                    <p class="mbr-text mbr-fonts-style display-7">
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, aspernatur, voluptatibus, atque, tempore molestiae.
                                    </p>
                                </div>
                                <div class="card-footer">
                                    <div class="mbr-author-name mbr-bold mbr-fonts-style display-7">
                                        John Smith
                                    </div>
                                    <small class="mbr-author-desc mbr-italic mbr-light mbr-fonts-style display-7">
                                        Developer
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="mbr-testimonial p-3 align-center col-12 col-md-6 col-lg-4">
                            <div class="panel-item p-3">
                                <div class="card-block">
                                    <div class="testimonial-photo">
                                        <img src="assets/images/face3.jpg">
                                    </div>
                                    <p class="mbr-text mbr-fonts-style display-7">
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, aspernatur, voluptatibus, atque, tempore molestiae.
                                    </p>
                                </div>
                                <div class="card-footer">
                                    <div class="mbr-author-name mbr-bold mbr-fonts-style display-7">
                                        John Smith
                                    </div>
                                    <small class="mbr-author-desc mbr-italic mbr-light mbr-fonts-style display-7">
                                        Developer
                                    </small>
                                </div>
                            </div>
                        </div>






                    </div>
                </div>   
            </section>

            <section class="mbr-section form1 cid-rSzyWnW1jK" id="form1-6">




                <div class="container">
                    <div class="row justify-content-center">
                        <div class="title col-12 col-lg-8">
                            <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-2">
                                RATE US</h2>
                            <h3 class="mbr-section-subtitle align-center mbr-light pb-3 mbr-fonts-style display-5">Share your thoughts with us</h3>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row justify-content-center">
                        <!---Formbuilder Form--->
                        <form action="/addSiteReview" method="POST">




                            <textarea name="message" data-form-field="Message" class="form-control"></textarea>


                            <button type="submit" class="btn btn-primary btn-form display-4">SEND FORM</button>


                        </form><!---Formbuilder Form--->
                    </div>
                </div>
            </section>

            <section once="footers" class="cid-rSzz49kirZ" id="footer7-7">





                <div class="container">
                    <div class="media-container-row align-center mbr-white">
                        <div class="row row-links">
                            <ul class="foot-menu">





                                <li class="foot-menu-item mbr-fonts-style display-7">
                                    <a class="text-white mbr-bold" href="#" target="_blank">About us</a>
                                </li><li class="foot-menu-item mbr-fonts-style display-7">
                                    <a class="text-white mbr-bold" href="#" target="_blank">Services</a>
                                </li><li class="foot-menu-item mbr-fonts-style display-7">
                                    <a class="text-white mbr-bold" href="#" target="_blank">Get In Touch</a>
                                </li><li class="foot-menu-item mbr-fonts-style display-7">
                                    <a class="text-white mbr-bold" href="#" target="_blank">Careers</a>
                                </li><li class="foot-menu-item mbr-fonts-style display-7">
                                    <a class="text-white mbr-bold" href="#" target="_blank">Work</a>
                                </li></ul>
                        </div>
                        <div class="row social-row">
                            <div class="social-list align-right pb-2">






                                <div class="soc-item">
                                    <a href="#" target="_blank">
                                        <span class="socicon-twitter socicon mbr-iconfont mbr-iconfont-social"></span>
                                    </a>
                                </div><div class="soc-item">
                                    <a href="#" target="_blank">
                                        <span class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
                                    </a>
                                </div><div class="soc-item">
                                    <a href="#" target="_blank">
                                        <span class="socicon-youtube socicon mbr-iconfont mbr-iconfont-social"></span>
                                    </a>
                                </div><div class="soc-item">
                                    <a href="#" target="_blank">
                                        <span class="socicon-instagram socicon mbr-iconfont mbr-iconfont-social"></span>
                                    </a>
                                </div><div class="soc-item">
                                    <a href="#" target="_blank">
                                        <span class="socicon-googleplus socicon mbr-iconfont mbr-iconfont-social"></span>
                                    </a>
                                </div><div class="soc-item">
                                    <a href="#" target="_blank">
                                        <span class="socicon-behance socicon mbr-iconfont mbr-iconfont-social"></span>
                                    </a>
                                </div></div>
                        </div>
                        <div class="row row-copirayt">
                            <p class="mbr-text mb-0 mbr-fonts-style mbr-white align-center display-7">
                                © Copyright 2019 AirPnG - All Rights Reserved
                            </p>
                        </div>
                    </div>
                </div>

            </section>



        <jsp:include page = "includes_for_scripts_bottom.jsp"></jsp:include>  





    </body>
</html>