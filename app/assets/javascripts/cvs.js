$(document).ready(function() {
  init_user_details_form("#new_user_detail");
});

function init_user_details_form(form){
  $(form).submit(function(){
      return formValidated(form);
  });

  $(form).
    bind("ajax:complete", function(data, status, xhr){
      var responce = $.parseJSON(status.responseText);
      if(responce = "ok"){
        $("form#new_user_detail").hide();
        $("div.inactive").show();
      } 
    });

    $(form + " input").blur(function(){
        if( !$(this).val() ) {
            $(this).addClass('error');
            $(this).parent('div.clearfix').addClass('error');
        } else {
            $(this).removeClass('error');
            $(this).parent('div.clearfix').removeClass('error');
        }
    });

}

function formValidated(form){
    var validated = true;
    $(form + " input").each(function(){
        if( !$(this).val() ){
            validated = false;
        }
    });
    return validated;
}