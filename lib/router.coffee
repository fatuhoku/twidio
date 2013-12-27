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
  @route 'enqueue',
    where: 'server',
    action: ->
      console.log "Received request with params: "+ this.params
      @response.writeHead(200, {'Content-Type': 'text/html'})
      @response.end "Hello from the server."


