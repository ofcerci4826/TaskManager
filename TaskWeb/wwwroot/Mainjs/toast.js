var TOAST_LENGTH = {
    SHORT: 2000,
    LONG: 6000
};

var TOAST_POSITION = {
    TOP_RIGHT: 'top-right',
    BOTTOM_RIGHT: 'bottom-right'
};

var TOAST_TYPE = {
    SUCCESS: 'success',
    WARNING: 'warning',
    ERROR: 'error',
    INFO: 'info'
};

var Toast = (function(){
    return{
        show: function (message, type) {

            toastr.options = {
                "closeButton": true, 
                "progressBar": true,
                "positionClass": "toast-top-right",  
                "showDuration": "10000",
                "hideDuration": "10000",
                "timeOut": "10000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            
           
            if (type == "error")//hata
            {
                toastr.error(message);
            }
            else if (type == "success")//başarılı
            {
                toastr.success(message);
            }
            else if (type == "info")
            {
                toastr.info(message);
            }
            else
            {
                toastr.info(message);
            }
             
        }
    }
})();