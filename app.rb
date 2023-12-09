# frozen_string_literal: true

require 'sinatra'
require 'json'
require 'active_job'
require_relative 'jobs/webhook_job'

PAYPOOL_WEBHOOK_URL = 'http://localhost:3000/webhooks/paypool'
STRIKE_WEBHOOK_URL = 'http://localhost:3000/webhooks/strike'

# Paypool endpoint to process JSON POST request
post '/paypool' do
  content_type :json
  request.body.rewind
  data = JSON.parse(request.body.read)
  data['status'] = 'paid'
  WebhookJob.perform_later(data, PAYPOOL_WEBHOOK_URL)
  'OK'
end

# Strike endpoint to process JSON POST request
post '/strike' do
  content_type :json
  request.body.rewind
  data = JSON.parse(request.body.read)
  data['status'] = 'paid'
  WebhookJob.perform_later(data, STRIKE_WEBHOOK_URL)
  'OK'
end
