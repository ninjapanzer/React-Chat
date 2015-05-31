react =      require 'React'
dispatcher = require './messageDispatcher'
config =     require '../config'

MessageComp = require '../messages/messageComp'

UserListComp =  require '../userlist/userListComp'
UserListStore = require '../userlist/userListStore'

module.exports = react.createClass
  displayName: 'Channel'

  userListItem: {}

  getInitialState:->
    {channels: []}

  componentDidMount: ->

  render: ->
    debugger
    <div>
      { _.map @props.channels, (channel)->
        <div data-id={channel.id}>
          <div>Channel: {channel.data.name}</div>
          <UserListComp users={channel.data.users} />
          <MessageComp />
        </div>
      }
    </div>
