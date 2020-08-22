class EventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(event)
    ActionCable.server.broadcast 'activity_channel', message: "Your csv is sent to the below users #{event.users}"
  end
end
