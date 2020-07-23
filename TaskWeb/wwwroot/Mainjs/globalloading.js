var GlobalLoading = (function(){
    return{
        show: function () {

            $('body').append('<div class="loading" ></div>')
            
        },
        hide: function(){
               setTimeout(function() {
                   $('.loading').fadeOut(200);
                   $('.loading').fadeOut(200);

                setTimeout(function() { 
                    $('.loading').remove();
                }, 0);
            }, 200);
        },
       
    }
})();