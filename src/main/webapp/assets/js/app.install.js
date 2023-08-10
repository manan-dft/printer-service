function getHtml() {
    const pageTitle = document.querySelector("[property='og:type']").getAttribute("content");
    /*if (pageTitle === "product") {*/
        var productId = window.meta.product.id;
        var variantId = window.meta.product.variants[0].id;
        fetch('https://productview.dakshyafreondtech.com/shopify/check-store-credentials-and-get-html?productId=' + productId + '&variantId=' + variantId, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(response => response.json())
            .then(responseData => {
                let divId = responseData.divId;
                if (divId != null && divId !== "") {
                    var isEmpty = document.getElementById(divId).innerHTML === "";
                    if (isEmpty) {
                        document.getElementById(divId).innerHTML = responseData.html;
                    } else {
                        setPv(responseData.html);
                    }
                } else {
                    setPv(responseData.html);
                }
            });
    /*}*/
}

function setPv(responseDatahtml) {
    var getAllCartForm = document.querySelectorAll("form[action='/cart/add']")
    var getAllCartFormLength = getAllCartForm.length;

    for (var i = 0; i < getAllCartFormLength; i++) {
        var form = getAllCartForm[i];
        var addCartButton = form.querySelector("button[type='submit']");

        if (addCartButton !== null) {
            form.parentNode.innerHTML += responseDatahtml;
        }
    }
}

getHtml();