#!/usr/bin/env ruby
# frozen_string_literal: true

# Quickstart: health check + list 10 reservations from api.repull.dev.
# Usage: REPULL_API_KEY=sk_test_... bundle exec ruby examples/quickstart.rb

require 'repull'

config = Repull::Configuration.new
config.access_token = ENV.fetch('REPULL_API_KEY')
config.host = 'api.repull.dev'

client = Repull::ApiClient.new(config)

health = Repull::SystemApi.new(client).v1_health_get
puts "health: #{health.status}"

result = Repull::ReservationsApi.new(client).v1_reservations_get(limit: 10)
puts "reservations: #{result.data.size} (total #{result.pagination&.total})"
result.data.each do |r|
  puts "  #{r.id}\t#{r.check_in} -> #{r.check_out}\t#{r.platform}"
end
