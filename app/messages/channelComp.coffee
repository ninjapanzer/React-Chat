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
    $(event.target.parentElement.parentElement.parentElement.getElementsByTagName('channel')).removeClass('is-shown')
    $("##{event.target.parentElement.dataset.id}").toggleClass('is-shown')

  render: ->
    component = this
    <channels className={component.containerClass}>
      <ul>
        { @props.channels.map (channel)->
          data = channel.get 'data'
          <li data-id={channel.get 'id'} onClick={component.toggleChannelVisibity}>Channel: {data.name}</li>
        }
      </ul>
      { @props.channels.map (channel)->
        data = channel.get 'data'
        <channel id={channel.get 'id'} className={component.channelClass} data-id={channel.get 'id'}>
          <UserListComp users={new UserListStore(data.users)} />
          <MessageComp />
        </channel>
      }
    </channels>
