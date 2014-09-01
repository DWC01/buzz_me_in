Rails.application.routes.draw do
  resources :users, :buzz_me_apps 
  
  post 'twilio/voice'    			 => 'twilio#voice'
  #post 'twilio/message'  			 => 'twilio#message'
  get 'twilio/first_user_response'  => 'twilio#first_user_response'

  root to: 'visitors#index'
end
