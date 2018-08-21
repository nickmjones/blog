Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts

  # Boxes
  get 'drafts',   to: 'posts#drafts'
  get 'sent',     to: 'posts#sent'

  get 'tags/:tag', to: 'posts#index', as: :tag
end
