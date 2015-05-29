#chat = require '../lib/chatClient'
#socket = io('http://localhost:3000');
#socket.on 'connect', ->
#  socket.emit 'chat message', 'HI'
#  console.log 'hi'
#socket.on 'event', ->
#  console.log "event"
#socket.on('disconnect', ->);


#socket.on 'chat message', (data)->
#  console.log data

#body = require("./thing.jade")();
#console.log body
#$("body").html(body);

react = require 'React'

UserListComp = require './userlist/userListComp'

react.render(
  <UserListComp />,
  $('chat userlist')[0]
)

UserListCollection = require './userlist/UserListCollection'
coll = new UserListCollection
