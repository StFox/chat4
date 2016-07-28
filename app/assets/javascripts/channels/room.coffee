$(document).on "ready", ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: gon.room_id },
    received: (data) ->
      $('.messages ul').append("<li>#{data.message}</li><li>#{data.created_at}</li>")
