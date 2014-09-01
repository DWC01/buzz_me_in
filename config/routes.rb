Rails.application.routes.draw do
  resources :users, :buzz_me_apps 
  
  post 'twilio/voice'    => 'twilio#voice'
  post 'twilio/message'  => 'twilio#message'

  root to: 'visitors#index'
end
