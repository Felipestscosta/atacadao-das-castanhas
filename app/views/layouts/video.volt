<!DOCTYPE html>
<html lang="pt_br">


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="{{ empresa.seo['description'] is not empty ? empresa.seo['description'] : '' }}">
    <meta name="keywords" content="{{ empresa.seo['keywords']  is not empty ? empresa.seo['keywords'] : '' }}" />
    <meta property="og:image" content="{{ this.url.getBaseUri() }}images/logo-whats.webp" />
    <meta name="google-site-verification" content="ALKwo9vfiH8rCAb1sfuPpC4l0-1zlYsgcwgg9rqQz8k" />
    <meta name="author" content="Webearte">
    <link rel="icon" href="{{ link_imagens ~ empresa.profile_favicon }}" type="image/x-icon">
    <title>{{empresa.razao_social}}</title>

    <!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-P7QJ75Z');</script>
    <!-- End Google Tag Manager -->


    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.gstatic.com/">
    <link href="https://fonts.googleapis.com/css2?family=Russo+One&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;500;600;700;800;900&amp;display=swap"
        rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
        rel="stylesheet">

    <!-- bootstrap css -->
    <link id="rtl-link" rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/vendors/bootstrap.css">

    <!-- wow css -->
    <link rel="stylesheet" href="{{this.url.getBaseUri()}}assets/css/animate.min.css" />

    <!-- font-awesome css -->
    <link rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/vendors/font-awesome.css">

    <!-- feather icon css -->
    <link rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/vendors/feather-icon.css">

    <!-- slick css -->
    <link rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/vendors/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/vendors/slick/slick-theme.css">

    <!-- Iconly css -->
    <link rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/bulk-style.css">

    <!-- Template css -->
    <link id="color-link" rel="stylesheet" type="text/css" href="{{this.url.getBaseUri()}}assets/css/style.css">

    {{ assets.outputCss() }}

    {{ empresa.seo['analytics'] is not empty ? empresa.seo['analytics'] : '' }}    

</head>

<body class="bg-effect">



    {{content()}}
  
      
    
        <!-- Bg overlay Start -->
        <div class=""></div>
        <!-- Bg overlay End -->
        <script>var hostsite = window.location.origin+"/";</script>
        <!-- latest jquery-->
        <script src="{{this.url.getBaseUri()}}assets/js/jquery-3.6.0.min.js"></script>
    
        <!-- jquery ui-->
        <script src="{{this.url.getBaseUri()}}assets/js/jquery-ui.min.js"></script>
    
        <!-- Bootstrap js-->
        <script src="{{this.url.getBaseUri()}}assets/js/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="{{this.url.getBaseUri()}}assets/js/bootstrap/bootstrap-notify.min.js"></script>
        <script src="{{this.url.getBaseUri()}}assets/js/bootstrap/popper.min.js"></script>
    
        <!-- feather icon js-->
        <script src="{{this.url.getBaseUri()}}assets/js/feather/feather.min.js"></script>
        <script src="{{this.url.getBaseUri()}}assets/js/feather/feather-icon.js"></script>
    
        <!-- Lazyload Js -->
        <script src="{{this.url.getBaseUri()}}assets/js/lazysizes.min.js"></script>

        <script src="{{this.url.getBaseUri()}}assets/js/wizard.js"></script>
    
        <!-- Slick js-->
        <script src="{{this.url.getBaseUri()}}assets/js/slick/slick.js"></script>
        <script src="{{this.url.getBaseUri()}}assets/js/slick/custom_slick.js"></script>
    
        <!-- Auto Height Js -->
        <script src="{{this.url.getBaseUri()}}assets/js/auto-height.js"></script>
    
        <!-- Fly Cart Js -->
        <script src="{{this.url.getBaseUri()}}assets/js/fly-cart.js"></script>
    
        <!-- Quantity js -->
        <script src="{{this.url.getBaseUri()}}assets/js/quantity-2.js"></script>
    
        <script src="{{this.url.getBaseUri()}}assets/js/nav-tab.js"></script>
        <!-- WOW js -->
        <script src="{{this.url.getBaseUri()}}assets/js/wow.min.js"></script>
        <script src="{{this.url.getBaseUri()}}assets/js/custom-wow.js"></script>

        <!-- Price Range Js -->
        <script src="{{this.url.getBaseUri()}}assets/js/ion.rangeSlider.min.js"></script>
    
        <!-- script js -->
        <script src="{{this.url.getBaseUri()}}assets/js/script.js"></script>


        {{ assets.outputJs() }}
        {{ partial('layouts/scriptssite') }} 

        <script>
            /*===================================
            =           Menu Activeion          =
            ===================================*/
            var cururl = window.location.pathname;
            var curpage = cururl.substr(cururl.lastIndexOf('/') + 1);
            var hash = window.location.hash.substr(1);
            if((curpage == "" || curpage == "/" || curpage == "admin") && hash=="")
                {
                //$("nav .navbar-nav > li:first-child").addClass("active");
                } else {
                    $(".bolinha li").each(function()
                {
                    $(this).removeClass("active");
                });
                if(hash != "")
                    $(".bolinha li a[href*='"+hash+"']").parents("li").addClass("active");
                else
                $(".bolinha li a[href*='"+curpage+"']").parents("li").addClass("active");
            }
        </script>



    <script>
        // Função para recarregar a página
        function recarregarPagina() {
        location.reload();
        }

        // Adicione um ouvinte de evento para detectar quando o modal é fechado
        document.getElementById('localizacao').addEventListener('hidden.bs.modal', function () {
        recarregarPagina(); // Chame a função para recarregar a página
        });
    </script>            

    </body>
    
    
    </html>