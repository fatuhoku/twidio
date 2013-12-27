console.log "Loading data.coffee"

@Playlist = new Meteor.Collection2 "playlist",
  schema:
    name:
      type: String,
      label: "Track Name"
    uri:
      type: String,
      label: "Spotify Track URI"
    timestamp:
      type: String,
      label: "Timestamp of when this track was enqueued"

Playlist = @Playlist

@track1 =
  name: "Get Lucky"
  uri: "https://embed.spotify.com/?uri=spotify:track:2Foc5Q5nqNiosCNqttzHof"
  timestamp: "1"

@track2 =
  name: "Elevation of Love"
  uri: "https://embed.spotify.com/?uri=spotify:track:6nJW8I0uhwDyNIPkIhXvPk"
  timestamp: "2"

# Initialise the playlist with something
if Playlist.find().count() == 0
  Playlist.insert @track1
  Playlist.insert @track2
