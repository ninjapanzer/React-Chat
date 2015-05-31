users = require('./userlistdata').users

usersForTwo = users.slice(1)

module.exports =
  channels:[
    {
      id: 'one', data:
        name: 'one'
        users: users
    }
    {
    id: 'two', data:
      name: 'two'
      users: usersForTwo
    }
  ]