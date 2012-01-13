$(document).ready(function(){
  var validator_new_user = $("div.new_employee_wrapper form").validate({
    rules: {
      "user[email]": {
        required: true,
        email: true
        //remote: //TODO
      },
      "user[password]": {
        required: true,
        minlength: 5
      },
      "user[password_confirmation]": {
        required: true,
        minlength: 5,
        equalTo: "#user_password"
      }
    },
    messages: {
      "user[password]": {
        required: "Введите пароль",
        rangelength: jQuery.format("Введите как минимум {0} символов")
      },
      "user[password_confirmation]": {
        required: "",
        minlength: jQuery.format("Введите как минимум {0} символов"),
        equalTo: "Повторите пароль"
      },
      "user[email]": {
        required: "Пожалуйста введите корректный email",
        minlength: "Пожалуйста введите корректный email"
        //remote //TODO
      }
    },
    errorPlacement: function(error, element){
       error.appendTo( element.parent().find(".help-inline") );
    },
    submitHandler: function(){
      alert("submitted");
    },
    success: function(label){
     // 
    }
  });

});
