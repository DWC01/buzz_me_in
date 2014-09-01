require 'twilio-ruby'
class TwilioController < ApplicationController
include Webhookable
after_filter :set_header
skip_before_action :verify_authenticity_token

 # your Twilio authentication credentials
  ACCOUNT_SID = 'ACa15e235e82e5417d9d102c1992d4ac73'
  ACCOUNT_TOKEN = '87954282ec5f13818d9c019dbb614fe1'

  # base URL of this application
  BASE_URL = "http://buzzmein.herokuapp.com/twilio"

  # Outgoing Caller ID you have previously validated with Twilio
  CALLER_ID = '+19256399635'
	  
  def voice
    twiml = Twilio::TwiML::Response.new do |r|
	  # r.Say 'Hey There Andrew, I am calling you now. ', :voice => 'alice'
  	#      r.Dial :callerId => CALLER_ID do |d|  	
   #  	  d.Number (CGI::escapeHTML '+14404274157') 
  	# 	 end
  	# 	 r.Sms :callerId => CALLER_ID do |d| 
  	# 	 	"Here is the code to get in! Shhhh! -> 896"
	     r.Gather :action => 'first_user_response', :method => 'POST' do |g|
	       g.Say 'Hey There Andrew! Presss One to enter a password to get Buzzed in', :voice => 'alice'
	      end

	end
   
    render_twiml twiml

  end

  def first_user_response
  	  @digits = params['Digits']
  	  if @digits> 5.to_s
  	    twiml = Twilio::TwiML::Response.new do |r|
	      r.Say "Your Digit is Greater than 5."
	    end
	  else 
	    twiml = Twilio::TwiML::Response.new do |r|
	    	r.Say "#{@digits} Your Digit is Less than 5."
	    end
	  end  
    render_twiml twiml
  end 	

  # def message

  #   @twilio_client = Twilio::REST::Client.new ACCOUNT_SID, ACCOUNT_TOKEN
 
  #   @twilio_client.account.sms.messages.create(
  #     :from => CALLER_ID,
  #     :to => '+14404274157',
  #     :body => "This is an message!!!"
  #   )
  #   end
    
  # end
 
	
end
