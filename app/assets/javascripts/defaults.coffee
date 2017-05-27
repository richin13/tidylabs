$(document).ready ->
  if $('.messages').length > 0
    proc = () ->
      $('.messages').html('')
    setTimeout(proc, 5000)
