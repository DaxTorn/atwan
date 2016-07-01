Rails.application.routes.draw do
  root 'notification#index'
  get 'sign-out' => 'user#logout'
  post 'notification' => 'notification#create'
  post 'auth/steam/callback' => 'user#auth_callback'
end
