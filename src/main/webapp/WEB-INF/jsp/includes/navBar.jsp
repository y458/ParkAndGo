<section class="menu cid-rSzxauFbCH" once="menu" id="menu2-0">



    <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </button>
        <div class="menu-logo">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="/">
                        <img src="assets/images/logo-102x121.png" alt="AirPnG" title="" style="height: 5rem;">
                    </a>
                </span>

            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                <li class="nav-item">
                    <a class="nav-link link text-black display-4" href="/main">
                        Book Now</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link link text-black display-4" href="/#features15-5">
                        How it works</a>
                </li>
            </ul>
            <div class="navbar-buttons mbr-section-btn">

                <% if (session.getAttribute("userSession") == null || session.getAttribute("userSession").equals("")) {%>
                <a  class="btn btn-sm btn-primary display-4" data-toggle="modal" data-target="#modalLRForm">
                    <span class="mbrib-login mbr-iconfont mbr-iconfont-btn"></span>Login</a>



                <% } else { %>

                <div class="navbar-buttons mbr-section-btn">
                    <a class="btn btn-sm btn-primary display-4" href="/main"><span class="mbri-user mbr-iconfont mbr-iconfont-btn"></span>

                        Hello ${userSession.userName}!</a>
                        <a class="display-4" href="/logoutUser" alt="Logout"><i class="fas fa-lock-open"></i></a>
                </div>
                <% }%>
            </div>
        </div>
    </nav>
</section>


<!--<div class="navbar-buttons mbr-section-btn">


    <a  class="btn btn-sm btn-primary display-4" data-toggle="modal" data-target="#modalLRForm">
        <span class="mbrib-login mbr-iconfont mbr-iconfont-btn"></span>Login</a>


    <a class="btn btn-sm btn-primary display-4" href="loginForm" data-fancybox data-options='{"type" : "iframe", "iframe" : {"preload" : false, "css" : {"width" : "70%"}}}'>
        <span class="mbrib-login mbr-iconfont mbr-iconfont-btn"></span>

        Login</a>
</div>-->