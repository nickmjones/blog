class LinkChannel < ApplicationCable::Channel
  def subscribed
    stream_from "link_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
