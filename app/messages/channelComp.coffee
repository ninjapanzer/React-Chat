react =      require 'React'
dispatcher = require './messageDispatcher'
config =     require '../config'

MessageComp = require '../messages/messageComp'

module.exports = react.createClass
  displayName: 'Channel'

  userListItem: {}

  componentDidMount: ->

  render: ->
    <div>
      Channel 1
      <MessageComp />
    </div>
