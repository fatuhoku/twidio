console.log "Loading main.coffee"

Playlist = @Playlist

Meteor.startup ->
  return Meteor.methods
    clearPlaylist: ->
      return Playlist.remove({})