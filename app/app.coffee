chat = require '../lib/chatClient'
socket = io('http://localhost:3000');
socket.on 'connect', ->
  socket.emit 'chat message', 'HI'
  console.log 'hi'
socket.on 'event', ->
  console.log "event"
socket.on('disconnect', ->);


socket.on 'chat message', (data)->
  console.log data
