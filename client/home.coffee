@track1 =
  name: "Get Lucky"
  artist: "Daft Punk"
  uri: "https://embed.spotify.com/?uri=spotify:track:2Foc5Q5nqNiosCNqttzHof"

@track2 =
  name: "Elevation of Love"
  artist: "ESB"
  uri: "https://embed.spotify.com/?uri=spotify:track:6nJW8I0uhwDyNIPkIhXvPk"

Session.set 'track', track1

Template.home.track = ->
  Session.get 'track'

Template.toggle_button.events
  'click input[type=submit]': ->
    Session.set 'track', track2
