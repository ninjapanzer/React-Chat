react =      require 'React'
dispatcher = require './chatDispatcher'
config =     require '../config'

ChatStore = require './chatStore'

UserListComp =  require '../userlist/userListComp'
UserListStore = require '../userlist/userListStore'

ChannelComp =  require '../messages/channelComp'
ChannelStore = require '../messages/channelStore'

module.exports = react.createClass
  displayName: 'Chat'
  containerClass: 'chat--container'
  userlistClass: 'main-users'

  getInitialState: ->
    dispatcher.register (payload)=>
      switch payload.actionType
        when "chat-updated"
          @setState({ channels: payload.channels, users: payload.users })
        when "message-sent"
          @forceUpdate()
    {channels: new UserListStore , users: new ChannelStore}


  componentDidMount: ->
    @chatStore = new ChatStore

  render: ->
    component = this
    <div className={component.containerClass}>
      <ChannelComp channels={@state.channels} />
      <UserListComp className={component.userlistClass} users={@state.users} />
    </div>
