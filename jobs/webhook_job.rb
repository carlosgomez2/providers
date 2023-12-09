# frozen_string_literal: true

require 'typhoeus'
require 'byebug'
require_relative 'application_job'

# WebhookJob class to process JSON POST request
class WebhookJob < ApplicationJob
  queue_as :default

  def perform(payload, webhook_url)
    options = {
      method: :post,
      headers: { 'Content-Type' => 'application/json' },
      body: { event_data: payload }.to_json
    }
    request = Typhoeus::Request.new(webhook_url, options)
    request.run
  end
end
