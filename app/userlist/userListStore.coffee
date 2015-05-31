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
  User = Backbone.Model.extend

    client: Client.client

    defaults:
      id: ''
      data: {name: '', email: '', active: false}

    initialize: ->
      @client.subscribe '/userlist', (message)=>
        switch message.actionType
          when "refresh"
            @set 'users', message.payload
      @on "change reset add remove", ->
        dispatcher.dispatch
          actionType: "user-list-updated"
          users: @get 'users'

  UserList = Backbone.Collection.extend
    model: User

  UserList
)
