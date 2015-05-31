react =      require 'React'
dispatcher = require './userListDispatcher'
config =     require '../config'

PresenceComp = require '../presence/presenceComp'

module.exports = react.createClass
  displayName: 'UserList'

  userListItem: {}

  getInitialState: ->
    { users: [] }

  render: ->
    <userlist>
      Users:
      { _.map @props.users, (user)=>
        <div style={@userListItem} data-id={user.id} data-contact={user.data.email}><PresenceComp active={user.data.active} /> {user.data.name}</div>
      }
    </userlist>
