# Repull::AvailabilityApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_availability**](AvailabilityApi.md#get_availability) | **GET** /v1/availability/{propertyId} | Get property availability |


## get_availability

> <PropertyAvailability> get_availability(property_id, from, to)

Get property availability

Channel-agnostic day-by-day availability calendar for a property over a date window. Returns a thin per-date shape — `{ date, available, price, minNights }` — projected from the connected channel calendar (currently Airbnb).  The `from` and `to` query params are **required** (ISO `YYYY-MM-DD`, inclusive) — omitting or malforming either returns 422. The window is capped at 366 days; longer ranges are truncated to the first 366 days.  Every date in the window is present in `days`: dates with no explicit calendar row fall back to `available: true` at the property's default nightly price. A property with no channel calendar still returns a real 200 (a fully-default calendar), never a 404 — 404 means the property id does not exist or belongs to a different workspace.  This endpoint is read-only. Availability **writes** stay per-channel: `PUT /v1/channels/airbnb/listings/{id}/availability` (Airbnb) or `PUT /v1/channels/booking/availability` (Booking.com).

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

