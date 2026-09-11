# Repull::AvailabilityApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**batch_update_availability**](AvailabilityApi.md#batch_update_availability) | **PATCH** /v1/availability/batch | Update availability across many properties |
| [**get_availability**](AvailabilityApi.md#get_availability) | **GET** /v1/availability/{propertyId} | Get property availability |
| [**update_availability**](AvailabilityApi.md#update_availability) | **PUT** /v1/availability/{propertyId} | Set prices, block or unblock dates |


## batch_update_availability

> <AvailabilityWriteResult> batch_update_availability(availability_batch_write_request)

Update availability across many properties

Applies ONE settings object across up to 500 properties and pushes the result to every connected channel.  Ownership is checked before anything is written: a batch containing a property from another workspace is refused as a whole and names the offending ids, rather than being partially applied.  Per-property *different* values are separate calls — presenting them as one request would be a false claim about atomicity.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AvailabilityApi.new
availability_batch_write_request = Repull::AvailabilityBatchWriteRequest.new({dates: [Date.today], property_ids: [37]}) # AvailabilityBatchWriteRequest | 

begin
  # Update availability across many properties
  result = api_instance.batch_update_availability(availability_batch_write_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->batch_update_availability: #{e}"
end
```

#### Using the batch_update_availability_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AvailabilityWriteResult>, Integer, Hash)> batch_update_availability_with_http_info(availability_batch_write_request)

```ruby
begin
  # Update availability across many properties
  data, status_code, headers = api_instance.batch_update_availability_with_http_info(availability_batch_write_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AvailabilityWriteResult>
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->batch_update_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **availability_batch_write_request** | [**AvailabilityBatchWriteRequest**](AvailabilityBatchWriteRequest.md) |  |  |

### Return type

[**AvailabilityWriteResult**](AvailabilityWriteResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_availability

> <PropertyAvailability> get_availability(property_id, from, to)

Get property availability

Channel-agnostic day-by-day availability calendar for a property over a date window. Returns a thin per-date shape — `{ date, available, price, minNights }` — projected from the property calendar.  The `from` and `to` query params are **required** (ISO `YYYY-MM-DD`, inclusive) — omitting or malforming either returns 422. The window is capped at 366 days; longer ranges are truncated to the first 366 days.  **`days` contains only the dates we actually hold calendar data for.** Requested dates with no calendar row are listed in `coverage.missingDates` — their availability is unknown. Never treat a missing date as bookable: this endpoint deliberately does not synthesise availability, because a fabricated open date can be double-booked. A property with no calendar still returns a real 200 (`days: []`, every date in `coverage.missingDates`), never a 404 — 404 means the property id does not exist or belongs to a different workspace.  This endpoint is read-only, and the projected per-date shape carries **availability, price, and min-nights only** — it does NOT expose max-stay, closed-to-arrival (CTA), closed-to-departure (CTD), or the dedicated stop-sell flag. To read or write that full restriction set on Booking.com use the channel routes: `GET`/`PUT /v1/channels/booking/availability` (with the room + rate ids from `GET /v1/channels/booking/properties/{id}/rooms`). Availability **writes** always stay per-channel: `PUT /v1/channels/airbnb/listings/{id}/availability` (Airbnb) or `PUT /v1/channels/booking/availability` (Booking.com).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AvailabilityApi.new
property_id = 56 # Integer | Repull property id (equal to `listings.id`; the same integer used as `propertyId` on availability and `listingId` on reservations).
from = Date.parse('2013-10-20') # Date | Start of the window (inclusive), ISO `YYYY-MM-DD`. Required — missing/malformed returns 422. `startDate` is accepted as an alias.
to = Date.parse('2013-10-20') # Date | End of the window (inclusive), ISO `YYYY-MM-DD`. Required — missing/malformed returns 422. `endDate` is accepted as an alias.

begin
  # Get property availability
  result = api_instance.get_availability(property_id, from, to)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->get_availability: #{e}"
end
```

#### Using the get_availability_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PropertyAvailability>, Integer, Hash)> get_availability_with_http_info(property_id, from, to)

```ruby
begin
  # Get property availability
  data, status_code, headers = api_instance.get_availability_with_http_info(property_id, from, to)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PropertyAvailability>
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->get_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **Integer** | Repull property id (equal to &#x60;listings.id&#x60;; the same integer used as &#x60;propertyId&#x60; on availability and &#x60;listingId&#x60; on reservations). |  |
| **from** | **Date** | Start of the window (inclusive), ISO &#x60;YYYY-MM-DD&#x60;. Required — missing/malformed returns 422. &#x60;startDate&#x60; is accepted as an alias. |  |
| **to** | **Date** | End of the window (inclusive), ISO &#x60;YYYY-MM-DD&#x60;. Required — missing/malformed returns 422. &#x60;endDate&#x60; is accepted as an alias. |  |

### Return type

[**PropertyAvailability**](PropertyAvailability.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_availability

> <AvailabilityWriteResult> update_availability(property_id, availability_write_request)

Set prices, block or unblock dates

Writes the calendar for one property AND pushes to every connected channel in the same step. A write that only changed our copy would leave the OTA calendars stale and eventually double-book a guest.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AvailabilityApi.new
property_id = 56 # Integer | 
availability_write_request = Repull::AvailabilityWriteRequest.new({dates: [Date.today]}) # AvailabilityWriteRequest | 

begin
  # Set prices, block or unblock dates
  result = api_instance.update_availability(property_id, availability_write_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->update_availability: #{e}"
end
```

#### Using the update_availability_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AvailabilityWriteResult>, Integer, Hash)> update_availability_with_http_info(property_id, availability_write_request)

```ruby
begin
  # Set prices, block or unblock dates
  data, status_code, headers = api_instance.update_availability_with_http_info(property_id, availability_write_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AvailabilityWriteResult>
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->update_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **Integer** |  |  |
| **availability_write_request** | [**AvailabilityWriteRequest**](AvailabilityWriteRequest.md) |  |  |

### Return type

[**AvailabilityWriteResult**](AvailabilityWriteResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

