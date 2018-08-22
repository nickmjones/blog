class LinkNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "link_notifications_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
