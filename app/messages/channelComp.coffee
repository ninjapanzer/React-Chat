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
  channelListClass: 'channel-list'

  getInitialState:->
    {channels: new store}

  componentDidMount: ->

  toggleChannelVisibity: (event)->
    $(event.target.parentElement.parentElement.parentElement.getElementsByTagName('channel')).removeClass('is-shown')
    $("##{event.target.dataset.id}").toggleClass('is-shown')
    $(event.target.parentElement.children).removeClass('is-shown')
    $(event.target).toggleClass('is-shown')

  render: ->
    component = this
    <channels className={component.containerClass}>
      <div className={component.channelListClass}>
        Channels:
        <ul>
          { @props.channels.map (channel)->
            data = channel.get 'data'
            <li data-id={channel.get 'id'} onClick={component.toggleChannelVisibity}>{data.name}</li>
          }
        </ul>
      </div>
      { @props.channels.map (channel)->
        data = channel.get 'data'
        <channel id={channel.get 'id'} className={component.channelClass} data-id={channel.get 'id'}>
          <MessageComp />
          <UserListComp users={new UserListStore(data.users)} />
        </channel>
      }
    </channels>
