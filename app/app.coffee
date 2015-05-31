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
#jQuery("body").html(body);

react = require 'React'

jQuery = require 'jQuery'

ChatComp = require './chat/chatComp'

Client = require '../lib/fayeClient'

window.client = require '../lib/fayeClient'

console.log Client

jQuery(document).on "faye:off", (event) ->
  console.log "faye offline"

jQuery(document).on "faye:on", (event) ->
  console.log "faye online"

react.render(
  <ChatComp/>,
  jQuery('chat')[0]
)
