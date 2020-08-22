App.conversation = App.cable.subscriptions.create("ActivityChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    swal("CSV parsed status!!!", data["message"])

    // alert(data["message"]);
  },
  speak: function(message) {
    // return this.perform('speak', {
    //   message: message
    // });
    // alert(data["message"]);
  }
});
