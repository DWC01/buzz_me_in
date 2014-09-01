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
	     r.Gather :action => 'initial_menu_response', :method => 'POST' do |g|
	       g.Say 'Hey There. Press one to enter the password for entry. Press Two to
	       call the homeowner.', :voice => 'alice'
	      end

	end
   
    render_twiml twiml

  end

  def initial_menu_response
  	  @digits = params['Digits']
  	  if @digits == "1"
  	    twiml = Twilio::TwiML::Response.new do |r|
	      r.Gather :action => 'password_validation', :method => 'POST' do |g|
	       g.Say " Please enter your password."
	      end
	  else 
	   r.Dial :callerId => CALLER_ID do |d|  	
     	  d.Number (CGI::escapeHTML '+14404274157') 
  	 	 end
	  end  
    render_twiml twiml
  end

  def password_validation
   @digits = params['Digits']
  	 if @digits == "1234"
  	   twiml = Twilio::TwiML::Response.new do |r|
	    r.Say "Please Come In BUZZZZZZ"
  	   end
  	 end  	
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
