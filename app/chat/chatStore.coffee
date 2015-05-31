define([
  'Backbone'
  './chatDispatcher'
  '../userlist/userListStore'
  '../messages/channelStore'
  '../../fakedata/chatdata'
  '../config'
  '../../lib/fayeClient'
],
(
  Backbone
  dispatcher
  UserListStore
  ChannelStore
  fakedata
  Config
  Client
)->
  Chat = Backbone.Model.extend

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
        users: new UserListStore(fakedata.users)
        channels: new ChannelStore(fakedata.channels)

  Chat
)
