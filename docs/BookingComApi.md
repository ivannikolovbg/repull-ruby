# Repull::BookingComApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_booking_property**](BookingComApi.md#create_booking_property) | **POST** /v1/channels/booking/properties | Create Booking.com property |
| [**get_booking_content**](BookingComApi.md#get_booking_content) | **GET** /v1/channels/booking/content | Get Booking.com content |
| [**get_booking_listing_pricing**](BookingComApi.md#get_booking_listing_pricing) | **GET** /v1/channels/booking/listings/{id}/pricing | Get Booking.com pricing for a listing |
| [**list_booking_conversations**](BookingComApi.md#list_booking_conversations) | **GET** /v1/channels/booking/messaging | List Booking.com conversations |
| [**list_booking_properties**](BookingComApi.md#list_booking_properties) | **GET** /v1/channels/booking/properties | List Booking.com properties |
| [**list_booking_reviews**](BookingComApi.md#list_booking_reviews) | **GET** /v1/channels/booking/reviews | List Booking.com reviews |
| [**reply_booking_review**](BookingComApi.md#reply_booking_review) | **POST** /v1/channels/booking/reviews | Reply to Booking.com review |
| [**send_booking_message**](BookingComApi.md#send_booking_message) | **POST** /v1/channels/booking/messaging | Send Booking.com message |
| [**sync_booking**](BookingComApi.md#sync_booking) | **POST** /v1/channels/booking/sync | Bulk sync to Booking.com |
| [**update_booking_availability**](BookingComApi.md#update_booking_availability) | **PUT** /v1/channels/booking/availability | Update Booking.com rates/availability |
| [**update_booking_content**](BookingComApi.md#update_booking_content) | **POST** /v1/channels/booking/content | Update Booking.com content |
| [**update_booking_listing_pricing**](BookingComApi.md#update_booking_listing_pricing) | **PUT** /v1/channels/booking/listings/{id}/pricing | Update Booking.com pricing for a listing |


## create_booking_property

> <BookingProperty> create_booking_property

Create Booking.com property

Onboard a new Booking.com hotel via the OAuth Connect flow. Returns the hotel id once Stage-1 designation completes in the Extranet.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BookingComApi.new

begin
  # Create Booking.com property
  result = api_instance.create_booking_property
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->create_booking_property: #{e}"
end
```

#### Using the create_booking_property_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BookingProperty>, Integer, Hash)> create_booking_property_with_http_info

```ruby
begin
  # Create Booking.com property
  data, status_code, headers = api_instance.create_booking_property_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BookingProperty>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->create_booking_property_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**BookingProperty**](BookingProperty.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_booking_content

> get_booking_content

Get Booking.com content

Fetch the current content (descriptions, amenities, photos) for a Booking.com property. Used to round-trip edits through Repull.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BookingComApi.new

begin
  # Get Booking.com content
  api_instance.get_booking_content
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->get_booking_content: #{e}"
end
```

#### Using the get_booking_content_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_booking_content_with_http_info

```ruby
begin
  # Get Booking.com content
  data, status_code, headers = api_instance.get_booking_content_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->get_booking_content_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_booking_listing_pricing

> <BookingPricingResponse> get_booking_listing_pricing(id, opts)

Get Booking.com pricing for a listing

Resolves the Vanio listing ID to its Booking.com `hotel_id` (via the `listings_booking` mapping owned by the authenticated workspace), then proxies Booking's `getRoomRateAvailability` for the requested window. Pricing on Booking is per-room/per-rate-plan, so `room_id` and `room_level` flow through query params unchanged.  Mirrors the per-channel `/listings/{id}/pricing` shape used by Airbnb so SDK consumers can carry a Vanio listing ID across channels.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BookingComApi.new
id = 56 # Integer | Vanio listing ID — resolved to a Booking.com hotel ID via the workspace mapping.
opts = {
  start_date: Date.parse('2013-10-20'), # Date | 
  number_of_days: 56, # Integer | 
  room_id: 'room_id_example', # String | 
  room_level: true # Boolean | When true, returns room-level (vs rate-plan-level) availability.
}

begin
  # Get Booking.com pricing for a listing
  result = api_instance.get_booking_listing_pricing(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->get_booking_listing_pricing: #{e}"
end
```

#### Using the get_booking_listing_pricing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BookingPricingResponse>, Integer, Hash)> get_booking_listing_pricing_with_http_info(id, opts)

```ruby
begin
  # Get Booking.com pricing for a listing
  data, status_code, headers = api_instance.get_booking_listing_pricing_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BookingPricingResponse>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->get_booking_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Vanio listing ID — resolved to a Booking.com hotel ID via the workspace mapping. |  |
| **start_date** | **Date** |  | [optional] |
| **number_of_days** | **Integer** |  | [optional] |
| **room_id** | **String** |  | [optional] |
| **room_level** | **Boolean** | When true, returns room-level (vs rate-plan-level) availability. | [optional] |

### Return type

[**BookingPricingResponse**](BookingPricingResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_booking_conversations

> <BookingConversationListResponse> list_booking_conversations

List Booking.com conversations

List Booking.com guest conversations. Cursor-paginated. Use the messaging POST to send a reply.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BookingComApi.new

begin
  # List Booking.com conversations
  result = api_instance.list_booking_conversations
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_conversations: #{e}"
end
```

#### Using the list_booking_conversations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BookingConversationListResponse>, Integer, Hash)> list_booking_conversations_with_http_info

```ruby
begin
  # List Booking.com conversations
  data, status_code, headers = api_instance.list_booking_conversations_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BookingConversationListResponse>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_conversations_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**BookingConversationListResponse**](BookingConversationListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_booking_properties

> <BookingPropertyListResponse> list_booking_properties

List Booking.com properties

List Booking.com hotels claimed by this workspace. Each row includes the Booking-side hotel id and the connected room types.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BookingComApi.new

begin
  # List Booking.com properties
  result = api_instance.list_booking_properties
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_properties: #{e}"
end
```

#### Using the list_booking_properties_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BookingPropertyListResponse>, Integer, Hash)> list_booking_properties_with_http_info

```ruby
begin
  # List Booking.com properties
  data, status_code, headers = api_instance.list_booking_properties_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BookingPropertyListResponse>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_properties_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**BookingPropertyListResponse**](BookingPropertyListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_booking_reviews

> list_booking_reviews(property_id)

List Booking.com reviews

List guest reviews for a Booking.com property. Pass `property_id` (the Booking.com hotel id) as a query param — required.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BookingComApi.new
property_id = 'property_id_example' # String | Booking.com hotel/property id.

begin
  # List Booking.com reviews
  api_instance.list_booking_reviews(property_id)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_reviews: #{e}"
end
```

#### Using the list_booking_reviews_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> list_booking_reviews_with_http_info(property_id)

```ruby
begin
  # List Booking.com reviews
  data, status_code, headers = api_instance.list_booking_reviews_with_http_info(property_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_reviews_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** | Booking.com hotel/property id. |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## reply_booking_review

> <ReplyBookingReview200Response> reply_booking_review(reply_booking_review_request)

Reply to Booking.com review

Post a public host reply to a guest review on Booking.com. Booking allows one host reply per review — repeated POSTs are rejected by upstream.  Booking.com does NOT support host-authored reviews of guests via the API (platform-level limitation), so this endpoint is reply-only.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BookingComApi.new
reply_booking_review_request = Repull::ReplyBookingReviewRequest.new({property_id: 'property_id_example', review_id: 'review_id_example', response: 'response_example'}) # ReplyBookingReviewRequest | 

begin
  # Reply to Booking.com review
  result = api_instance.reply_booking_review(reply_booking_review_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->reply_booking_review: #{e}"
end
```

#### Using the reply_booking_review_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReplyBookingReview200Response>, Integer, Hash)> reply_booking_review_with_http_info(reply_booking_review_request)

```ruby
begin
  # Reply to Booking.com review
  data, status_code, headers = api_instance.reply_booking_review_with_http_info(reply_booking_review_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReplyBookingReview200Response>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->reply_booking_review_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reply_booking_review_request** | [**ReplyBookingReviewRequest**](ReplyBookingReviewRequest.md) |  |  |

### Return type

[**ReplyBookingReview200Response**](ReplyBookingReview200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## send_booking_message

> send_booking_message

Send Booking.com message

Send a message in a Booking.com conversation as the host. Booking enforces content rules similar to Airbnb.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BookingComApi.new

begin
  # Send Booking.com message
  api_instance.send_booking_message
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->send_booking_message: #{e}"
end
```

#### Using the send_booking_message_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> send_booking_message_with_http_info

```ruby
begin
  # Send Booking.com message
  data, status_code, headers = api_instance.send_booking_message_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->send_booking_message_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## sync_booking

> sync_booking

Bulk sync to Booking.com

Trigger a full bulk sync of properties + availability + rates to Booking.com. Runs async — returns 202 with a job id; poll `/v1/sync/jobs/{id}` for status.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BookingComApi.new

begin
  # Bulk sync to Booking.com
  api_instance.sync_booking
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->sync_booking: #{e}"
end
```

#### Using the sync_booking_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> sync_booking_with_http_info

```ruby
begin
  # Bulk sync to Booking.com
  data, status_code, headers = api_instance.sync_booking_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->sync_booking_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## update_booking_availability

> update_booking_availability

Update Booking.com rates/availability

Push availability + rate changes to Booking.com's OTA system. Accepts the standard OTA rate message — see Booking's OTA docs for the field shape. Errors from upstream surface as `booking_error`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BookingComApi.new

begin
  # Update Booking.com rates/availability
  api_instance.update_booking_availability
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_availability: #{e}"
end
```

#### Using the update_booking_availability_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_booking_availability_with_http_info

```ruby
begin
  # Update Booking.com rates/availability
  data, status_code, headers = api_instance.update_booking_availability_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_availability_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## update_booking_content

> update_booking_content

Update Booking.com content

Push content changes (descriptions, amenities, photos) to Booking.com. Booking enforces editorial review on text fields — changes appear after their content moderation queue clears.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BookingComApi.new

begin
  # Update Booking.com content
  api_instance.update_booking_content
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_content: #{e}"
end
```

#### Using the update_booking_content_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_booking_content_with_http_info

```ruby
begin
  # Update Booking.com content
  data, status_code, headers = api_instance.update_booking_content_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_content_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## update_booking_listing_pricing

> <BookingPricingUpdateResponse> update_booking_listing_pricing(id, booking_pricing_update_request)

Update Booking.com pricing for a listing

Pushes one or more rate updates to Booking.com via `updateRates`. Each update needs `roomId` + `rateId` + `dateRange` + `price` + `currency`. Field-level validation runs up front so callers don't have to parse Booking's XML error envelope to discover a missing `roomId`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BookingComApi.new
id = 56 # Integer | 
booking_pricing_update_request = Repull::BookingPricingUpdateRequest.new({updates: [Repull::BookingPricingRateUpdate.new({room_id: 'room_id_example', rate_id: 'rate_id_example', date_range: Repull::BookingPricingRateUpdateDateRange.new({start: Date.today, _end: Date.today}), price: 3.56, currency: 'USD'})]}) # BookingPricingUpdateRequest | 

begin
  # Update Booking.com pricing for a listing
  result = api_instance.update_booking_listing_pricing(id, booking_pricing_update_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_listing_pricing: #{e}"
end
```

#### Using the update_booking_listing_pricing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BookingPricingUpdateResponse>, Integer, Hash)> update_booking_listing_pricing_with_http_info(id, booking_pricing_update_request)

```ruby
begin
  # Update Booking.com pricing for a listing
  data, status_code, headers = api_instance.update_booking_listing_pricing_with_http_info(id, booking_pricing_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BookingPricingUpdateResponse>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **booking_pricing_update_request** | [**BookingPricingUpdateRequest**](BookingPricingUpdateRequest.md) |  |  |

### Return type

[**BookingPricingUpdateResponse**](BookingPricingUpdateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

