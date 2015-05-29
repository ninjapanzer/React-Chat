react =      require 'React'
dispatcher = require './userListDispatcher'
config =     require '../config'

module.exports = react.createClass
  getInitialState: ->
    dispatcher.register (payload)=>
      switch payload.actionType
        when "user-list-updated"
          @setState({ users: payload.users })
    return {name: 'butt'}

  componentWillMount: ->

  componentDidMount: ->

  render: ->
    <div>
      {@state.name}
    </div>
