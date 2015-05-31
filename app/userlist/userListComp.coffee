react =      require 'React'
dispatcher = require './userListDispatcher'
store =      require './userListStore'
config =     require '../config'

PresenceComp = require '../presence/presenceComp'

module.exports = react.createClass
  displayName: 'UserList'

  userListItem: {}

  getInitialState: ->
    { users: new store }

  render: ->
    <userlist className={@props.className}>
      Users:
      { @props.users.map (user)=>
        data = user.get 'data'
        <div style={@userListItem} data-id={user.get 'id'} data-contact={data.email}><PresenceComp active={data.active} /> {data.name}</div>
      }
    </userlist>
