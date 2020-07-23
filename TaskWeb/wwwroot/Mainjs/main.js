$(document).ready(function () {



    $(function () {


        if ($('#DatatableJs').length > 0) {

            var $self = $('#DatatableJs');
            var url = $self.attr("data-url");
            var chartDataUrl = url; 
            // Initialize Example 1
            $('#DatatableJs').dataTable({
                "ajax": chartDataUrl,
                dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                buttons: [
                    { extend: 'copy', className: 'btn-sm' },
                    { extend: 'csv', title: 'ExampleFile', className: 'btn-sm' },
                    { extend: 'pdf', title: 'ExampleFile', className: 'btn-sm' },
                    { extend: 'print', className: 'btn-sm' }
                ]
            });
        }
        // JSON data
       

        // Initialize Example 2
        //$('.datatale').dataTable();

    });
   
        if ("closed" === localStorage.getItem("menu"))
            $('body').addClass("hide-sidebar");
         

   
    $(document).on("click", "#btn-menu-toggle", function () {
        if ($('body').attr("class") == "sidebar-scroll fixed-navbar hide-sidebar") {
            localStorage.setItem("menu", "closed");
        }
        else {
            localStorage.setItem("menu", "opened");
        }


    });
    
    $(document).on('submit', '.form-submit', function () {
    
        var $form = $(this);
        var resetOnFail = ("true" == $form.attr("data-reset"));
        var returnUrl = $('#returnUrl').val();

        GlobalLoading.show();
        //alert($form.serialize());
        

        Network.ajaxRequest({
            type: $form.attr("method"),
            url: $form.attr("action"),
            data: $form.serialize(),
            success: function (data) {
                console.log(data);
                GlobalLoading.hide();
                if (data.Status == 402) {
                    Toast.show("Geçersiz oturum.", "error");
                    window.location.reload(true);
                    return;
                }

                if (data.Status == 403) {
                    Toast.show("Bu işleme yetkiniz bulunmamaktadır.", "error");
                    return;
                }

                if (data.Status == 400) {
                    Toast.show("Lütfen tüm gerekli bilgileri doldurunuz.", "error");
                    return;
                }
                 

                if (data.Status != 200 && data.Status != 199)
                {
                    if (data.Result != null && typeof (data.Result) == 'object') {
                        
                        Toast.show(data.Result.ErrorMessage, "error");
                        return;
                    }
                    Toast.show(data.Result, "error");
                   
                    return;
                }

                if (data.Status == 199)
                    returnUrl += (returnUrl.indexOf("?") >= 0 ? '&id=' + data.Id : '?id=' + data.Id);

                Toast.show("İşleminiz başarılı", "success");
                $form[0].reset();
                $(".select2").select2();
                if (returnUrl && returnUrl.length > 0)
                    location.href = returnUrl;
            }
        });

        return false;
    });
    
    $(document).on('submit', '#loginForm', function () {
        var $form = $(this);
        var returnUrl = $('#returnUrl').val();
            Network.ajaxRequest({
                type: $form.attr("method"),
                url: $form.attr("action"),
                data: $form.serialize(),
                success: function (data) {
                    console.log(data);

                    if (data.Result.LoginRedirectUrl != null && data.Result.LoginRedirectUrl != '' ) {
                        location.href = data.Result.LoginRedirectUrl;
                        Toast.show('Sayfaya yönlendiriliyorsunuz', "success");
                        return;
                    }

                    if (data.Status != 200) {
                        Toast.show(data.Result,"hata");
                        return;
                    }
                     
                    if (data.Status == 199)
                        returnUrl += (returnUrl.indexOf("?") >= 0 ? '&id=' + data.Id : '?id=' + data.Id);
                    
                    if (returnUrl && returnUrl.length > 0)
                        location.href = returnUrl;
                }
              
            });

            return false;
        });
    
    $(document).on("click", ".default-delete", function () {
        var $self = $(this);
        var url  = $self.attr("data-url");
        var name = $self.attr("data-name");

        if (!confirm("\"" + name + "\" kaydı ve bu kayda ilişkin tüm bilgiler silinecektir, devam etmek istediğinizden emin misiniz?"))
            return false;

        GlobalLoading.show();

        Network.ajaxRequest({
            type: 'POST',
            url: url,
            success: function (data) {
                console.log(data);

                if (data.Status == 402) {
                    Toast.show({ content: "Geçersiz oturum." });
                    window.location.reload(true);
                    return;
                }

                if (data.Status == 403) {
                    Toast.show({ content: "Bu işleme yetkiniz bulunmamaktadır." });
                    return;
                }

                if (data.Status == 400) {
                    Toast.show({ content: "Lütfen tüm gerekli bilgileri doldurunuz." });
                    return;
                }

                if (data.Status != 200 && data.Status != 199) {
                    if (data.Result != null && typeof (data.Result) == 'object') {
                        Toast.show({ content: data.Result.ErrorMessage });
                        return;
                    }

                    Toast.show({ content: data.Result });
                    return;
                }

                $self.parents('tr').eq(0).remove();

                Toast.show({ content: name + " kaydı başarıyla silindi." });

                window.location.reload(true);
            }
        });

        return false;
    });

    $(document).on('click', '.musteri-row', function (e) {
        if ($(e.target).is('.action'))
            return false;

        window.location.href = $(this).attr("data-url");
    });

    $(document).on("click", ".detay", function () {
        $(".preloader").css("display", "block");

            //data-target dan url mizi al
            var url = $(this).data("target");

            //bu urlimizi post et
            $.post(url, function (data) { }) 

                //eğer işlemimiz başarılı bir şekilde gerçekleşirse
                .done(function (data) {
                    //gelen datayı .modal-body mizin içerise html olarak ekle
                    $("#modelView .modal-body").html(data);
                    //sonra da modalimizi göster
                    $("#modelView").modal("show");
                    $(".preloader").css("display", "none");
                })
                //eğer işlem başarısız olursa
                .fail(function (data) {

                    error.Log(data.d,url+' Modal View Fonksiyonu');
                    $(".preloader").css("display", "none");
                })

        });
});
