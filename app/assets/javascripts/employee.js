clientSideValidations.callbacks.element.fail = function(element, message, callback) {
  callback();
  if (element.data('valid') !== false) {
    //element.parent().find('.message').hide().show('slide', {direction: "left", easing: "easeOutBounce"}, 500);
        element.addClass("error");
        element.parent().parent().addClass("error");
  }
};

clientSideValidations.callbacks.element.pass = function(element, callback, eventData) {
        element.removeClass("error");
        element.parent().parent().removeClass("error");
        element.parent().find('span').remove();
};
