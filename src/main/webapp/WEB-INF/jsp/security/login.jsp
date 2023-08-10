<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
    <link href="assets/css/bootstrap.css" rel="stylesheet">

</head>

<body>
<div id="container" class="cls-container">

    <div id="bg-overlay"></div>

    <div class="cls-content">
        <div class="cls-content-sm panel">
            <div class="panel-body">

                <form id="loginForm" name="loginForm" method="post" action="login"
                      style="margin-left: 450px; width: 25%; margin-top: 100px">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Username" autofocus name="username"
                               id="username" value="cambridgetestshop.myshopify.com">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Password" name="password" id="password"
                               value="cambridgetestshop.myshopify.com">
                    </div>
                    <div class="checkbox pad-btm text-left">
                        <input id="demo-form-checkbox" class="magic-checkbox" type="checkbox">
                        <label for="demo-form-checkbox">Remember me</label>
                    </div>
                    <button class="btn btn-primary btn-lg btn-block" id="submitbtn" type="submit">Sign In</button>
                </form>
            </div>
        </div>
    </div>

</div>


</body>
</html>
