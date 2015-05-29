react =      require 'React'
dispatcher = require './userListDispatcher'
config =     require '../config'

module.exports = react.createClass

  userListItem: {}

  getInitialState: ->
    dispatcher.register (payload)=>
      switch payload.actionType
        when "user-list-updated"
          @setState({ users: payload.users })
    { users: [] }

  render: ->
    <div>
      { _.map @state.users, (user)=>
        <div style={@userListItem} dataId={user.id} dataContact={user.data.email}>{user.data.name}</div>
      }
    </div>
