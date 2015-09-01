require 'twilio-ruby'
 
class TwilioController < ApplicationController
  include Webhookable
 
  after_filter :set_header
 
  skip_before_action :verify_authenticity_token
 
  # def voice
  # 	response = Twilio::TwiML::Response.new do |r|
  # 	  r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
  #       r.Play 'http://linode.rabasa.com/cantina.mp3'
  # 	end
 
  # 	render_twiml response
  # end
  
  def message
    message_body = params[:Body]
  	response = Twilio::TwiML::Response.new do |r|
  	  r.Message "You said #{message_body}!"
  	end
 
  	render_twiml response
  end
  
end