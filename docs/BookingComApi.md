# Repull::BookingComApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**acknowledge_booking_reservations**](BookingComApi.md#acknowledge_booking_reservations) | **POST** /v1/channels/booking/reservations | Acknowledge Booking.com reservations |
| [**booking_setup**](BookingComApi.md#booking_setup) | **POST** /v1/channels/booking/setup | Booking.com property setup actions |
| [**create_booking_webhook**](BookingComApi.md#create_booking_webhook) | **POST** /v1/channels/booking/webhooks | Subscribe to a Booking.com notification |
| [**delete_booking_webhook**](BookingComApi.md#delete_booking_webhook) | **DELETE** /v1/channels/booking/webhooks | Unsubscribe from a Booking.com notification |
| [**get_booking_charges**](BookingComApi.md#get_booking_charges) | **GET** /v1/channels/booking/charges | Get Booking.com charges |
| [**get_booking_content**](BookingComApi.md#get_booking_content) | **GET** /v1/channels/booking/content | Get Booking.com content |
| [**get_booking_listing_pricing**](BookingComApi.md#get_booking_listing_pricing) | **GET** /v1/channels/booking/listings/{id}/pricing | Get Booking.com pricing for a listing |
| [**get_booking_property**](BookingComApi.md#get_booking_property) | **GET** /v1/channels/booking/properties/{id} | Get Booking.com connection for a listing |
| [**list_booking_conversations**](BookingComApi.md#list_booking_conversations) | **GET** /v1/channels/booking/messaging | List Booking.com conversations |
| [**list_booking_properties**](BookingComApi.md#list_booking_properties) | **GET** /v1/channels/booking/properties | List Booking.com properties |
| [**list_booking_reservations**](BookingComApi.md#list_booking_reservations) | **GET** /v1/channels/booking/reservations | List Booking.com reservations |
| [**list_booking_reviews**](BookingComApi.md#list_booking_reviews) | **GET** /v1/channels/booking/reviews | List Booking.com reviews |
| [**list_booking_webhooks**](BookingComApi.md#list_booking_webhooks) | **GET** /v1/channels/booking/webhooks | List Booking.com webhook subscriptions |
| [**reply_booking_review**](BookingComApi.md#reply_booking_review) | **POST** /v1/channels/booking/reviews | Reply to Booking.com review |
| [**send_booking_message**](BookingComApi.md#send_booking_message) | **POST** /v1/channels/booking/messaging | Send Booking.com message |
| [**update_booking_availability**](BookingComApi.md#update_booking_availability) | **PUT** /v1/channels/booking/availability | Update Booking.com rates/availability |
| [**update_booking_charges**](BookingComApi.md#update_booking_charges) | **PUT** /v1/channels/booking/charges | Set Booking.com charges |
| [**update_booking_content**](BookingComApi.md#update_booking_content) | **POST** /v1/channels/booking/content | Update Booking.com content |
| [**update_booking_listing_pricing**](BookingComApi.md#update_booking_listing_pricing) | **PUT** /v1/channels/booking/listings/{id}/pricing | Update Booking.com pricing for a listing |


## acknowledge_booking_reservations

> acknowledge_booking_reservations(acknowledge_booking_reservations_request)

Acknowledge Booking.com reservations

Acknowledge one or more reservations so Booking.com removes them from the `new` queue. The body carries `reservation_ids` (non-empty array). Acknowledge only after you have durably persisted each reservation.

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
acknowledge_booking_reservations_request = Repull::AcknowledgeBookingReservationsRequest.new({reservation_ids: ['reservation_ids_example']}) # AcknowledgeBookingReservationsRequest | 

begin
  # Acknowledge Booking.com reservations
  api_instance.acknowledge_booking_reservations(acknowledge_booking_reservations_request)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->acknowledge_booking_reservations: #{e}"
end
```

#### Using the acknowledge_booking_reservations_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> acknowledge_booking_reservations_with_http_info(acknowledge_booking_reservations_request)

```ruby
begin
  # Acknowledge Booking.com reservations
  data, status_code, headers = api_instance.acknowledge_booking_reservations_with_http_info(acknowledge_booking_reservations_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->acknowledge_booking_reservations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **acknowledge_booking_reservations_request** | [**AcknowledgeBookingReservationsRequest**](AcknowledgeBookingReservationsRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## booking_setup

> booking_setup(booking_setup_request)

Booking.com property setup actions

Action-router for onboarding a property onto Booking.com. Select the step with `action`:  - `create-legal-entity` — register the legal entity (returns 201). - `check-legal-status` — poll legal-entity status by `leid`. - `check-readiness` — check whether a property is ready to open (`property_id`). - `open-property` — open the property for sale (`property_id`). - `set-contacts` — set property contacts (`property_id`, `contacts`). - `set-policies` — set property policies (`property_id`, plus policy fields).  Missing required fields per action return a validation error; upstream failures surface as `booking_error`.

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
booking_setup_request = Repull::BookingSetupRequest.new({action: 'create-legal-entity'}) # BookingSetupRequest | 

begin
  # Booking.com property setup actions
  api_instance.booking_setup(booking_setup_request)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->booking_setup: #{e}"
end
```

#### Using the booking_setup_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> booking_setup_with_http_info(booking_setup_request)

```ruby
begin
  # Booking.com property setup actions
  data, status_code, headers = api_instance.booking_setup_with_http_info(booking_setup_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->booking_setup_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **booking_setup_request** | [**BookingSetupRequest**](BookingSetupRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_booking_webhook

> create_booking_webhook(create_booking_webhook_request)

Subscribe to a Booking.com notification

Subscribe to a Booking.com CNS notification type, delivered to `callback_url`. Returns 201 on success.

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
create_booking_webhook_request = Repull::CreateBookingWebhookRequest.new({notification_type: 'notification_type_example', callback_url: 'callback_url_example'}) # CreateBookingWebhookRequest | 

begin
  # Subscribe to a Booking.com notification
  api_instance.create_booking_webhook(create_booking_webhook_request)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->create_booking_webhook: #{e}"
end
```

#### Using the create_booking_webhook_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_booking_webhook_with_http_info(create_booking_webhook_request)

```ruby
begin
  # Subscribe to a Booking.com notification
  data, status_code, headers = api_instance.create_booking_webhook_with_http_info(create_booking_webhook_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->create_booking_webhook_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_booking_webhook_request** | [**CreateBookingWebhookRequest**](CreateBookingWebhookRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_booking_webhook

> delete_booking_webhook(notification_type)

Unsubscribe from a Booking.com notification

Remove a Booking.com CNS subscription. Pass the `notification_type` to unsubscribe as a query param — required.

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
notification_type = 'notification_type_example' # String | Booking.com CNS notification type to unsubscribe.

begin
  # Unsubscribe from a Booking.com notification
  api_instance.delete_booking_webhook(notification_type)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->delete_booking_webhook: #{e}"
end
```

#### Using the delete_booking_webhook_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_booking_webhook_with_http_info(notification_type)

```ruby
begin
  # Unsubscribe from a Booking.com notification
  data, status_code, headers = api_instance.delete_booking_webhook_with_http_info(notification_type)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->delete_booking_webhook_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **notification_type** | **String** | Booking.com CNS notification type to unsubscribe. |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_booking_charges

> get_booking_charges(property_id)

Get Booking.com charges

Fetch the extra-charge set (cleaning fee, resort fee, city tax, etc.) configured for a Booking.com property. Pass the Booking.com `property_id` as a query param — required.

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
  # Get Booking.com charges
  api_instance.get_booking_charges(property_id)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->get_booking_charges: #{e}"
end
```

#### Using the get_booking_charges_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_booking_charges_with_http_info(property_id)

```ruby
begin
  # Get Booking.com charges
  data, status_code, headers = api_instance.get_booking_charges_with_http_info(property_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->get_booking_charges_with_http_info: #{e}"
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


## get_booking_property

> get_booking_property(id)

Get Booking.com connection for a listing

Return the Booking.com connection record(s) for a Vanio listing — the linked Booking hotel id, sync flags, markup, sync category, and suspension state. Scoped to the authenticated workspace; a listing with no Booking.com connection returns 404.

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
id = 56 # Integer | Vanio listing ID.

begin
  # Get Booking.com connection for a listing
  api_instance.get_booking_property(id)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->get_booking_property: #{e}"
end
```

#### Using the get_booking_property_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_booking_property_with_http_info(id)

```ruby
begin
  # Get Booking.com connection for a listing
  data, status_code, headers = api_instance.get_booking_property_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->get_booking_property_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Vanio listing ID. |  |

### Return type

nil (empty response body)

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


## list_booking_reservations

> list_booking_reservations(opts)

List Booking.com reservations

Pull reservations from Booking.com. `type=new` (default) returns un-acknowledged bookings; `type=modified` returns changed bookings. Pass both `reservation_id` and `hotel_id` to fetch a single reservation's full details. Acknowledge processed reservations with the POST so Booking stops re-serving them in the `new` queue.

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
opts = {
  type: 'new', # String | Which set to pull. `details` requires `reservation_id` + `hotel_id`.
  hotel_id: 'hotel_id_example', # String | Booking.com hotel id — filters `new`/`modified`, and is required with `reservation_id` for details.
  reservation_id: 'reservation_id_example' # String | Booking.com reservation id — with `hotel_id`, returns that reservation's details.
}

begin
  # List Booking.com reservations
  api_instance.list_booking_reservations(opts)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_reservations: #{e}"
end
```

#### Using the list_booking_reservations_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> list_booking_reservations_with_http_info(opts)

```ruby
begin
  # List Booking.com reservations
  data, status_code, headers = api_instance.list_booking_reservations_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_reservations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Which set to pull. &#x60;details&#x60; requires &#x60;reservation_id&#x60; + &#x60;hotel_id&#x60;. | [optional][default to &#39;new&#39;] |
| **hotel_id** | **String** | Booking.com hotel id — filters &#x60;new&#x60;/&#x60;modified&#x60;, and is required with &#x60;reservation_id&#x60; for details. | [optional] |
| **reservation_id** | **String** | Booking.com reservation id — with &#x60;hotel_id&#x60;, returns that reservation&#39;s details. | [optional] |

### Return type

nil (empty response body)

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


## list_booking_webhooks

> list_booking_webhooks

List Booking.com webhook subscriptions

List the workspace's Booking.com Content Notification Service (CNS) subscriptions — the notification types Booking pushes to your callback URLs.

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
  # List Booking.com webhook subscriptions
  api_instance.list_booking_webhooks
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_webhooks: #{e}"
end
```

#### Using the list_booking_webhooks_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> list_booking_webhooks_with_http_info

```ruby
begin
  # List Booking.com webhook subscriptions
  data, status_code, headers = api_instance.list_booking_webhooks_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_webhooks_with_http_info: #{e}"
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


## update_booking_availability

> update_booking_availability(booking_availability_update_request)

Update Booking.com rates/availability

Push availability, rates, and the full restriction set to Booking.com. `type` selects the write path:  - `rates` — nightly price + length-of-stay / arrival restrictions (min/max stay, closed-to-arrival, closed-to-departure, advance-reservation window). - `availability` — inventory (`availableRooms`), the dedicated stop-sell flag (`closed`), and the same restriction set. - `derived-pricing` — occupancy-derived pricing rules.  Restrictions never leak across channels — this endpoint writes only to Booking.com. Errors from upstream surface as `booking_error`.

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
booking_availability_update_request = Repull::BookingAvailabilityUpdateRequest.new({type: 'type_example', property_id: nil, updates: [Repull::BookingAvailabilityUpdate.new({room_id: 'room_id_example', rate_id: 'rate_id_example', date_range: Repull::BookingPricingRateUpdateDateRange.new({start: Date.today, _end: Date.today}), available_rooms: 37})]}) # BookingAvailabilityUpdateRequest | 

begin
  # Update Booking.com rates/availability
  api_instance.update_booking_availability(booking_availability_update_request)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_availability: #{e}"
end
```

#### Using the update_booking_availability_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_booking_availability_with_http_info(booking_availability_update_request)

```ruby
begin
  # Update Booking.com rates/availability
  data, status_code, headers = api_instance.update_booking_availability_with_http_info(booking_availability_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **booking_availability_update_request** | [**BookingAvailabilityUpdateRequest**](BookingAvailabilityUpdateRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_booking_charges

> update_booking_charges(update_booking_charges_request)

Set Booking.com charges

Replace the extra-charge set for a Booking.com property. The body carries the target `property_id` and the full `charges` array — Booking treats the write as a full replacement, so include every charge you want to keep.

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
update_booking_charges_request = Repull::UpdateBookingChargesRequest.new({property_id: 'property_id_example', charges: [{ key: 3.56}]}) # UpdateBookingChargesRequest | 

begin
  # Set Booking.com charges
  api_instance.update_booking_charges(update_booking_charges_request)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_charges: #{e}"
end
```

#### Using the update_booking_charges_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_booking_charges_with_http_info(update_booking_charges_request)

```ruby
begin
  # Set Booking.com charges
  data, status_code, headers = api_instance.update_booking_charges_with_http_info(update_booking_charges_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_charges_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **update_booking_charges_request** | [**UpdateBookingChargesRequest**](UpdateBookingChargesRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


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

