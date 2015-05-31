react =      require 'React'
dispatcher = require './messageDispatcher'
config =     require '../config'

module.exports = react.createClass
  displayName: 'Message'

  userListItem: {}

  componentDidMount: ->

  render: ->
    <messages>
      <message><span>BY User</span><span>HI</span></message>
    </messages>
