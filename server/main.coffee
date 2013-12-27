console.log "Loading main.coffee"

Playlist = @Playlist
twilio = Twilio("ACb77fa5e53a8aedecd2d8d4dce7569386", "cee8c2aa491b62c89138c4761b0ecc31");


Meteor.startup ->
  return Meteor.methods
    clearPlaylist: ->
      return Playlist.remove({})
    sendSms: ->
      twilio.sendSms(
        to: "+447738920394"
        from: "+44 1603 340396"
        body: "Heya from Twidio!"
      )
