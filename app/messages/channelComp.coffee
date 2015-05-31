react =      require 'React'
dispatcher = require './messageDispatcher'
config =     require '../config'
store =      require './channelStore'

MessageComp =  require '../messages/messageComp'
MessageStore = require '../messages/messageStore'

UserListComp =  require '../userlist/userListComp'
UserListStore = require '../userlist/userListStore'

module.exports = react.createClass
  displayName: 'Channel'
  containerClass: 'channels--container'
  channelClass: 'channel'
  channelListClass: 'channel-list'

  getInitialState:->
    {channels: new store}

  componentDidUpdate: ->
    $(".#{@channelListClass} li").first().trigger('click')

  handleSendClick: (event)->
    event.preventDefault()
    event.stopPropagation()
    channelId = $(event.target.parentElement).attr('id')
    channelMessages = @props.channels.where(id: channelId)[0].get('messages')
    channelMessages.add
      messageText: @refs["messageInput#{channelId}"].getDOMNode().value
      user: 'dummy_user'
      time: new Date().getTime()
    @refs["messageInput#{channelId}"].getDOMNode().value = ''

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
            <li data-id={channel.get 'id'} onClick={component.toggleChannelVisibity}>{channel.get 'name'}</li>
          }
        </ul>
      </div>
      { @props.channels.map (channel)->
        <channel id={channel.get 'id'} className={component.channelClass} data-id={channel.get 'id'}>
          <MessageComp messages={channel.get 'messages'} />
          <UserListComp users={channel.get 'users'} />
          <form onSubmit={component.handleSendClick}>
            <input ref={"messageInput#{channel.get 'id'}"} type='text' placeholder='Say Something'/>
            <input type='submit' value='Send'/>
          </form>
        </channel>
      }
    </channels>
