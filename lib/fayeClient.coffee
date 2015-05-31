$ = require 'jQuery'

s4 = ->
  Math.floor((1 + Math.random()) * 0x10000).toString(16).substring 1

createClient = ->
  client = new (Faye.Client)('http://localhost:8000/faye')
  client.on 'transport:down', ->
    $(document).trigger 'faye:off'
    online = false
  client.on 'transport:up', ->
    $(document).trigger 'faye:on'
    online = true
  client

module.exports =
  client: createClient()
  id: s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4()
