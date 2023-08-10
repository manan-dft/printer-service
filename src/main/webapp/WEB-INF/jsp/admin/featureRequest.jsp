<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%@ include file="head.jspf" %>
<body class="fixed-navbar fixed-sidebar">

<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>Please wait....</h1>
<div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>
<%@ include file="header.jspf" %>

<!-- Navigation -->
<%@ include file="menu.jspf" %>

<!-- Main Wrapper -->
<div id="wrapper">
    <div class="content animate-panel"></div>

    <!-- Footer-->
    <%@ include file="footer.jspf" %>
</div>

<!-- Vendor scripts -->
<script src="${pageContext.request.contextPath}/vendor/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery-ui/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery-flot/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery-flot/jquery.flot.resize.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery-flot/jquery.flot.pie.js"></script>
<script src="${pageContext.request.contextPath}/vendor/flot.curvedlines/curvedLines.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery.flot.spline/index.js"></script>
<script src="${pageContext.request.contextPath}/vendor/metisMenu/dist/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/peity/jquery.peity.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/sparkline/index.js"></script>

<!-- App scripts -->
<script src="scripts/homer.js"></script>
<script src="scripts/charts.js"></script>

<script>


</script>

</body>
</html>