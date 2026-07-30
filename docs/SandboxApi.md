# Repull::SandboxApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**reset_sandbox**](SandboxApi.md#reset_sandbox) | **POST** /v1/sandbox/reset | Reset sandbox fixtures |
| [**seed_sandbox**](SandboxApi.md#seed_sandbox) | **POST** /v1/sandbox/seed | Seed sandbox fixtures |


## reset_sandbox

> <SandboxResetResult> reset_sandbox

Reset sandbox fixtures

Clear the authenticated test customer's sandbox fixtures. **Requires a test key (`sk_test_*`)** — live or legacy keys are rejected with 403.  Deletes ONLY the customer's rows in the isolated sandbox data space — it can never touch real inventory (`listings`, `reservations`, connections). Idempotent: resetting an empty sandbox returns zero counts (still 200). Returns per-resource deletion counts.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::SandboxApi.new

begin
  # Reset sandbox fixtures
  result = api_instance.reset_sandbox
  p result
rescue Repull::ApiError => e
  puts "Error when calling SandboxApi->reset_sandbox: #{e}"
end
```

#### Using the reset_sandbox_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SandboxResetResult>, Integer, Hash)> reset_sandbox_with_http_info

```ruby
begin
  # Reset sandbox fixtures
  data, status_code, headers = api_instance.reset_sandbox_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SandboxResetResult>
rescue Repull::ApiError => e
  puts "Error when calling SandboxApi->reset_sandbox_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**SandboxResetResult**](SandboxResetResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## seed_sandbox

> <SandboxSeedResult> seed_sandbox

Seed sandbox fixtures

Provision a deterministic set of test fixtures for contract testing WITHOUT live provider accounts. **Requires a test key (`sk_test_*`)** — live or legacy keys are rejected with 403.  Seeds, scoped to the authenticated test customer: 3 sample listings, 5 reservations across the lifecycle (created / modified / cancelled / date-changed / pending), and 2 fake connected provider accounts (Airbnb + Booking.com) so the pairing + connection-status flows are testable without real OAuth.  Idempotent — re-seeding upserts the same rows and returns the same ids. The seeded rows are visible ONLY under a test key, via the normal read endpoints (`GET /v1/listings`, `/v1/reservations`, `/v1/connect`, `/v1/channels/airbnb/listings`, `/v1/channels/airbnb/connection`). They live in a data space fully isolated from live inventory.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::SandboxApi.new

begin
  # Seed sandbox fixtures
  result = api_instance.seed_sandbox
  p result
rescue Repull::ApiError => e
  puts "Error when calling SandboxApi->seed_sandbox: #{e}"
end
```

#### Using the seed_sandbox_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SandboxSeedResult>, Integer, Hash)> seed_sandbox_with_http_info

```ruby
begin
  # Seed sandbox fixtures
  data, status_code, headers = api_instance.seed_sandbox_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SandboxSeedResult>
rescue Repull::ApiError => e
  puts "Error when calling SandboxApi->seed_sandbox_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**SandboxSeedResult**](SandboxSeedResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

