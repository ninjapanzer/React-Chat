react =      require 'React'
dispatcher = require '../userlist/userListDispatcher'
config =     require '../config'

module.exports = react.createClass
  displayName: 'Presence'

  userListItem: {}

  base:
    borderRadius: '1em'
    display: 'inline-block'
    height: '0.5em'
    width: '0.5em'
    marginRight: '0.2em'
  active:
    backgroundColor: 'green'
  inactive:
    backgroundColor: 'red'

  componentDidMount: ->

  status: ->
    if @props.active
      return _.extend {}, @base, @active
    else
      return _.extend {}, @base, @inactive

  render: ->
    <div style={@status()}></div>
