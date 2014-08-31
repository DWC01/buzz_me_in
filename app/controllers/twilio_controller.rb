require 'twilio-ruby'
class TwilioController < ApplicationController
include Webhookable
after_filter :set_header
skip_before_action :verify_authenticity_token
	  
  def voice
    response = Twilio::TwiML::Response.new do |r|
      #r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
	  #r.Play 'http://linode.rabasa.com/cantina.mp3'
	  r.Say 'Hey There Andrew, I am calling you now. ', :voice => 'alice'
  	   r.Dial :callerId => '+14404274157' do |d|
    	 d.Client 'Buzz Me In'
  		end
	end
   
   render_twiml response
  end
 
	
end
