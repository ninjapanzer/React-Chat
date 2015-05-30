react =      require 'React'
dispatcher = require './chatDispatcher'
config =     require '../config'

UserListComp =       require '../userlist/userListComp'
UserListCollection = require '../userlist/UserListCollection'

ChannelComp = require '../messages/channelComp'

module.exports = react.createClass
  displayName: 'Chat'

  userListItem: {}

  componentDidMount: ->
    coll = new UserListCollection

  render: ->
    <div>
      <UserListComp />
      <ChannelComp />
    </div>
