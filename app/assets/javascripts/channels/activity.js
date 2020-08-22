App.conversation = App.cable.subscriptions.create("ActivityChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    sweetAlert(data);
  },
  speak: function(message) {
    // return this.perform('speak', {
    //   message: message
    // });
    sweetAlert(message);
  }
});
