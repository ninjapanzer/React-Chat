define([
  'Backbone'
  './messageDispatcher'
  '../../fakedata/channeldata'
  '../userlist/userListStore'
  '../config'
  '../../lib/fayeClient'
],
(
  backbone
  dispatcher
  fakedata
  userListStore
  Config
  Client
)->
  UserList = Backbone.Model.extend

    client: Client.client

    defaults:
      id: ''
      users: []

    wireUpUserUpdate: =>
      @client.subscribe '/channel', (message)=>
        # message = { channelId:'', userList:[] }
        switch message.actionType
          when "refresh"
            @set 'users', message.payload

    initialize: ->
      @wireUpUserUpdate()
      @on "change reset add remove", ->
        dispatcher.dispatch
          actionType: "user-list-updated"
          users: @get 'users'

  UserList
)
