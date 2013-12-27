Session.set( 'somebody' , 'World' );

Template.hello.somebody = ->
  Session.get('somebody')

Template.form.events
  'click input[type=submit]': ->
    Session.set 'somebody' , $('#newName').val()
