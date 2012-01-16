// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.validate
//= require bootstrap-twipsy
//= require_tree .

$(document).ready(function() {
  $(".topbar").dropdown();


$('form a.add_child').bind('click',function() {
    var association = $(this).attr('data-association');
    var template = $('#' + association + '_fields_template').html();
     var regexp = new RegExp('new_' + association, 'g');
      var new_id = new Date().getTime();

    $(this).parent().before(template.replace(regexp, new_id));
    return false;
  });

});
