react =      require 'React'
dispatcher = require './userListDispatcher'
config =     require '../config'

PresenceComp = require '../presence/presenceComp'

module.exports = react.createClass
  displayName: 'UserList'

  userListItem: {}

  getInitialState: ->
    dispatcher.register (payload)=>
      switch payload.actionType
        when "user-list-updated"
          @setState({ users: payload.users })
    { users: [] }

  render: ->
    <userlist>
      Users:
      { _.map @state.users, (user)=>
        <div style={@userListItem} data-id={user.id} data-contact={user.data.email}><PresenceComp active={user.data.active} /> {user.data.name}</div>
      }
    </userlist>
