# - Meteor.method definitionsMeteor.startup ->

easyXML = Meteor.require('easyxml');

easyXML.configure
  singularizeChildren: false
  rootElement: 'Response'


Meteor.methods
  clearPlaylist: ->
    return Playlist.remove({})
  sendSms: ->
    twilio.sendSms(
      to: "+447738920394"
      from: "+44 1603 340396"
      body: "Heya from Twidio!"
    )
  handleTwilioRequest: (response, params) ->
    console.log "Handling Twilio request with params..."
    console.log params
    searchTerm = params.Body
    json =
      Message:
        Body: "Received music request for your search " + searchTerm
    response.writeHead(200, {'Content-Type': 'text/xml'})
    response.end(easyXML.render json)
