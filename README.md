# Repull Ruby SDK

Ruby SDK for [Repull](https://repull.dev) — one API for vacation-rental tech: Airbnb, Booking.com, Vrbo and more channels, plus 15 PMS platforms, behind one key, with white-label Connect for linking your users' accounts. Generated from [api.repull.dev/openapi.json](https://api.repull.dev/openapi.json).

## Install

```bash
gem install repull
```

Or in your Gemfile:

```ruby
gem 'repull'
```

## Quick start

```ruby
require 'repull'

config = Repull::Configuration.new
config.access_token = ENV['REPULL_API_KEY']
config.host = 'api.repull.dev'

api = Repull::ReservationsApi.new(Repull::ApiClient.new(config))
result = api.v1_reservations_get(limit: 10)

result.data.each do |r|
  puts "#{r.id}\t#{r.check_in} -> #{r.check_out}\t#{r.platform}"
end
```

See [`examples/quickstart.rb`](./examples/quickstart.rb) and [`examples/connect_airbnb.rb`](./examples/connect_airbnb.rb) for runnable scripts.

## Authentication

All requests use a Bearer token. Get an API key from [repull.dev/dashboard](https://repull.dev/dashboard). Production keys start with `sk_live_`.

```ruby
Repull.configure do |c|
  c.access_token = ENV['REPULL_API_KEY']
end
```

The SDK adds the `Authorization: Bearer ...` header automatically on every request.

## Examples

| Script | What it does |
|---|---|
| [`examples/quickstart.rb`](./examples/quickstart.rb) | Health check + list reservations. |
| [`examples/connect_airbnb.rb`](./examples/connect_airbnb.rb) | Mint an Airbnb OAuth Connect session and poll its status. |

Run them:

```bash
export REPULL_API_KEY=YOUR_API_KEY
bundle exec ruby examples/quickstart.rb
```

## What's in the box

The SDK is generated from the OpenAPI spec snapshotted at [`openapi/v1.json`](./openapi/v1.json). It exposes one API class per tag — for example `Repull::ReservationsApi`, `Repull::PropertiesApi`, `Repull::ListingsApi`, `Repull::ConversationsApi`, `Repull::ConnectApi`, `Repull::AirbnbApi`, `Repull::BookingComApi`, `Repull::VRBOApi` and `Repull::WebhooksApi`.

Per-class method docs live in [`docs/`](./docs).

## Reference

Full API reference at [repull.dev/docs](https://repull.dev/docs).

## Regenerating

The generated client tracks the live OpenAPI spec. To refresh:

```bash
./scripts/regen.sh
```

This re-snapshots `openapi/v1.json` from `https://api.repull.dev/openapi.json` and regenerates `lib/repull/`.

## License

[MIT](./LICENSE).

## Status

Published on [RubyGems](https://rubygems.org/gems/repull). File issues at [github.com/ivannikolovbg/repull-ruby/issues](https://github.com/ivannikolovbg/repull-ruby/issues).

---

Powered by [Repull](https://repull.dev).
