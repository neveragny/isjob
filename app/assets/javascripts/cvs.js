$(document).ready(function() {

    init_user_details_form("#new_user_detail");
    
    // from new cv form, needs to be moved to respect js file
    $('form a.add_child').bind('click', function() {
        var association = $(this).attr('data-association');
        var template = $('#' + association + '_fields_template').html();
        var regexp = new RegExp('new_' + association, 'g');
        var new_id = new Date().getTime();

        $(this).parent().before(template.replace(regexp, new_id));
        return false;
    });

    $('form a.remove_child').live('click', function() { $(this).parent().parent().hide(); });

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

    var validator_new_cv = $("div.new_cv_wrapper form").validate({
        rules : {
            "cv[title]" : {
                required: true,
                minlength: 5
            },
    
            "cv[experience_attributes][0][company]" : {
                required: true
            },
            "cv[experience_attributes][0][city]" : {
                required: true
            },
            "cv[experience_attributes][0][position]" : {
                required: true
            },
            "cv[experience_attributes][0][date_start]" : {
                required: true
            },
            "cv[experience_attributes][0][date_end]" : {
                required: true
            },
            "cv[education_attributes][0][level]" : {
                required: true
            },
            "cv[education_attributes][0][name]" : {
                required: true
            },
            "cv[education_attributes][0][faculty]" : {
                required: true
            },
            "cv[education_attributes][0][city]" : {
                required: true
            },
            "cv[education_attributes][0][date_start]" : {
                required: true
            },
            "cv[education_attributes][0][date_end]" : {
                required: true
            },
            "cv[active]" : {
                required: true
            }
        },
        messages: {
            "cv[title]" : {
                required: "Введите заголовок резюме",
                minlength: "Введите заголовок резюме"
            },
    
            "cv[experience_attributes][0][company]" : {
                required: "Введите название компании"
            },
            "cv[experience_attributes][0][city]" : {
                required: "Пожалуйста введите корректный город",
                minlength: "Пожалуйста введите корректный город"
            },
            "cv[experience_attributes][0][position]" : {
                required: "Укажите должность"
            },
            "cv[experience_attributes][0][date_start]" : {
                required: "Укажите дату"
            },
            "cv[experience_attributes][0][date_end]" : {
                required: "Укажите дату"
            },
            "cv[education_attributes][0][level]" : {
                required: "Укажите уровень образования"
            },
            "cv[education_attributes][0][name]" : {
                required: "Укажите название учебного заведения"
            },
            "cv[education_attributes][0][faculty]" : {
                required: "Укажите факультет/специальность"
            },
            "cv[education_attributes][0][city]" : {
                required: "Укажите город"
            },
            "cv[education_attributes][0][date_start]" : {
                required: "Укажите дату"
            },
            "cv[education_attributes][0][date_end]" : {
                required: "Укажите дату"
            },
            "cv[active]" : {
                required: "Укажите статус резюме"
            }            
        },
        errorPlacement: function(error, element) {
            error.appendTo(element.parent().find(".help-inline"));
//            element.parent().parent().addClass("error");
        },
        submitHandler: function() {
            $("div.new_employee_wrapper form").submit();
        },
        success: function(label) {
//               
        },
        highlight: function(element, errorClass){
            $(element).parent().parent().addClass("error");
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).parent().parent().removeClass("error");
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

