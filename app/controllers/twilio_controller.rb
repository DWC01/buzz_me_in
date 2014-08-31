require 'twilio-ruby'
class TwilioController < ApplicationController
include Webhookable
after_filter :set_header
skip_before_action :verify_authenticity_token
	  
  def voice
    twiml = Twilio::TwiML::Response.new do |r|
	  r.Say 'Hey There Andrew, I am calling you now. ', :voice => 'alice'
  	     r.Dial :callerId => '+19256399635' do |d|  	
    	  d.Number (CGI::escapeHTML '+14404274157') 
    	  d.Say 'Hey There Andrew, Whats Up dog!?. ', :voice => 'alice'
  		 end
  		 r.Sms  "Here is the code to get in! Shhhh! -> 896"
	end
   
   render_twiml twiml

  end

  def message
    

  end
 
	
end
