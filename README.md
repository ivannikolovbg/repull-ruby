# Repull Ruby SDK

> **Status:** v0.1.0 — alpha. RubyGems listing pending.

Ruby SDK for [Repull](https://repull.dev) — the unified API for vacation-rental tech (50+ PMS platforms, Airbnb / Booking.com / VRBO / Plumguide channels, AI ops, white-label OAuth Connect). Generated from [api.repull.dev/openapi.json](https://api.repull.dev/openapi.json).

## Install

```bash
# Once published to RubyGems:
gem install repull
```

> **Not yet on RubyGems.** Until then, use the gem directly from this repo:
>
> ```ruby
> # Gemfile
> gem 'repull', git: 'https://github.com/ivannikolovbg/repull-ruby', branch: 'main'
> ```
>
> Or build locally:
>
> ```bash
> git clone https://github.com/ivannikolovbg/repull-ruby
> cd repull-ruby
> bundle install
> gem build repull.gemspec
> gem install ./repull-0.1.0.gem
> ```

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

All requests use a Bearer token. Get an API key from [repull.dev/dashboard](https://repull.dev/dashboard). Sandbox keys start with `sk_test_`, production keys with `sk_live_`.

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
export REPULL_API_KEY=sk_test_...
bundle exec ruby examples/quickstart.rb
```

## What's in the box

The SDK is generated from the OpenAPI spec snapshotted at [`openapi/v1.json`](./openapi/v1.json). It exposes one API class per tag:

- `Repull::AIApi`
- `Repull::AirbnbApi`
- `Repull::AvailabilityApi`
- `Repull::BillingApi`
- `Repull::BookingComApi`
- `Repull::ConnectApi`
- `Repull::ConversationsApi`
- `Repull::GuestsApi`
- `Repull::PlumguideApi`
- `Repull::PropertiesApi`
- `Repull::ReservationsApi`
- `Repull::SystemApi`
- `Repull::VRBOApi`
- `Repull::WebhooksApi`

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

v0.1.0 — alpha. API surface may shift before v1.0. RubyGems listing pending. File issues at [github.com/ivannikolovbg/repull-ruby/issues](https://github.com/ivannikolovbg/repull-ruby/issues).

---

Powered by [Repull](https://repull.dev). AI features powered by [Vanio AI](https://vanio.ai).
