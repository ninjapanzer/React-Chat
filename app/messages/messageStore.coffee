define([
  'Backbone'
  './messageDispatcher'
  '../chat/chatDispatcher'
  '../config'
  '../../lib/fayeClient'
],
(
  Backbone
  dispatcher
  chatDispatcher
  Config
  Client
)->
  Message = Backbone.Model.extend

    client: Client.client

    defaults:
      messageText: ''
      user: ''
      time: 12312312312

    initialize: ->
      @on "change reset add remove", ->
        chatDispatcher.dispatch
          actionType: "message-sent"

  MessageList = Backbone.Collection.extend({
    model: Message
  });

  MessageList
)
