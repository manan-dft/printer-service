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
    <div class="content animate-panel">
        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel panel-collapse">
                    <div class="panel-heading">
                        <div class="panel-tools">
                            <a class="showhide"><i class="fa fa-chevron-down"></i></a>
                        </div>
                        Create Email Filter Rule
                    </div>
                    <div class="panel-body" style="display: none;">
                        <div class="row">
                            <div id="createEmailFilterRuleFormWrapper" class="col-sm-12"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel panel-collapse">
                    <div class="panel-heading">
                        <div class="panel-tools">
                            <a class="showhide"><i class="fa fa-chevron-down"></i></a>
                        </div>
                        Edit Email Filter Rule
                    </div>
                    <div class="panel-body" style="display: none;">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-inline">
                                    <div class="form-group" style="margin-bottom: 15px;">
                                        <label class="control-label">Search:&nbsp;</label><input type="search" id="editEmailFilterRuleSearch" onkeyup="emailConfig.checkSearchId($(this).val())" class="form-control input-sm" placeholder="">
                                        <button class="btn btn-primary" onclick="emailConfig.searchEmailFilterRule($('#editEmailFilterRuleSearch').val())">Search</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div id="editEmailFilterRuleFormWrapper" class="col-sm-12"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel">
                    <div class="panel-heading">
                        <div class="panel-tools">
                            <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                        </div>
                        Email Filter Rule table
                    </div>
                    <div class="panel-body">
                        <table id="itemsTable" class="table table-striped table-bordered table-hover" width="100%">
                            <thead>
                            <tr>
                                <th>Email Filter Rule ID</th>
                                <th>Subject</th>
                                <th>Email From</th>
                                <th>Condition</th>
                                <th>Is Active</th>
                                <th></th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

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

<script src="${pageContext.request.contextPath}/vendor/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- DataTables buttons scripts -->
<script src="${pageContext.request.contextPath}/vendor/pdfmake/build/pdfmake.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/pdfmake/build/vfs_fonts.js"></script>
<script src="${pageContext.request.contextPath}/vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>

<!-- App scripts -->
<script src="${pageContext.request.contextPath}/scripts/homer.js"></script>
<script src="${pageContext.request.contextPath}/scripts/jquery.validationEngine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/scripts/jquery.validationEngine-en.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/vendor/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/sparkline/index.js"></script>
<script src="${pageContext.request.contextPath}/vendor/sweetalert/lib/sweet-alert.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/toastr/build/toastr.min.js"></script>

<script src="${pageContext.request.contextPath}/scripts/admin/emailConfig.js" type="text/javascript"></script>
</body>
</html>