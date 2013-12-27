Playlist = @Playlist

@track1 =
  name: "Get Lucky"
  uri: "https://embed.spotify.com/?uri=spotify:track:2Foc5Q5nqNiosCNqttzHof"
  timestamp: "1"

@track2 =
  name: "Elevation of Love"
  uri: "https://embed.spotify.com/?uri=spotify:track:6nJW8I0uhwDyNIPkIhXvPk"
  timestamp: "2"


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
