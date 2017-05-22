$(document).on 'turbolinks:load', ->
  $('[data-toggle="popover"]').popover
    trigger: 'hover | focus'
    container: 'body'
