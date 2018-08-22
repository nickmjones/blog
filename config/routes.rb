Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts
  resources :links

  # Boxes
  get 'drafts',   to: 'posts#drafts'
  get 'sent',     to: 'posts#sent'

  # acts_as_taggable_on
  get 'tags/:tag', to: 'posts#index', as: :tag

  # ActionCable
  mount ActionCable.server, at: '/cable'
end
