# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('table#tictac td').click ->
    cell = $(this)
    playUrl = $('table#tictac').data('playurl')
    console.log('clicked '  + cell.data('cell'))

    $.ajax
      url: playUrl
      data: {new_mark: cell.data('cell')}
      type: 'POST'
      success: (data) ->
        console.log('update view with server play')
