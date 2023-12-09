require 'sinatra'
require 'json'
require 'typhoeus'

WEBHOOK_URL = 'localhost:3000/webhooks/transactions'.freeze

# Paypool endpoint to process JSON POST request
post '/paypool' do
  content_type :json
  request.body.rewind
  data = JSON.parse(request.body.read)
  data['status'] = 'paid'
  request = respond_webhook(data)
  puts request.body
  "response_code: #{request.response_code}"
end

# Strike endpoint to process JSON POST request
post '/strike' do
  content_type :json
  request.body.rewind
  data = JSON.parse(request.body.read)
  data['status'] = 'paid'
  request = respond_webhook(data)
  puts request.body
  "response_code: #{request.response_code}"
end

def respond_webhook(payload)
  options = {
    method: :post,
    headers: { 'Content-Type' => 'application/json' },
    body: payload.to_json
  }
  request = Typhoeus::Request.new(WEBHOOK_URL, options)
  request.run
end
