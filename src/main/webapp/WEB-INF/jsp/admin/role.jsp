<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/jquery/src/treeview/jquery.treeview.css" />
<%@ include file="head.jspf" %>
<body class="fixed-navbar fixed-sidebar">
<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>Please wait....</h1>
<div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>
<%@ include file="header.jspf" %>
<style>
.col-lg-6 > .col-sm-8 {
	margin-top: 1.4%;
}
.col-lg-4 > .col-sm-8 {
	margin-top: 2.5%;
}
</style>
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
                        Create Role
                    </div>
                    <div class="panel-body" style="display: none;">
                        <div class="row">
                            <div id="createFormWrapper" class="">
                            	<form method="POST" action="admin/role/" commandName="model" class="form-horizontal">
								    <div class="row">
										<div class="form-group col-lg-6">
											<label class="col-sm-4 control-label">Role Name</label>
								        	<div class="col-sm-8">
								    			<input type="text" name="rName" id="rName" class="form-control validate[required, minSize[2], maxSize[200]]" />
								       		</div>
								       		<div class="col-sm-12" style="margin-top: 3%;"></div>
								       		<label class="col-sm-4 control-label">Role Description</label>
								        	<div class="col-sm-8">
								    			<textarea name="rDesc" id="rDesc" rows="2" cols="300" class="form-control" ></textarea>
								       		</div>
										</div>
										<div class="form-group col-lg-2"></div>
										<div id="menutree" class="form-group col-lg-4">
											
										</div>
									</div>
									
									<div class="hr-line-dashed"></div>
									<div class="form-group">
									    <div class="col-sm-8 col-sm-offset-10">
									        <button class="btn btn-primary" type="submit">Save Role</button>
									    </div>
									</div>
	
                            	</form>
                            </div>
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
                        Edit Role
                    </div>
                    <div class="panel-body" style="display: none;">
                    	<div class="row">
                            <div class="col-sm-12">
                                <div class="form-inline">
                                    <div class="form-group" style="margin-bottom: 15px;">
                                        <label class="control-label">Search:&nbsp;</label><input type="search" id="editSearch" onkeyup="role.checkSearchId($(this).val())" class="form-control input-sm" placeholder="">
                                        <button class="btn btn-primary" onclick="role.search($('#editSearch').val(),1)">Search</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div id="editFormWrapper" style="display: none;" class="col-sm-12">
                            	<form method="POST" action="admin/editSaveRole/" commandName="model" class="form-horizontal">
								    <div class="row">
										<div class="form-group col-lg-6">
											<label class="col-sm-4 control-label">Role Name</label>
								        	<div class="col-sm-8">
								    			<input type="text" name="rName" id="rEditName" class="form-control validate[required, minSize[2], maxSize[200]]" />
								    			<input type="hidden" name="editId" id="editId" class="form-control" />
								       		</div>
								       		<div class="col-sm-12" style="margin-top: 3%;"></div>
								       		<label class="col-sm-4 control-label">Role Description</label>
								        	<div class="col-sm-8">
								    			<textarea name="rDesc" id="rEditDesc" rows="2" cols="300" class="form-control" ></textarea>
								       		</div>
										</div>
										<div class="form-group col-lg-2"></div>
										<div id="editmenutree" class="form-group col-lg-4">
											
										</div>
									</div>
									
									<div class="hr-line-dashed"></div>
									<div class="form-group">
									    <div class="col-sm-8 col-sm-offset-10">
									        <button class="btn btn-primary" type="submit">Save Role</button>
									    </div>
									</div>
	
                            	</form>
                            </div>
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
                        Role List
                    </div>
                    <div class="panel-body">
                        <table id="itemsTable" class="table table-striped table-bordered table-hover" style="width:100%">
                            <thead>
                            <tr>
                                <th style="width: 10%">Roll Number</th>
                                <th style="width: 30%">Roll Name</th>
                                <th style="width: 10%">Action</th>
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


<!-- View Staff -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog" style="width: 80%;">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="padding: 8px !important;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4><b>View Staff</b></h4>
      </div>
      <div class="modal-body">
      	<div class="form-horizontal">
	        <div class="row">
                <div id="viewFormWrapper" class="col-sm-12">
				    <div class="row">
						<div class="form-group col-lg-6">
							<label class="col-sm-4 control-label">Role Name :</label>
				        	<div class="col-sm-8">
				        		<span id="rViewName"></span>
				       		</div>
				       		<div class="col-sm-12" style="margin-top: 3%;"></div>
				       		<label class="col-sm-4 control-label">Role Description :</label>
				        	<div class="col-sm-8">
				        		<span id="rViewDesc"></span>
				       		</div>
						</div>
						<div class="form-group col-lg-2"></div>
						<div id="viewmenutree" class="form-group col-lg-4">
							
						</div>
					</div>
					
                </div>
            </div>
		</div>		
      </div>
      <div class="modal-footer" style="padding: 8px !important;">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
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
<script src="${pageContext.request.contextPath}/vendor/sweetalert/lib/sweet-alert.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/toastr/build/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery/src/treeview/jquery.treeview.js"></script>
<!-- App scripts -->
<script src="${pageContext.request.contextPath}/scripts/homer.js"></script>
<script src="${pageContext.request.contextPath}/scripts/jquery.validationEngine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/scripts/jquery.validationEngine-en.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/scripts/charts.js"></script>
<script src="${pageContext.request.contextPath}/scripts/admin/role.js"></script>

</body>
</html>