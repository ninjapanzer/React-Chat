define([
  'Backbone'
  './userListDispatcher'
  '../../fakedata/userlistdata'
  '../config'
  '../../lib/fayeClient'
],
(
  backbone
  dispatcher
  fakedata
  Config
  Client
)->
  UserList = Backbone.Model.extend

    client: Client.client

    defaults:
      users: []

    initialize: ->
      @client.subscribe '/userlist', (message)=>
        switch message.actionType
          when "update"
            console.log 'noop'
          when "add"
            console.log 'noop'
          when "remove"
            console.log 'noop'
          when "refresh"
            @set 'users', message.payload
      userList = fakedata
      @on "change reset add remove", ->
        dispatcher.dispatch
          actionType: "user-list-updated"
          users: @get 'users'
      @set 'users', userList.users

  UserList
)
