<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
    <c:when test="${empty accountDataDTO}">
        <div class="alert alert-info">
            No client
        </div>
    </c:when>
    <c:when test="${success}">
        <div class="alert alert-success">
            Client Successfully Edited
        </div>
    </c:when>
    <c:otherwise>
        <form:form method="POST" action="admin/editManager/${accountDataDTO.id}" id="editManagerForm"
                   commandName="accountDataDTO" class="form-horizontal">
            <div class="row">
	            <div class="form-group col-lg-6">
	                <label class="col-sm-4 control-label">First Name</label>
	                <div class="col-sm-8">
	                    <form:input type="text" id="fname" path="fname" name="fname"
	                                class="form-control validate[required, minSize[1], maxSize[20]"/>
	                    <span class="error"><form:errors class="text-danger" path="fname"/></span>
	                </div>
	            </div>
	            <div class="form-group col-lg-6">
	                <label class="col-sm-4 control-label">Last Name</label>
	                <div class="col-sm-8">
	                    <form:input type="text" id="lname" name="lname" path="lname"
	                                class="form-control validate[required, minSize[2], maxSize[20]]"/>
	                    <span class="error"><form:errors path="lname" class="text-danger"/></span>
	                </div>
	            </div>
			</div>
			
			<div class="row">
	            <div class="form-group col-lg-6">
	                <label class="col-sm-4 control-label">UserName</label>
	                <div class="col-sm-8">
	                    <form:input type="text" id="editUsername" name="username" path="username"
	                                class="username form-control validate[required, minSize[5], maxSize[20]]" readonly="true" />
	                    <span class="error"><form:errors path="username" class="text-danger"/></span>
	                </div>
	            </div>
	
	            <div class="form-group col-lg-6">
	                <label class="col-sm-4 control-label">Password</label>
	                <div class="col-sm-8">
	                    <form:input type="password" id="editPassword" name="password" path="password"
	                           class="form-control validate[required, minSize[5], maxSize[20]]"/>
	                    <span class="error"><form:errors path="password" class="text-danger"/></span>
	                </div>
	            </div>
			</div>
			
			<div class="row">
	            <div class="form-group col-lg-6">
	                <label class="col-sm-4 control-label">Confirm Password</label>
	                <div class="col-sm-8">
	                    <input type="password"
	                           class="form-control validate[required,equals[editPassword], minSize[5], maxSize[20]]"
	                           value="${accountDataDTO.password}">
	                </div>
	            </div>
	
	            <div class="form-group col-lg-6">
	                <label class="col-sm-4 control-label">Email</label>
	                <div class="col-sm-8">
	                    <form:input type="text" id="email" name="email" path="email"
	                                class="form-control validate[required, custom[email]]"/>
	                    <span class="error"><form:errors path="email" class="text-danger"/></span>
	                </div>
	            </div>
			</div>

			<div class="row">			
	            <div class="form-group col-lg-6">
	                <label class="col-sm-4 control-label">Country</label>
	                <div class="col-sm-8">
	                    <form:select id="country" name="country" path="country" class="form-control m-b validate[required]">
	                        <form:option value="India" label="India"/>
	                    </form:select>
	                    <span class="error"><form:errors path="country" class="text-danger"/></span>
	                </div>
	            </div>
	            <div class="form-group col-lg-6">
	                <label class="col-sm-4 control-label">State</label>
	                <div class="col-sm-8">
	                    <form:select id="state" name="state" path="state" class="form-control m-b validate[required]">
	                        <form:option value="" label=""/>
	                        <form:option value="Andhra Pradesh"/>
	                        <form:option value="Arunachal Pradesh"/>
	                        <form:option value="Assam"/>
	                        <form:option value="Bihar"/>
	                        <form:option value="Chhattisgarh"/>
	                        <form:option value="Goa"/>
	                        <form:option value="Gujarat"/>
	                        <form:option value="Haryana"/>
	                        <form:option value="Himachal Pradesh"/>
	                        <form:option value="Jammu and Kashmir"/>
	                        <form:option value="Jharkhand"/>
	                        <form:option value="Karnataka"/>
	                        <form:option value="Kerala"/>
	                        <form:option value="Madhya Pradesh"/>
	                        <form:option value="Maharashtra"/>
	                        <form:option value="Manipur"/>
	                        <form:option value="Meghalaya"/>
	                        <form:option value="Mizoram"/>
	                        <form:option value="Nagaland"/>
	                        <form:option value="Odisha"/>
	                        <form:option value="Punjab"/>
	                        <form:option value="Rajasthan"/>
	                        <form:option value="Sikkim"/>
	                        <form:option value="Tamil Nadu"/>
	                        <form:option value="Telangana"/>
	                        <form:option value="Tripura"/>
	                        <form:option value="Uttar Pradesh"/>
	                        <form:option value="Uttarakhand"/>
	                        <form:option value="West Bengal"/>
	                    </form:select>
	                    <span class="error"><form:errors path="state" class="text-danger"/></span>
	                </div>
	            </div>
			</div>
			
			<div class="row">			
	            <div class="form-group col-lg-6">
	                <label class="col-sm-4 control-label">City</label>
	                <div class="col-sm-8">
	                    <form:input type="text" id="city" name="city" path="city"
	                                class="form-control validate[required, minSize[5], maxSize[20]]"/>
	                    <span class="error"><form:errors path="city" class="text-danger"/></span>
	                </div>
	            </div>
	
	            <div class="form-group col-lg-6">
	                <label class="col-sm-4 control-label">Pincode</label>
	                <div class="col-sm-8">
	                    <form:input type="text" id="pin" name="pin" path="pin"
	                                class="form-control validate[required, minSize[6], maxSize[6],custom[onlyLetterNumber]]"/>
	                    <span class="error"><form:errors path="pin" class="text-danger"/></span>
	                </div>
	            </div>
			</div>

			<div class="row">			
	            <div class="form-group col-lg-6">
	                <label class="col-sm-4 control-label">Home Phone</label>
	                <div class="col-sm-8">
	                    <form:input type="text" id="hphone" name="hphone" path="hphone"
	                                class="form-control validate[required,custom[phone]]"/>
	                    <span class="error"><form:errors path="email" class="text-danger"/></span>
	                </div>
	            </div>
	
	            <div class="form-group col-lg-6">
	                <label class="col-sm-4 control-label">Work Phone</label>
	                <div class="col-sm-8">
	                    <form:input type="text" id="wphone" name="wphone" path="wphone"
	                                class="form-control validate[required,custom[phone]]"/>
	                    <span class="error"><form:errors path="wphone" class="text-danger"/></span>
	                </div>
	            </div>
			</div>

            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-10">
                    <%--<button class="btn btn-default" type="submit">Cancel</button>--%>
                    <button class="btn btn-primary" type="submit">Update Client</button>
                </div>
            </div>
        </form:form>
    </c:otherwise>
</c:choose>