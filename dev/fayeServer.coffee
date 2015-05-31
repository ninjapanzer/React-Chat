http = require('http')
faye = require('faye')
server = http.createServer()
bayeux = new (faye.NodeAdapter)(
  mount: '/faye'
  timeout: 45)
bayeux.attach server
server.listen 8000
