react =      require 'React'
dispatcher = require './messageDispatcher'
config =     require '../config'
store =      require './channelStore'

MessageComp = require '../messages/messageComp'

UserListComp =  require '../userlist/userListComp'
UserListStore = require '../userlist/userListStore'

module.exports = react.createClass
  displayName: 'Channel'
  containerClass: 'channels--container'
  channelClass: 'channel'

  getInitialState:->
    {channels: new store}

  componentDidMount: ->

  toggleChannelVisibity: (event)->
    $(event.target.parentElement.parentElement.getElementsByTagName('userlist')).toggleClass('is-shown')

  render: ->
    component = this
    <channels className={component.containerClass}>
      { @props.channels.map (channel)->
        data = channel.get 'data'
        <channel className={component.channelClass}  data-id={channel.get 'id'}>
          <div onClick={component.toggleChannelVisibity}>Channel: {data.name}</div>
          <UserListComp users={new UserListStore(data.users)} />
          <MessageComp />
        </channel>
      }
    </channels>
