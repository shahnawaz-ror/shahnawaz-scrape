App.activity = App.cable.subscriptions.create "ActivityChannel",
  connected: ->
    console.log('hhhhhh')
    # Called when the subscription is ready for use on the server

  disconnected: ->
    console.log('dis connect')
    # Called when the subscription has been terminated by the server

  received: (event) ->
    sweetAlert(event);