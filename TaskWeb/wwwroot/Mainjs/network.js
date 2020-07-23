var INTERNET_CONNECTED = true;
var ACTIVE_AJAX_REQUESTS = [];

document.addEventListener('online', function(){ INTERNET_CONNECTED = true; }, false);
document.addEventListener('offline', function(){ INTERNET_CONNECTED = false; }, false);

var Network = (function(){
    return {
      
        isOnline: INTERNET_CONNECTED,
        ajaxRequest: function (params, abortRequests) {
            //GlobalLoading.show();
            if(typeof(abortRequests) === 'undefined')
                abortRequests = true;
            
            if(!Network.isOnline)
            {
                //GlobalLoading.hide();
                Toast.show( 'Veriler alınamadı, lütfen internet bağlantınızı kontrol edin.' ,"hata");

                return;
            }
                
            var OPTIONS = {
                type            : 'GET',
                dataType        : 'json',
                data            : '', 
                success         : function(data){ },
                cache           : false,
                error           : function(jqXHR, textStatus, error){
                    if(error == 'abort')
                        return;
                    //GlobalLoading.hide();
                    Toast.show('Veriler alınırken bir hata oluştu. Lütfen tekrar deneyin.',"hata");
                   
                },
                beforeSend      : function(jqXHR){
                    if(!abortRequests)
                        return;
                    
                    var counter = 0;

                    $(ACTIVE_AJAX_REQUESTS).each(function () {
                        this.abort();
                        counter++;
                    });

                    $(ACTIVE_AJAX_REQUESTS).each(function () {
                        ACTIVE_AJAX_REQUESTS.pop();
                    });

                    ACTIVE_AJAX_REQUESTS.push(jqXHR);
                },
                complete: function () {
                    //GlobalLoading.hide();
                }
            };

            if (params)
                $.extend(OPTIONS, params);
            
            OPTIONS.success = function(data){                
                if(params.success)
                    params.success(data);
            }
            
            $.ajax(OPTIONS);
        }
    }
})();