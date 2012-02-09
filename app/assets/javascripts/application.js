// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.validate
//= require facebox
//= require bootstrap.min
//= require bootstrap-twipsy
//= require_tree .

$(document).ready(function() {
    $(".topbar").dropdown();
    
    $('#sign-in').facebox({
      loadingImage: '/assets/loading.gif',
      closeImage: '/assets/closelabel.png'
    });

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

});
