react =      require 'React'
dispatcher = require './messageDispatcher'
config =     require '../config'
store =      require './channelStore'

MessageComp = require '../messages/messageComp'

UserListComp =  require '../userlist/userListComp'
UserListStore = require '../userlist/userListStore'

module.exports = react.createClass
  displayName: 'Channel'

  getInitialState:->
    {channels: new store}

  componentDidMount: ->

  render: ->
    <div>
      { @props.channels.map (channel)->
        data = channel.get 'data'
        <div data-id={channel.get 'id'}>
          <div>Channel: {data.name}</div>
          <UserListComp users={new UserListStore(data.users)} />
          <MessageComp />
        </div>
      }
    </div>
