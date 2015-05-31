react =      require 'React'
dispatcher = require './chatDispatcher'
config =     require '../config'

ChatStore = require './chatStore'

UserListComp =  require '../userlist/userListComp'

ChannelComp = require '../messages/channelComp'

module.exports = react.createClass
  displayName: 'Chat'

  getInitialState: ->
    dispatcher.register (payload)=>
      switch payload.actionType
        when "chat-updated"
          @setState({ channels: payload.channels, users: payload.users })
    {channels: [], users: []}


  componentDidMount: ->
    @chatStore = new ChatStore

  render: ->
    <div>
      <UserListComp users={@state.users} />
      <ChannelComp channels={@state.channels} />
    </div>
