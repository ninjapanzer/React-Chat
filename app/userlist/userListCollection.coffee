define([
  'Backbone'
  './userListDispatcher'
  '../../fakedata/userlistdata'
  '../config'
],
(
  backbone
  dispatcher
  fakedata
  Config
)->
  UserList = Backbone.Model.extend

    #urlRoot: "#{Config.path}/plot_points"

    defaults:
      users: []

    initialize: ->
      userList = fakedata
      @on "change reset add remove", ->
        dispatcher.dispatch
          actionType: "user-list-updated"
          users: @get 'users'
      @set 'users', userList

  UserList
)
