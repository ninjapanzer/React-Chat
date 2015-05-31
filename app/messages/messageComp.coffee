react =        require 'React'
MessageStore = require './messageStore'
dispatcher =   require './messageDispatcher'
config =       require '../config'

module.exports = react.createClass
  displayName: 'Message'

  messageStyles:
    display: 'block'
    padding: '0.2em'

  userListItem: {}

  getInitialState: ->
    {messages: new MessageStore}

  componentDidMount: ->

  render: ->
    component = this
    <messages>
      { @props.messages.map (message)->
        <message style={component.messageStyles}><div> {message.get 'user'}:{new Date(message.get 'time').toUTCString()} </div><div> {message.get 'messageText'}</div></message>
      }
    </messages>
