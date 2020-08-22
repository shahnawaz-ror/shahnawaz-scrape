App.conversation = App.cable.subscriptions.create("ActivityChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    swal("Congratulations new CSV parsed!!!", data["message"])

    // alert(data["message"]);
  },
  speak: function(message) {
    // return this.perform('speak', {
    //   message: message
    // });
    // alert(data["message"]);
  }
});
