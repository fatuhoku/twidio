Playlist = @Playlist



Session.set 'track', track1

Template.home.track = ->
  Session.get 'track'

Template.playlist.tracks = ->
  return Playlist.find()

Template.buttons.events
  'click button#toggle': ->
    Session.set 'track', track2
  'click button#clear': ->
    Meteor.call 'clearPlaylist'
  'click button#search': ->
    # Switch over to the server side, I think.
  'click button#sendSms': ->
    Meteor.call 'sendSms'
