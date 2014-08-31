require 'twilio-ruby'
# put your own credentials here
account_sid = 'ACa15e235e82e5417d9d102c1992d4ac73'
auth_token = '87954282ec5f13818d9c019dbb614fe1'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token