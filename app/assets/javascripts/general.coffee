# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('textarea').autosize();

  $('a[href*="#"]:not([href="#"]):not([data-toggle="tab"])').click ->
    if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') and location.hostname == @hostname
      target = $(@hash)
      target = if target.length then target else $('[name=' + @hash.slice(1) + ']')
      if target.length
        $('html, body').animate { scrollTop: target.offset().top }, 1000
        return false
    return
  return

$ ->
  hash = window.location.hash
  hash and $('ul.nav a[href="' + hash + '"]').tab('show')
  $('.nav-tabs a').click (e) ->
    $(this).tab 'show'
    scrollmem = $('body').scrollTop()
    window.location.hash = @hash
    $('html,body').scrollTop scrollmem
    return
  return
