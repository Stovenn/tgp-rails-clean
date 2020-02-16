Rails.application.routes.draw do
  # get 'sessions/new'
#home 
root to: 'root#index'

#users
resources :user, only: [:new, :create, :show]

#city
resources :city
  
#gossips
resources :gossip do
  resources :comment, only: [:create,:edit, :update, :destroy] 
  end

#login/logout
resources :sessions, only: [:new, :create, :destroy]

#menu
get '/team', to: 'team#index'
get '/contact', to: 'contact#index'

end
