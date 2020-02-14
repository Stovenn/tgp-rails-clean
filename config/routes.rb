Rails.application.routes.draw do
  # get 'user/show/:id', to: 'user#show', as:'user'
  resources :user
  resources :city
  resources :gossip do
  resources :comment, only: [:index,:create] 
  end
  resources :root
  resources :contact
  resources :team
  resources :sessions, only: [:new, :create, :destroy]
end
