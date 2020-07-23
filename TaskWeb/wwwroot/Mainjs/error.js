var Error = (function () {
    return {
        Log: function (message, metod) {

            Network.ajaxRequest({
                type: 'POST',
                url: 'Error/Javascript',
                data: '{message:"' + message + '",metod:"' + metod + '"}',
                success: function (data) {
                   
                    Toast.show({ content:  "Beklenmedik Bir Hata Oluştu Lütfen Tekrar Deneyiniz." });

                    window.location.reload(true);
                }
            });
            
        }
    }
})();