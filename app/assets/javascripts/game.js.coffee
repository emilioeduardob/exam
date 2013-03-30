# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  update_screen = (game_info) ->
    draw_table(game_info.table)
    set_game_status(game_info)

  set_game_status = (game_info) ->
    status = $('#game_status')
    if game_info.winner
      status.html(game_info.winner) 
    else
      status.html('')



  draw_table = (table_info) ->
    table = $('table#tictac')
    for row in [0..2] by 1
      for column in [0..2] by 1
        new_value = table_info[row][column]
        new_value = "?" if new_value == null
        $("#cell#{row}#{column}").html( new_value )


  $('#cancelar').click (e) ->
    e.preventDefault()

    cancelUrl = $(this).attr('href')
    $.ajax
      url: cancelUrl
      type: 'POST'
      success: (data) ->
        update_screen(data)


  $('table#tictac td').click ->
    cell = $(this)
    playUrl = $('table#tictac').data('playurl')

    $.ajax
      url: playUrl
      data: {new_mark: cell.data('cell')}
      type: 'POST'
      success: (data) ->
        update_screen(data)
