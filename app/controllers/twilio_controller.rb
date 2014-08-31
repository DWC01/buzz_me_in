require 'twilio-ruby'
class TwilioController < ApplicationController
include Webhookable
after_filter :set_header
skip_before_action :verify_authenticity_token

 def voice
  response = Twilio::TwiML::Response.new do |r|
	  r.Say 'Hello Andrew, I am calling your phone now! ', :voice => 'alice'
	  r.Dial :callerId => '+14404274157' do |d|
	    d.Client 'jenny'
	  end
	end
  # print the result
  puts response.text
  end



end
