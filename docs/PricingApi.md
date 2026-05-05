# Repull::PricingApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**apply_listing_pricing**](PricingApi.md#apply_listing_pricing) | **POST** /v1/listings/{id}/pricing | Apply or decline pricing recommendations |
| [**bulk_apply_pricing**](PricingApi.md#bulk_apply_pricing) | **POST** /v1/listings/pricing/bulk | Bulk apply or decline pricing recommendations |
| [**get_listing_pricing**](PricingApi.md#get_listing_pricing) | **GET** /v1/listings/{id}/pricing | Get pricing recommendations |
| [**get_listing_pricing_history**](PricingApi.md#get_listing_pricing_history) | **GET** /v1/listings/{id}/pricing/history | Pricing recommendation audit trail |
| [**get_listing_pricing_strategy**](PricingApi.md#get_listing_pricing_strategy) | **GET** /v1/listings/{id}/pricing/strategy | Get pricing strategy |
| [**update_listing_pricing_strategy**](PricingApi.md#update_listing_pricing_strategy) | **PUT** /v1/listings/{id}/pricing/strategy | Update pricing strategy |


## apply_listing_pricing

> <ListingPricingApplyResponse> apply_listing_pricing(id, listing_pricing_apply_request)

Apply or decline pricing recommendations

Apply: writes the recommended price to the listing's calendar for the given dates and triggers the platform fan-out (Airbnb / Booking.com / VRBO). Decline: marks the recommendation as `declined` so it stops surfacing — the model can re-recommend on the next training cycle.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PricingApi.new
id = 56 # Integer | 
listing_pricing_apply_request = Repull::ListingPricingApplyRequest.new({dates: [Date.today], action: 'action_example'}) # ListingPricingApplyRequest | 

begin
  # Apply or decline pricing recommendations
  result = api_instance.apply_listing_pricing(id, listing_pricing_apply_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PricingApi->apply_listing_pricing: #{e}"
end
```

#### Using the apply_listing_pricing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPricingApplyResponse>, Integer, Hash)> apply_listing_pricing_with_http_info(id, listing_pricing_apply_request)

```ruby
begin
  # Apply or decline pricing recommendations
  data, status_code, headers = api_instance.apply_listing_pricing_with_http_info(id, listing_pricing_apply_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPricingApplyResponse>
rescue Repull::ApiError => e
  puts "Error when calling PricingApi->apply_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **listing_pricing_apply_request** | [**ListingPricingApplyRequest**](ListingPricingApplyRequest.md) |  |  |

### Return type

[**ListingPricingApplyResponse**](ListingPricingApplyResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## bulk_apply_pricing

> <BulkPricingResponse> bulk_apply_pricing(bulk_pricing_request)

Bulk apply or decline pricing recommendations

Apply or decline pending Atlas pricing recommendations across many listings in one call. Built for power users with hundreds of listings who would otherwise need 500 sequential single-listing POSTs.  - `items` is capped at 500 entries per request — exceeding returns 422. - Per-item failures (stale listing IDs, no pending recs, channel auth blips) DO NOT fail the whole batch — partial success is the norm at this scale and the granular `failed[]` array lets the SDK retry just the bad entries. - Tier-limit accounting: this endpoint counts as **1 API call** regardless of how many items the body contains.  Apply path writes the recommended price to each listing's calendar via the calendar service (which fans out to Airbnb/Booking/VRBO) then marks the Atlas recommendation `applied`. Decline path is Atlas-only — fast.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PricingApi.new
bulk_pricing_request = Repull::BulkPricingRequest.new({action: 'action_example', items: [Repull::BulkPricingItem.new({listing_id: '4118', dates: ["2026-05-14", "2026-05-15"]})]}) # BulkPricingRequest | 

begin
  # Bulk apply or decline pricing recommendations
  result = api_instance.bulk_apply_pricing(bulk_pricing_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PricingApi->bulk_apply_pricing: #{e}"
end
```

#### Using the bulk_apply_pricing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BulkPricingResponse>, Integer, Hash)> bulk_apply_pricing_with_http_info(bulk_pricing_request)

```ruby
begin
  # Bulk apply or decline pricing recommendations
  data, status_code, headers = api_instance.bulk_apply_pricing_with_http_info(bulk_pricing_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BulkPricingResponse>
rescue Repull::ApiError => e
  puts "Error when calling PricingApi->bulk_apply_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bulk_pricing_request** | [**BulkPricingRequest**](BulkPricingRequest.md) |  |  |

### Return type

[**BulkPricingResponse**](BulkPricingResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_listing_pricing

> <ListingPricingResponse> get_listing_pricing(id, opts)

Get pricing recommendations

Returns date-by-date pricing recommendations for a listing's upcoming calendar window, plus the listing's base-price context and a 5km comp summary. Recommendations come from the Atlas pricing model — pre-computed nightly and stored in `pricing_recommendations`. Use POST to apply or decline pending recommendations.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PricingApi.new
id = 56 # Integer | Listing ID
opts = {
  start_date: Date.parse('2013-10-20'), # Date | Inclusive start of the calendar window. Defaults to today.
  end_date: Date.parse('2013-10-20') # Date | Inclusive end of the calendar window. Defaults to today + 90 days.
}

begin
  # Get pricing recommendations
  result = api_instance.get_listing_pricing(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PricingApi->get_listing_pricing: #{e}"
end
```

#### Using the get_listing_pricing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPricingResponse>, Integer, Hash)> get_listing_pricing_with_http_info(id, opts)

```ruby
begin
  # Get pricing recommendations
  data, status_code, headers = api_instance.get_listing_pricing_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPricingResponse>
rescue Repull::ApiError => e
  puts "Error when calling PricingApi->get_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Listing ID |  |
| **start_date** | **Date** | Inclusive start of the calendar window. Defaults to today. | [optional] |
| **end_date** | **Date** | Inclusive end of the calendar window. Defaults to today + 90 days. | [optional] |

### Return type

[**ListingPricingResponse**](ListingPricingResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_listing_pricing_history

> <ListingPricingHistoryResponse> get_listing_pricing_history(id, opts)

Pricing recommendation audit trail

Cursor-paginated audit trail of pricing recommendations vs applied prices for a listing across a date window. Use `pagination.nextCursor` from one response as the `cursor` query param of the next request.  Defaults to ±90 days from today. Cursor is a keyset on `date ASC` — stable even if rows are added during a partner's pagination walk. `limit` is capped at 500 — exceeding returns 422.  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PricingApi.new
id = 56 # Integer | 
opts = {
  start_date: Date.parse('2013-10-20'), # Date | Inclusive. Defaults to today - 90 days.
  end_date: Date.parse('2013-10-20'), # Date | Inclusive. Defaults to today + 90 days.
  limit: 56, # Integer | 
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.nextCursor`. Omit to fetch the first page.
  offset: 56 # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.next_cursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
}

begin
  # Pricing recommendation audit trail
  result = api_instance.get_listing_pricing_history(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PricingApi->get_listing_pricing_history: #{e}"
end
```

#### Using the get_listing_pricing_history_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPricingHistoryResponse>, Integer, Hash)> get_listing_pricing_history_with_http_info(id, opts)

```ruby
begin
  # Pricing recommendation audit trail
  data, status_code, headers = api_instance.get_listing_pricing_history_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPricingHistoryResponse>
rescue Repull::ApiError => e
  puts "Error when calling PricingApi->get_listing_pricing_history_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **start_date** | **Date** | Inclusive. Defaults to today - 90 days. | [optional] |
| **end_date** | **Date** | Inclusive. Defaults to today + 90 days. | [optional] |
| **limit** | **Integer** |  | [optional][default to 100] |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. Omit to fetch the first page. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.next_cursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |

### Return type

[**ListingPricingHistoryResponse**](ListingPricingHistoryResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_listing_pricing_strategy

> <ListingPricingStrategy> get_listing_pricing_strategy(id)

Get pricing strategy

Returns the strategy that constrains how the Atlas pricing model behaves for this listing. If no strategy row exists yet, returns sane defaults flagged with `isDefault: true`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PricingApi.new
id = 56 # Integer | 

begin
  # Get pricing strategy
  result = api_instance.get_listing_pricing_strategy(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PricingApi->get_listing_pricing_strategy: #{e}"
end
```

#### Using the get_listing_pricing_strategy_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPricingStrategy>, Integer, Hash)> get_listing_pricing_strategy_with_http_info(id)

```ruby
begin
  # Get pricing strategy
  data, status_code, headers = api_instance.get_listing_pricing_strategy_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPricingStrategy>
rescue Repull::ApiError => e
  puts "Error when calling PricingApi->get_listing_pricing_strategy_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

[**ListingPricingStrategy**](ListingPricingStrategy.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_listing_pricing_strategy

> <UpdateListingPricingStrategy200Response> update_listing_pricing_strategy(id, listing_pricing_strategy_input)

Update pricing strategy

Upserts the strategy on `(listing_id, customer_id)` — repeated PUTs are idempotent. Send only the fields you want to change; omitted fields take server-side defaults.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PricingApi.new
id = 56 # Integer | 
listing_pricing_strategy_input = Repull::ListingPricingStrategyInput.new # ListingPricingStrategyInput | 

begin
  # Update pricing strategy
  result = api_instance.update_listing_pricing_strategy(id, listing_pricing_strategy_input)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PricingApi->update_listing_pricing_strategy: #{e}"
end
```

#### Using the update_listing_pricing_strategy_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateListingPricingStrategy200Response>, Integer, Hash)> update_listing_pricing_strategy_with_http_info(id, listing_pricing_strategy_input)

```ruby
begin
  # Update pricing strategy
  data, status_code, headers = api_instance.update_listing_pricing_strategy_with_http_info(id, listing_pricing_strategy_input)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateListingPricingStrategy200Response>
rescue Repull::ApiError => e
  puts "Error when calling PricingApi->update_listing_pricing_strategy_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **listing_pricing_strategy_input** | [**ListingPricingStrategyInput**](ListingPricingStrategyInput.md) |  |  |

### Return type

[**UpdateListingPricingStrategy200Response**](UpdateListingPricingStrategy200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

