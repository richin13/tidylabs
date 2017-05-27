$(document).on 'turbolinks:load', ->
  rawSvg = $('#raw-svg').text()
  $('.id-code').append(rawSvg)
