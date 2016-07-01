Rails.application.routes.draw do
  root 'notification#index'
  post 'sign-in' => 'user#login'
  get 'sign-out' => 'user#logout'
  get 'sign-up' => 'user#new'
  post 'sign-up' => 'user#create'
  post 'notification' => 'notification#create'
  post 'auth/steam/callback' => 'user#auth_callback'
end
