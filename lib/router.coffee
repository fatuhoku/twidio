# iron-router configuration - https://github.com/EventedMind/meteor-iron-router
Subscriptions = []
# [ Meteor.subscribe('video'),
# Meteor.subscribe('music'),
# Meteor.subscribe('favorites')]


Router.configure
  layout: 'layout'
  notFoundTemplate: 'notfound'
  loadingTemplate: 'loading'
  waitOn: Subscriptions
  renderTemplates:
    'nav':
      to: 'nav'


Router.map ->
  @route 'home', path: '/'
  @route 'admin',
  @route 'twilioSms',
    where: 'server',
    path: '/twilio/sms'
    action: ->
      console.log "Received a request from Twilio with params: " + this.params
      Meteor.call "handleTwilioRequest", @response, this.params
  @route 'enqueue',
    where: 'server',
    action: ->
      console.log "Received request.. with params: "+ this.params
      @response.writeHead(200, {'Content-Type': 'text/html'})
      # Read the XML and return it.
      @response.end "Hello from the server."


