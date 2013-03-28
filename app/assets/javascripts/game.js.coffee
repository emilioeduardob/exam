# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->


  draw_table = (table_info) ->
    table = $('table#tictac')



  $('#cancelar').click ->
    console.log('redibujar')

  $('table#tictac td').click ->
    cell = $(this)
    playUrl = $('table#tictac').data('playurl')
    console.log('clicked '  + cell.data('cell'))

    $.ajax
      url: playUrl
      data: {new_mark: cell.data('cell')}
      type: 'POST'
      success: (data) ->
        cell.html('X')
        console.log('update view with server play')
        draw_table(data.table)
