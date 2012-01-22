$(document).ready(function() {
    init_user_details_form("#new_user_detail");

    $.datepicker.setDefaults( $.datepicker.regional[ "ru" ] );
    $("form .datepicker").datepicker(); //$.datepicker.setDefaults( $.datepicker.regional[ "" ] );
});

function init_user_details_form(form) {
    $(form).submit(function() {
        return formValidated(form);
    });

    $(form).
        bind("ajax:complete", function(data, status, xhr) {
            var responce = $.parseJSON(status.responseText);
            if (responce = "ok") {
                $("form#new_user_detail").hide();
                $("div.inactive").show();
            }
        });

    $(form + " input").blur(function() {
        if (!$(this).val()) {
            $(this).addClass('error');
            $(this).parent('div.clearfix').addClass('error');
        } else {
            $(this).removeClass('error');
            $(this).parent('div.clearfix').removeClass('error');
        }
    });


//
//
//


    var validator_new_cv = $("div.new_cv_wrapper form").validate({
        rules: {
            "cv[title]": {
                required: true,
                minlength: 5
            },
            "cv[experience_attributes][0][company]": {
                required: true,
                minlength: 5
            },
            "cv[experience_attributes][0][city]": {
                required: true,
                minlength: 5
            }
        },
        messages: {
            "cv[title]": {
                required: "Введите заголовок резюме",
                minlength: "Введите заголовок резюме"
            },
            "cv[experience_attributes][0][company]": {
                required: "asdasd"
            },
            "cv[experience_attributes][0][city]": {
                required: "Пожалуйста введите корректный город",
                minlength: "Пожалуйста введите корректный город"
                //remote //TODO
            }
        },
        errorPlacement: function(error, element) {
            error.appendTo(element.parent().find(".help-inline"));
        },
        submitHandler: function() {
            $("div.new_employee_wrapper form").submit();
        },
        success: function(label) {
            //
        }
    });


//
//
//
}

function formValidated(form) {
    var validated = true;
    $(form + " input").each(function() {
        if (!$(this).val()) {
            validated = false;
        }
    });
    return validated;
}

