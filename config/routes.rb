Rails.application.routes.draw do
  get 'notification/create'
  root 'notification#index'
  post 'notification' => 'notification#create'
  post 'auth/steam/callback' => 'notification#auth_callback'
end
