class LinkBroadcastJob < ApplicationJob  
  queue_as :default  

  def perform(link)  
    ActionCable.server.broadcast 'link_channel', item: render(link)  
  end  

  private   
    def render(link)  
      ApplicationController.renderer.render(partial: 'links/link', locals: {link: link})  
    end  
end