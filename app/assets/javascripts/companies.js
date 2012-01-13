$(document).ready(function() {
    // validate signup form on keyup and submit
    var validator = $("div.new_company_wrapper form#new_user").validate({
        rules: {
            'user[company_attributes][name]': "required",
            'user[company_attributes][sphere_id]': "required",
            'user[company_attributes][city]': {
                required: true,
                minlength: 2
            },
            'user[password]': {
                required: true,
                minlength: 5
            },
            'user[password][confirmation]': {
                required: true,
                minlength: 5,
                equalTo: "#password"
            },
            'user[email]': {
                required: true,
                email: true//,
//                remote: "emails.php"
            }
        },
        messages: {
            'user[company_attributes][name]':  "Enter Company name",
            'user[company_attributes][sphere_id]': "Enter sphere",
            'user[company_attributes][city]': {
                required: "Enter a username",
                minlength: jQuery.format("Enter at least {0} characters")
            },
            'user[password]': {
                required: "Provide a password",
                rangelength: jQuery.format("Enter at least {0} characters")
            },
            'user[password][confirmation]': {
                required: "Repeat your password",
                minlength: jQuery.format("Enter at least {0} characters"),
                equalTo: "Enter the same password as above"
            },
            'user[email]': {
                required: "Please enter a valid email address",
                minlength: "Please enter a valid email address"//,
//                remote: jQuery.format("{0} is already in use")
            },
            dateformat: "Choose your preferred dateformat",
            terms: " "
        },
        // the errorPlacement has to take the table layout into account
        errorPlacement: function(error, element) {
            if ( element.is(":radio") )
                error.appendTo( element.parent().next().next() );
            else if ( element.is(":checkbox") )
                error.appendTo ( element.next() );
            else
                //alert(error);
                error.appendTo( element.parent().find(".help-inline") );
        },
        // specifying a submitHandler prevents the default submit, good for the demo
        submitHandler: function() {
            alert("submitted!");
        },
        // set this class to error-labels to indicate valid fields
        success: function(label) {
            // set   as text for IE
            label.html(" ").addClass("checked");
        }
    });

    // propose username by combining first- and lastname
    $("#username").focus(function() {
        var firstname = $("#firstname").val();
        var lastname = $("#lastname").val();
        if(firstname && lastname && !this.value) {
            this.value = firstname + "." + lastname;
        }
    });

});
