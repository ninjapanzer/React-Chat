react =      require 'React'
dispatcher = require '../userlist/userListDispatcher'
config =     require '../config'

module.exports = react.createClass
  displayName: 'Presence'

  userListItem: {}

  active:
    display: 'inline'
    backgroundColor: 'green'
    height: '1em'
    width: '1em'
  inactive:
    backgroundColor: 'red'
    height: '1em'
    width: '1em'

  componentDidMount: ->

  status: ->
    if true
      return @active
    else
      return @inactive

  render: ->
    <div style={@active}></div>
