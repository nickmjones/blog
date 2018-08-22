class Link < ApplicationRecord
  after_create_commit { LinkBroadcastJob.perform_later self }  
  after_update_commit { LinkBroadcastJob.perform_later self }  
  after_destroy { LinkBroadcastJob.perform_later self } 
end
