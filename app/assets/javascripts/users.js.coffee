# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


class Main
  test:->
    alert: 'yay!'

$ ->
  $("span[rel=popover]").popover({
          offset: 10,
          html: true
          })