App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']

  speak: (message, id) ->
    @perform 'speak', message: message, chat_id: id

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  console.log event.target.dataset.id
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value, event.target.dataset.id
    event.target.value = ''
    event.preventDefault()
