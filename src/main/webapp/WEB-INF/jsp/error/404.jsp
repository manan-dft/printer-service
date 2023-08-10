<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script>document.write('<base href="' + location.protocol + '//' + location.host + '${pageContext.request.contextPath}/' + '" />');</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Page title -->
    <title>HOMER | WebApp admin theme</title>

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/favicon.ico" />

    <!-- Vendor styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fontawesome/css/font-awesome.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/metisMenu/dist/metisMenu.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/animate.css/animate.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/dist/css/bootstrap.css" />

    <!-- App styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css">

</head>
<body class="blank">

<!-- Simple splash screen-->
<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>Homer - Responsive Admin Theme</h1><p>Special Admin Theme for small and medium webapp with very clean and aesthetic style and feel. </p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>
<!--[if lt IE 7]>
<p class="alert alert-danger">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<div class="color-line"></div>

<div class="back-link">
    <a href="index" class="btn btn-primary">Back to Dashboard</a>
</div>
<div class="error-container">
    <i class="pe-7s-way text-success big-icon"></i>
    <h1>404</h1>
    <strong>Page Not Found</strong>
    <p>
        Sorry, but the page you are looking for has note been found. Try checking the URL for error, then hit the refresh button on your browser or try found something else in our app.

    </p>
    <a href="index" class="btn btn-xs btn-success">Go back to dashboard</a>
</div>


<!-- Vendor scripts -->
<script src="${pageContext.request.contextPath}/vendor/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery-ui/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/metisMenu/dist/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/sparkline/index.js"></script>

<!-- App scripts -->
<script src="${pageContext.request.contextPath}/scripts/homer.js"></script>

</body>
</html>
