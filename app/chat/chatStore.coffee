define([
  'Backbone'
  './chatDispatcher'
  '../../fakedata/chatdata'
  '../config'
  '../../lib/fayeClient'
],
(
  Backbone
  dispatcher
  fakedata
  Config
  Client
)->
  UserList = Backbone.Model.extend

    client: Client.client

    defaults:
      users: []
      channels: []

    wireUpUserUpdate: ->
      @client.subscribe '/users', (message)->
        switch message.actionType
          when "refresh"
            @set users: message.payload

    wireUpChannelUpdate: ->
      @client.subscribe '/channels', (message)->
        switch message.actionType
          when "refresh"
            @set channels: message.payload

    initialize: ->
      @wireUpUserUpdate()
      @wireUpChannelUpdate()
      @on "change reset add remove", ->
        dispatcher.dispatch
          actionType: "chat-updated"
          users: @get 'users'
          channels: @get 'channels'
      @set
        users: fakedata.users
        channels: fakedata.channels

  UserList
)
