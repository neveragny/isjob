
$(document).ready(function() {
    PositionForm.setup();
});

var PositionForm = {
    setup: function() {
        $("div.spheres :checkbox").bind('click', checkedAmount)}
};

function checkedAmount(){
    var n = $("div.spheres input:checked").length;
    if(n > 3){
        $("div.spheres").addClass("error");
    } else {
      $("div.spheres").removeClass("error");
    }
}

function initDeleteLinks(){
  $('a[data-method="delete"]').bind('ajax:success',
    function(data, textStatus,jqXHR){
      var target = $('div.positions tr[data-id='+textStatus.position_id + ']')
      target.remove();
    });
    
}
