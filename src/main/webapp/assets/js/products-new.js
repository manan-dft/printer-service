let AppBridge;
let AppBridgeUtils;
let actions;
let sessionToken;
let app;

$(document).ready(function () {
    AppBridge = window['app-bridge'];
    AppBridgeUtils = window['app-bridge-utils'];
    actions = window['app-bridge'].actions;

    var createApp = AppBridge.default;
    app = createApp({
        apiKey: '6bd11143aea460f8c46949484ddda6d3',
        host: hostJs,
        forceRedirect: true
    });

    AppBridgeUtils.getSessionToken(app).then(token => {sessionToken = token;});

    $("#btn-preview").click(function () {
        $.ajax({
            url: "customer/get-html",
            headers: {"x-auth-token": sessionToken},
            success: function (response) {
                var css = $("#css").val();
                var target = $("#live_update")[0].contentWindow.document;
                target.open();
                target.close();
                $("body", target).append(response);
                $("head", target).append("<style>" + css + "</style>");
            }
        });
    });
});

function updateStoreStatus() {
    AppBridgeUtils.getSessionToken(app).then(token => {sessionToken = token;});
    $.ajax({
        url: "customer/update-enable-status",
        headers: {"x-auth-token": sessionToken},
        success: function (response) {
            console.log(response);
            $('#enablemsg').html(response.message);
            $('#productEnableMessage').show();
            $("#productEnableMessage").delay(5000).fadeOut(1000);
            $('#enableButton').text('Enable');
            if (response.accountStoreData.isConnected === true) {
                $('#enableButton').text('Disable');
            }
        }
    });
}

function copyToClipBoard(element) {

    var temp = $("<input>");
    $("body").append(temp);
    temp.val($(element).text()).select();
    document.execCommand("copy");
    temp.remove();
}

$('#storeDetailsForm').on('submit', function (event) {
    event.preventDefault();
    var formdata = $(this).serialize();
    AppBridgeUtils.getSessionToken(app).then(token => {sessionToken = token;});
    $.ajax({
        url: "customer/update-store-details",
        headers: {"x-auth-token": sessionToken},
        data: formdata,
        type: "POST",
        success: function (response) {
            console.log(response);
            $('#updatemsg').html(response.message);
            $('#productUpdateMessage').show();
            $("#productUpdateMessage").delay(5000).fadeOut(1000);
            $('#enableButton').text('Enable');
            if (response.accountStoreData.isConnected === true) {
                $('#enableButton').text('Disable');
            }
        }
    });
});

$('#cssStyleDetails').on('submit', function (event) {
    event.preventDefault();
    var formdata = $(this).serialize();
    AppBridgeUtils.getSessionToken(app).then(token => {sessionToken = token;});
    $.ajax({
        url: "customer/update-css-style",
        headers: {"x-auth-token": sessionToken},
        data: formdata,
        type: "POST",
        success: function (response) {

            $('#updatemsg').html(response.message);
            $('#productUpdateMessage').show();
            $("#productUpdateMessage").delay(5000).fadeOut(1000);
        }
    });
});