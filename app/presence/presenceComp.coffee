react =      require 'React'
dispatcher = require '../userlist/userListDispatcher'
config =     require '../config'

module.exports = react.createClass
  displayName: 'Presence'

  userListItem: {}

  base:
    borderRadius: 200
    display: 'inline-block'
    height: '1em'
    width: '1em'
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
