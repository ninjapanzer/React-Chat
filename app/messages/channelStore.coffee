define([
  'Backbone'
  './messageDispatcher'
  '../userlist/userListStore'
  '../messages/messageStore'
  '../../fakedata/channeldata'
  '../config'
  '../../lib/fayeClient'
],
(
  Backbone
  dispatcher
  UserListStore
  MessageStore
  fakedata
  Config
  Client
)->
  Channel = Backbone.Model.extend

    client: Client.client

    defaults:
      id: ''
      name: ''
      users: new UserListStore
      messages: new MessageStore

    wireUpUserUpdate: ->
      @client.subscribe '/channel', (message)->
        # message = { channelId:'', userList:[] }
        switch message.actionType
          when "refresh"
            @set 'users', message.payload

    initialize: ->
      users = @get 'users'
      @set 'users', new UserListStore users
      @set 'messages', new MessageStore
      @wireUpUserUpdate()
      @on "change reset add remove", ->
        dispatcher.dispatch
          actionType: "user-list-updated"
          users: @get 'users'

  ChannelList = Backbone.Collection.extend
    model: Channel

  ChannelList
)
