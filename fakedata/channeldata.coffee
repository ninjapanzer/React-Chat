users = require('./userlistdata').users

usersForTwo = users.slice(1)

module.exports =
  channels:[
    {
      id: 'one'
      name: 'Channel 1'
      users: users
    }
    {
      id: 'two'
      name: 'Channel 2'
      users: usersForTwo
    }
  ]