require 'sinatra'
require 'json'
require 'typhoeus'

# Paypool endpoint to process JSON POST request
post '/paypool' do
  content_type :json
  request.body.rewind
  data = JSON.parse(request.body.read)
  data['status'] = 'paid'
  "response: #{data.to_json}"
end

# Strike endpoint to process JSON POST request
post '/strike' do
  content_type :json
  request.body.rewind
  data = JSON.parse(request.body.read)
  data['status'] = 'paid'
  "response: #{data.to_json}"
end
