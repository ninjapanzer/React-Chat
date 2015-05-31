react =      require 'React'
dispatcher = require './chatDispatcher'
config =     require '../config'

UserListComp =  require '../userlist/userListComp'
UserListStore = require '../userlist/UserListStore'

ChannelComp = require '../messages/channelComp'

module.exports = react.createClass
  displayName: 'Chat'

  userListItem: {}

  componentDidMount: ->
    coll = new UserListStore

  render: ->
    <div>
      <UserListComp />
      <ChannelComp />
    </div>
