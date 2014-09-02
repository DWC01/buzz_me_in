Rails.application.routes.draw do
  
  root to: 'visitors#index'

  resources :users, :apt_buzzers

  # Basic Site Navigation
  match '/sign_up',       to: 'users#new',    		via: 'get'
  match '/my_profile',    to: 'users#show',			via: 'get'
  match '/settings',      to: 'users#edit',			via: 'get'
  match '/sign_in',       to: 'sessions#new',		via: 'get'
  match '/sign_out',      to: 'sessions#destroy',   via: 'get'

  # Twilio Number - Controller/Actions 
  post 'twilio/voice'    			   => 'twilio#voice'
  post 'twilio/message'  			   => 'twilio#message'
  post 'twilio/initial_menu_response'  => 'twilio#initial_menu_response'
  post 'twilio/password_validation'    => 'twilio#password_validation'

  
end
