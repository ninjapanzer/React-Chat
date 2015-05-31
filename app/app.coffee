react = require 'React'
jQuery = require 'jQuery'
Client = require '../lib/fayeClient'

jQuery(document).on "faye:off", (event) ->
  console.log "faye offline"

jQuery(document).on "faye:on", (event) ->
  console.log "faye online"

#Only for Dev
window.client = require '../lib/fayeClient'
css = require './assets/stylesheets/main.scss'

HeaderComp = require './layout/header'

ChatComp = require './chat/chatComp'

react.render(
  <HeaderComp/>,
  jQuery('header')[0]
)

react.render(
  <ChatComp/>,
  jQuery('chat')[0]
)
