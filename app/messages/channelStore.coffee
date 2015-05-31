define([
  'Backbone'
  './messageDispatcher'
  '../userlist/userListStore'
  '../../fakedata/channeldata'
  '../config'
  '../../lib/fayeClient'
],
(
  Backbone
  dispatcher
  UserListStore
  fakedata
  Config
  Client
)->
  Channel = Backbone.Model.extend

    client: Client.client

    defaults:
      id: ''
      data:
        name: ''
        users: []

    wireUpUserUpdate: ->
      @client.subscribe '/channel', (message)->
        # message = { channelId:'', userList:[] }
        switch message.actionType
          when "refresh"
            @set 'users', message.payload

    initialize: ->
      users = @get 'users'
      @set 'users', new UserListStore users
      @wireUpUserUpdate()
      @on "change reset add remove", ->
        dispatcher.dispatch
          actionType: "user-list-updated"
          users: @get 'users'

  ChannelList = Backbone.Collection.extend
    model: Channel

  ChannelList
)
