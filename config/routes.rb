Rails.application.routes.draw do
  root 'notification#index'
  get 'logout' => 'user#logout'
  post 'notification' => 'notification#create'
  post 'auth/steam/callback' => 'user#auth_callback'
end
