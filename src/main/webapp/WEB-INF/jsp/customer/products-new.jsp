<!DOCTYPE html>
<html lang="en">
<%@  include file="head.jspf" %>
<body>
<%@  include file="header.jspf" %>

<section>

    <div class="product_detail">
        <div class="container">
            <div class="alert alert-primary icon_info alert-dismissible fade show" id="productUpdateMessage" role="alert" style="display: none">
                <i class="fa fa-cloud-download icon"></i>
                <div id="updatemsg"></div>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="alert alert-success icon_info alert-dismissible fade show" id="productEnableMessage" role="alert" style="display: none">
                <i class="fa fa-check-circle icon"></i><div id="enablemsg"></div>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="row flex-row-reverse">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                    <div class="panel_block">
                        <div class="panel_title">Enable/Disable Product Insight</div>
                        <input type="hidden" value="${accountStoreData}" id="test">
                        <div class="panel_detail">
                            <a href="javascript:updateStoreStatus();" class="btns w-100" id="enableButton">${accountStoreData.isConnected == true ? 'Disable' : 'Enable'}</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12">
                    <div class="panel_block">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${tab == "home" ? "active" : ""}" id="home-tab" data-toggle="tab"
                                   href="#home" role="tab"
                                   aria-controls="home" aria-selected="${tab == "home" ? "true" : "false"}">General</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${tab == "css" ? "active" : ""} " id="samples-tab" data-toggle="tab"
                                   href="#css-preview" role="tab"
                                   aria-controls="profile" aria-selected="${tab == "css" ? "true" : "false"}">CSS</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${tab == "help" ? "active" : ""}" id="samples" data-toggle="tab"
                                   href="#samples-css" role="tab"
                                   aria-controls="profile"
                                   aria-selected="${tab == "help" ? "true" : "false"}">Samples</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link ${tab == "help" ? "active" : ""}" id="insta" data-toggle="tab"
                                   href="#profile" role="tab"
                                   aria-controls="profile" aria-selected="${tab == "help" ? "true" : "false"}">Installation
                                    Instructions</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show ${tab == "home" ? "active" : ""}" id="home" role="tabpanel"
                                 aria-labelledby="home-tab">
                                <form id="storeDetailsForm" name="storeDetailsForm" method="post" action="customer/update-store-details">
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="stockLevel"
                                               name="stockLevel" ${accountStoreData.stockLevel == true ? 'checked' : ''}>
                                        <input type="hidden" id="token" name="token" value="${token}" >
                                        <label class="custom-control-label" for="stockLevel">Stock level</label>
                                    </div>
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="stockVelocity"
                                               name="stockVelocity" ${accountStoreData.stockVelocity == true ? 'checked' : ''}>
                                        <label class="custom-control-label" for="stockVelocity">Stock velocity</label>
                                    </div>
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="totalProductView"
                                               name="totalProductView" ${accountStoreData.totalProductView == true ? 'checked' : ''}>
                                        <label class="custom-control-label" for="totalProductView">Total product
                                            View</label>
                                    </div>
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="totalOrders"
                                               name="totalOrders" ${accountStoreData.totalOrders == true ? 'checked' : ''}>
                                        <label class="custom-control-label" for="totalOrders">Total orders</label>
                                    </div>
                                    <%--<div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="rating"
                                               name="rating" ${accountStoreData.rating == true ? 'checked' : ''}>
                                        <label class="custom-control-label" for="rating">Rating</label>
                                    </div>--%>
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="orderedLastWeek"
                                               name="orderedLastWeek" ${accountStoreData.orderedLastWeek == true ? 'checked' : ''}>
                                        <label class="custom-control-label" for="orderedLastWeek">Ordered last
                                            Week</label>
                                    </div>
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="itemAlreadyInCart"
                                               name="itemAlreadyInCart" ${accountStoreData.itemAlreadyInCart == true ? 'checked' : ''}>
                                        <label class="custom-control-label" for="itemAlreadyInCart">Items already in cart</label>
                                    </div>
                                    <%--<div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="liveCustomer"
                                               name="liveCustomer" ${accountStoreData.liveCustomer == true ? 'checked' : ''}>
                                        <label class="custom-control-label" for="liveCustomer">Live Customer</label>
                                    </div>--%>
                                    <div class="btn-block w-100 float-left text-right m-2">
                                        <button class="btns" type="submit">Submit</button>
                                    </div>
                                </form>
                            </div>

                            <div class="tab-pane fade  ${tab == "help" ? "active" : ""} " id="samples-css"
                                 role="tabpanel" aria-labelledby="profile-tab">
                                <div class="col-12">
                                    <div class="card mb-2">
                                        <div class="card-header">
                                            Sample 1
                                            <label class="float-right" onclick="copyToClipBoard('#style1Css')" role="button" style="color:#008060">Copy CSS</label>
                                            <p class="css" id="style1Css" style="display: none">
                                                .stock_info{ width:100%; float:left; padding:0; margin:0 0 20px
                                                0; border-radius:5px;}
                                                .stock_inn{ width:100%; max-width:250px; float:left; padding:0;
                                                margin:0; border:1px solid #008060; border-bottom:none;
                                                border-right:none;}
                                                .stock_info ul{ padding:0; margin:0;}
                                                .stock_info ul li{ padding:8px 10px; margin:0; font-size:14px;
                                                color:#202223; border-bottom:1px solid #008060; border-right:1px
                                                solid #008060;}
                                                .stock_info ul li label{ min-width:150px; padding:0; margin:0;
                                                display:inline-block;}
                                                .stock_info ul li strong{ color:#008060;}
                                            </p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-5">
                                                    <div class="stock_info">
                                                        <div class="stock_inn">
                                                            <ul>
                                                                <li><label>Stock Level</label> <strong>125</strong></li>
                                                                <li><label>Stock Velocity</label> <strong>250</strong>
                                                                </li>
                                                                <li><label>Total Product View</label>
                                                                    <strong>25</strong></li>
                                                                <li><label>Total Orders</label> <strong>06</strong></li>
<%--                                                                <li><label>Rating</label> <strong>12</strong></li>--%>
                                                                <li><label>Ordered Last Week</label> <strong>09</strong>
                                                                </li>
                                                                <li><label>Items Already in Cart</label>
                                                                    <strong>06</strong>
                                                                </li>
<%--                                                                <li><label>Live Customer</label> <strong>12</strong></li>--%>

                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card mb-2">
                                        <div class="card-header">
                                            Sample 2
                                            <label class="float-right" onclick="copyToClipBoard('#style2Css')" role="button" style="color:#008060">Copy CSS</label>
                                            <p class="css" id="style2Css" style="display: none">
                                                .stock_info.style_change{}
                                                .stock_info.style_change .stock_inn{ max-width:100%;}
                                                .stock_info.style_change ul{ white-space: nowrap; overflow: auto;}
                                                .stock_info.style_change ul li{ width:1%; display:table-cell;}
                                                .stock_info.style_change ul li label{ min-width:inherit;
                                                padding:0; margin:0; display:inline-block;}
                                            </p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="stock_info stock_inline">
                                                        <div class="stock_inn">
                                                            <ul>
                                                                <li><label>Stock Level</label> <strong>125</strong></li>
                                                                <li><label>Stock Velocity</label> <strong>250</strong>
                                                                </li>
                                                                <li><label>Total Product View</label>
                                                                    <strong>25</strong></li>
                                                                <li><label>Total Orders</label> <strong>06</strong></li>
<%--                                                                <li><label>Rating</label> <strong>12</strong></li>--%>
                                                                <li><label>Ordered Last Week</label> <strong>09</strong>
                                                                </li>
                                                                <li><label>Items Already in Cart</label>
                                                                    <strong>06</strong></li>
<%--                                                                <li><label>Live Customer</label> <strong>12</strong></li>--%>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card mb-2">
                                        <div class="card-header">
                                            Sample 3
                                            <label class="float-right" onclick="copyToClipBoard('#style3Css')" role="button" style="color:#008060">Copy CSS</label>
                                            <p id="style3Css" style="display: none">
                                                .stock_info.style_change .stock_inn{ border-color:rgba(0,0,0,0.2);}
                                                .stock_info.style_change ul li{ color:#fff;
                                                border-color:rgba(0,0,0,0.2);}
                                                .stock_info.style_change ul li:nth-child(1) { background:#f94144;}
                                                .stock_info.style_change ul li:nth-child(2) { background:#f3722c;}
                                                .stock_info.style_change ul li:nth-child(3) { background:#90be6d;}
                                                .stock_info.style_change ul li:nth-child(4) { background:#43aa8b;}
                                                .stock_info.style_change ul li:nth-child(5) { background:#577590;}
                                                .stock_info.style_change ul li:nth-child(6) { background: #2786dc;}
                                                .stock_info.style_change ul li:nth-child(7) { background: #3cc5ef;}
                                                .stock_info.style_change ul li:nth-child(8) { background: #37ecdd;}
                                                .stock_info.style_change ul li strong{ color:#fff;}
                                            </p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-5">
                                                    <div class="stock_info colorfull">
                                                        <div class="stock_inn">
                                                            <ul>
                                                                <li><label>Stock Level</label> <strong>125</strong></li>
                                                                <li><label>Stock Velocity</label> <strong>250</strong>
                                                                </li>
                                                                <li><label>Total Product View</label>
                                                                    <strong>25</strong></li>
                                                                <li><label>Total Orders</label> <strong>06</strong></li>
<%--                                                                <li><label>Rating</label> <strong>12</strong></li>--%>
                                                                <li><label>Ordered Last Week</label> <strong>09</strong>
                                                                </li>
                                                                <li><label>Items Already in Cart</label>
                                                                    <strong>06</strong></li>
<%--                                                                <li><label>Live Customer</label> <strong>12</strong></li>--%>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="card mb-2">
                                        <div class="card-header">
                                            Sample 4
                                            <label class="float-right" onclick="copyToClipBoard('#style4Css')" role="button" style="color:#008060">Copy CSS</label>
                                            <p class="css" id="style4Css" style="display: none">
                                                .stock_info.style_change{}
                                                .stock_info.style_change .stock_inn{ border-color:rgba(0,0,0,0.2);}
                                                .stock_info.style_change ul li{ color:#fff; background:#50D0B0; border-color:rgba(0,0,0,0.2);}
                                                .stock_info.style_change ul li strong{ color:#fff;}
                                            </p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-5">
                                                    <div class="stock_info singlecolor">
                                                        <div class="stock_inn">
                                                            <ul>
                                                                <li><label>Stock Level</label> <strong>125</strong></li>
                                                                <li><label>Stock Velocity</label> <strong>250</strong></li>
                                                                <li><label>Total Product View</label> <strong>25</strong></li>
                                                                <li><label>Total Orders</label> <strong>06</strong></li>
<%--                                                                <li><label>Rating</label> <strong>12</strong></li>--%>
                                                                <li><label>Ordered Last Week</label> <strong>09</strong></li>
                                                                <li><label>Items Already in Cart</label> <strong>06</strong></li>
<%--                                                                <li><label>Live Customer</label> <strong>12</strong></li>--%>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card mb-2">
                                        <div class="card-header">
                                            Sample 5
                                            <label class="float-right" onclick="copyToClipBoard('#style5Css')" role="button" style="color:#008060">Copy CSS</label>
                                            <p id="style5Css" class="css" style="display: none">
                                                .stock_info.style_change .stock_inn{ border:none; max-width:100%;}
                                                .stock_info.style_change ul li{ margin:0 5px 10px 0; display:inline-block; border:1px solid rgba(0,0,0,0.2); border-radius:3px;}
                                                .stock_info.style_change ul li label{ min-width:inherit;}
                                                .stock_info.style_change ul li label{ min-width:inherit;}
                                            </p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="stock_info btn_type">
                                                        <div class="stock_inn">
                                                            <ul>
                                                                <li><label>Stock Level</label> <strong>125</strong></li>
                                                                <li><label>Stock Velocity</label> <strong>250</strong></li>
                                                                <li><label>Total Product View</label> <strong>25</strong></li>
                                                                <li><label>Total Orders</label> <strong>06</strong></li>
<%--                                                                <li><label>Rating</label> <strong>12</strong></li>--%>
                                                                <li><label>Ordered Last Week</label> <strong>09</strong></li>
                                                                <li><label>Items Already in Cart</label> <strong>06</strong></li>
<%--                                                                <li><label>Live Customer</label> <strong>12</strong></li>--%>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade  ${tab == "help" ? "active" : ""} " id="profile" role="tabpanel"
                                 aria-labelledby="profile-tab">
                                <ul style="list-style: inside">
                                    <li >
                                        <p>Enable the application to get the hands-on experience.</p>
                                    </li>
                                    <li >
                                        <p>Inside <strong>General</strong> tab, change the settings by enabling or disabling the product details.</p>
                                    </li>
                                    <li >
                                        <p>Inside <strong>Samples</strong> tab, different formats of Product view is listed. Copy the CSS of any style by clicking on "Copy CSS".</p>
                                    </li>
                                    <li>
                                        <p>Paste the copied CSS to "Custom CSS" field inside <strong>CSS</strong> tab. The preview of customized CSS can be viewed by clicking on the "Preview" button. Provide the id of the <code style="font-size: 15px">div</code> tag in the "Div ID" field, where product details can be showed on.</p>
                                    </li>
                                    <li>
                                        <p>By default the product details will be shown below the Description of the product, in case "DivId" field is empty.</p>
                                    </li>

                                </ul>
                            </div>
                            <div class="tab-pane fade show  ${tab == "css" ? "active" : ""}" id="css-preview"
                                 role="tabpanel" aria-labelledby="home-tab">
                                <form id="cssStyleDetails" name="cssStyleDetails" method="post" action="customer/update-css-style">
                                    <div class="row">
                                        <div class="col-xl-6 col-lg-6 col-md-7 col-sm-12">
                                            <div class="form_block">
                                                <label for="divId">Div ID</label>
                                                <input type="text" class="form-control" placeholder="" id="divId"
                                                       name="divId" value="${accountStoreData.divId}" style="">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form_block mb-0">
                                                <label for="css">Custom CSS</label>
                                                <textarea type="text" class="form-control" placeholder="" id="css"
                                                          name="css">${accountStoreData.css}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="btn-block w-100 float-left text-left mt-2 mb-2">
                                        <button class="btns" type="submit">Submit</button>
                                        <button class="btns" type="button" id="btn-preview">Preview</button>
                                    </div>
                                    <div class="card">
                                        <div class="card-header">Preview</div>
                                        <div class="card-body">
                                            <div class="innerbox preview">
                                                <iframe id="live_update" style="width: 100%">
                                                    <!DOCTYPE html>
                                                    <html lang="en">
                                                    <head>
                                                        <meta charset="utf-8">
                                                    </head>
                                                    <body>

                                                    </body>
                                                    </html>
                                                </iframe>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

<footer></footer>
<%@ include file="scripts.jspf" %>
<script src="${pageContext.request.contextPath}/assets/js/products-new.js?ver=<%=ConstantCodes.JS_VERSION%>"></script>
</body>
</html>
