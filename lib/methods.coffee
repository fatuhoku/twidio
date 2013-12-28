# - Meteor.method definitionsMeteor.startup ->

easyXML = Meteor.require 'easyxml'
_ = Meteor.require 'underscore'

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
    searchTerm = params.Body.replace(/\+/g,' ');
    console.log "The search term is " + searchTerm
    queryUrl = "http://ws.spotify.com/search/1/track.json"
    res = Meteor.http.get queryUrl,
      params:
        q: encodeURIComponent searchTerm

    if res.error
      console.log res
      throw res.error

    # Success
    # If there are no results send error text response.
    # If there is exactly one result then send exact text response, supplying exact track name
    # If there are more than one result send option response, prompting correction if needed
    console.log "Got a response from Spotify for the search term..."
    console.log res.statusCode, res.data

    console.log "Taking the first track in the result set"
    if res.data.info.num_results == 0
      track = undefined
      responseJson =
        Message:
          Body: "I'm sorry, I couldn't find any tracks for '#{searchTerm}'. Try fewer words?"
    else if res.data.info.num_results == 1
      track = res.data.tracks[0]
      responseJson =
        Message:
          Body: "Great, I've enqueued '#{track.name}' for you."
    else
      n = 5
      firstNOptions = _.take (_.tail res.data.tracks), n
      nRange = _.range 1, n+1
      trackNames = _.map firstNOptions, (track) -> track.name
      # Generate a list
      alternatives = for i, trackName of _.object nRange, trackNames
        "#{i}. #{trackName}"
      track = res.data.tracks[0]
      responseJson =
        Message:
          Body: "Nice. I've enqueued '#{track.name}'. Select from these alternatives if I've got it wrong: \n#{alternatives.join("\n")}"

    response.writeHead(200, {'Content-Type': 'text/xml'})
    response.end(easyXML.render responseJson)
