<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form:form method="POST" action="admin/email_filter_rule/${model.id}" commandName="model" class="form-horizontal">
    <div class="row">
        <div class="form-group col-lg-6">
            <label class="col-sm-4 control-label">Subject</label>

            <div class="col-sm-8">
                <form:input type="text" path="subject"
                            class="form-control validate[required, minSize[2], maxSize[500]"/>
                <span class="error"><form:errors class="text-danger" path="subject"/></span>
            </div>
        </div>
        <div class="form-group col-lg-6">
            <label class="col-sm-4 control-label">Email From</label>

            <div class="col-sm-8">
                <form:input type="text" path="emailFrom"
                            class="form-control validate[required, minSize[2], maxSize[500]]"/>
                <span class="error"><form:errors path="emailFrom" class="text-danger"/></span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-6">
            <label class="col-sm-4 control-label">Condition</label>

            <div class="col-sm-8">
                <form:select path="condition" class="form-control m-b validate[required]">
                    <form:option value="" label=""/>
                    <form:option value="AND"/>
                    <form:option value="OR"/>
                </form:select>
                <span class="error"><form:errors path="condition" class="text-danger"/></span>
            </div>
        </div>
        <div class="form-group col-lg-6">
            <label class="col-sm-4 control-label"></label>
            <div class="col-sm-8">
                <div class="checkbox">
                    <label><form:checkbox path="active" class="i-checks"/>Is Active</label>
                </div>
            </div>
        </div>
    </div>

    <div class="hr-line-dashed"></div>
    <div class="form-group">
        <div class="col-sm-8 col-sm-offset-10">
                <%--<button class="btn btn-default" type="submit">Cancel</button>--%>
            <button class="btn btn-primary" type="submit">Save Email Filter Rule</button>
        </div>
    </div>
</form:form>