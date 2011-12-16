function populate_sample_position(){
    var _this = this;
    var position = $("a.sample_position");
    var input = $('input#position');

    position.bind('click', function(event) {
        event.preventDefault();
        input.val(position.text());
      });
  }

$(document).ready(function() {
  populate_sample_position();
}); 
 
