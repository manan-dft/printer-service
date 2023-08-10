function toastSuccessMessage(sHeading, sText) {
    $.toast({
    	heading: sHeading,
		text: sText,
		position: 'top-right',
		loaderBg: '#d62027',
		icon: 'info',
		stack: 1,		
        showHideTransition: 'plain',
        hideAfter: 3e3
    });
    return false;
}

function toastErrorMessage(sHeading, sText) {
    $.toast({
    	heading: sHeading,
		text: sText,
		position: 'top-right',
		loaderBg: '#6c757d',
		icon: 'error',
		stack: 1,		
        showHideTransition: 'plain',
        hideAfter: 3e3
    });
    return false;
}

function sweetAlertSuccessMessage(sHeading, sText) {
    Swal.fire({
        title: sHeading,
        text: sText,
        icon: 'success'
    });
}

function sweetAlertErrorMessage(sHeading, sText) {
    Swal.fire({
        icon: 'error',
        title: sHeading,
        text: sText
    });
}

