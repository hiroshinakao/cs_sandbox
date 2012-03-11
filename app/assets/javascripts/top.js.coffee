# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("div#canvas").dblclick (e) ->
    [x, y] = positionOfNewBlock(e)
    $.post '/blocks', block: { x: x, y: y }, (block_id) ->
      block = $("<div class='block' style='left: #{x}px; top: #{y}px;' />").
        draggable(containment: "parent").css(position: "absolute")
      $(e.target).append(block)

positionOfNewBlock = (e) ->
  canvas = $(e.target)
  x = e.pageX - canvas.position().left
  y = e.pageY - canvas.position().top
  [x, y]