define([
  'Backbone'
  './userListDispatcher'
  '../config'
  '../../lib/fayeClient'
],
(
  Backbone
  dispatcher
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
          when "refresh"
            @set 'users', message.payload
      @on "change reset add remove", ->
        dispatcher.dispatch
          actionType: "user-list-updated"
          users: @get 'users'

  UserList
)
