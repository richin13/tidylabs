$(document).ready ->
  messages = $('.messages .alert')
  # we wait until the initial animation is done
  if messages.length > 0
    removeAnimation = () ->
      messages.removeClass('animated').removeClass('slideInDown')

    setTimeout(removeAnimation, 750)

    proc = () ->
      messages.slideUp(750)
    setTimeout(proc, 5000)
