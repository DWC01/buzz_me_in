Rails.application.routes.draw do
  resources :users, :buzz_me_apps 
  
  post 'twilio/voice'    			 => 'twilio#voice'
  #post 'twilio/message'  			 => 'twilio#message'
  post 'twilio/initial_menu_response'  => 'twilio#initial_menu_response'
  #post 'twilio/password_validation'    => 'twilio#password_validation'

  root to: 'visitors#index'
end
