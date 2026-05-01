#!/usr/bin/env ruby
# frozen_string_literal: true

# Connect a customer to Airbnb via Repull's hosted OAuth flow.
#
# Flow:
#   1. POST /v1/connect/airbnb with redirectUrl + accessType — Repull mints a
#      hosted OAuth session and returns a Connection record (and, server-side,
#      logs an oauth_url to send the user to).
#   2. The user completes consent at connect.repull.dev and lands on redirectUrl.
#   3. Poll GET /v1/connect/airbnb to see the linked account.
#
# Usage: REPULL_API_KEY=sk_test_... bundle exec ruby examples/connect_airbnb.rb

require 'repull'

config = Repull::Configuration.new
config.access_token = ENV.fetch('REPULL_API_KEY')
config.host = 'api.repull.dev'

api = Repull::ConnectApi.new(Repull::ApiClient.new(config))

req = Repull::V1ConnectProviderPostRequest.new(
  redirect_url: 'https://example.com/airbnb/return',
  access_type: 'full_access'
)

connection = api.v1_connect_provider_post('airbnb', v1_connect_provider_post_request: req)
puts "connection id=#{connection.id} status=#{connection.status}"
puts "host: #{connection.host&.to_hash}" if connection.host

status = api.v1_connect_provider_get('airbnb')
puts "current airbnb status: #{status.to_hash}"
