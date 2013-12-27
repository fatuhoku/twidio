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


# Initialise the playlist with something
if Playlist.find().count() == 0
  Playlist.insert @track1
  Playlist.insert @track2
