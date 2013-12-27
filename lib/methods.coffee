# - Meteor.method definitionsMeteor.startup ->
Meteor.methods
  clearPlaylist: ->
    return Playlist.remove({})
  sendSms: ->
    twilio.sendSms(
      to: "+447738920394"
      from: "+44 1603 340396"
      body: "Heya from Twidio!"
    )
