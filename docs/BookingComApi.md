# Repull::BookingComApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**acknowledge_booking_reservations**](BookingComApi.md#acknowledge_booking_reservations) | **POST** /v1/channels/booking/reservations | Acknowledge Booking.com reservations |
| [**booking_property_action**](BookingComApi.md#booking_property_action) | **POST** /v1/channels/booking/properties/{id} | Take a property off sale / put it back (unlist/relist) |
| [**booking_setup**](BookingComApi.md#booking_setup) | **POST** /v1/channels/booking/setup | Booking.com property setup actions |
| [**create_booking_webhook**](BookingComApi.md#create_booking_webhook) | **POST** /v1/channels/booking/webhooks | Subscribe to a Booking.com notification |
| [**delete_booking_webhook**](BookingComApi.md#delete_booking_webhook) | **DELETE** /v1/channels/booking/webhooks | Unsubscribe from a Booking.com notification |
| [**get_booking_availability**](BookingComApi.md#get_booking_availability) | **GET** /v1/channels/booking/availability | Read current Booking.com rates/availability/restrictions |
| [**get_booking_charges**](BookingComApi.md#get_booking_charges) | **GET** /v1/channels/booking/charges | Get Booking.com charges |
| [**get_booking_content**](BookingComApi.md#get_booking_content) | **GET** /v1/channels/booking/content | Get Booking.com content |
| [**get_booking_listing_pricing**](BookingComApi.md#get_booking_listing_pricing) | **GET** /v1/channels/booking/listings/{id}/pricing | Get Booking.com pricing for a listing |
| [**get_booking_property**](BookingComApi.md#get_booking_property) | **GET** /v1/channels/booking/properties/{id} | Get Booking.com connection for a listing |
| [**list_booking_conversations**](BookingComApi.md#list_booking_conversations) | **GET** /v1/channels/booking/messaging | List Booking.com conversations |
| [**list_booking_properties**](BookingComApi.md#list_booking_properties) | **GET** /v1/channels/booking/properties | List Booking.com properties |
| [**list_booking_property_rooms**](BookingComApi.md#list_booking_property_rooms) | **GET** /v1/channels/booking/properties/{id}/rooms | List Booking.com rooms + rate-plan ids for a listing |
| [**list_booking_reservations**](BookingComApi.md#list_booking_reservations) | **GET** /v1/channels/booking/reservations | List Booking.com reservations |
| [**list_booking_reviews**](BookingComApi.md#list_booking_reviews) | **GET** /v1/channels/booking/reviews | List Booking.com reviews |
| [**list_booking_webhooks**](BookingComApi.md#list_booking_webhooks) | **GET** /v1/channels/booking/webhooks | List Booking.com webhook subscriptions |
| [**map_booking_room**](BookingComApi.md#map_booking_room) | **POST** /v1/channels/booking/listings/map | Map a Booking.com room to a Repull listing |
| [**reply_booking_review**](BookingComApi.md#reply_booking_review) | **POST** /v1/channels/booking/reviews | Reply to Booking.com review |
| [**send_booking_message**](BookingComApi.md#send_booking_message) | **POST** /v1/channels/booking/messaging | Send Booking.com message |
| [**update_booking_availability**](BookingComApi.md#update_booking_availability) | **PUT** /v1/channels/booking/availability | Update Booking.com rates/availability |
| [**update_booking_charges**](BookingComApi.md#update_booking_charges) | **PUT** /v1/channels/booking/charges | Set Booking.com charges |
| [**update_booking_content**](BookingComApi.md#update_booking_content) | **POST** /v1/channels/booking/content | Update Booking.com content |
| [**update_booking_listing_pricing**](BookingComApi.md#update_booking_listing_pricing) | **PUT** /v1/channels/booking/listings/{id}/pricing | Update Booking.com pricing for a listing |


## acknowledge_booking_reservations

> acknowledge_booking_reservations(acknowledge_booking_reservations_request)

Acknowledge Booking.com reservations

Acknowledge one or more reservations so Booking.com removes them from the `new` queue. The body carries `reservation_ids` (non-empty array). Acknowledge only after you have durably persisted each reservation.  Only reservations that belong to this workspace can be acknowledged. If any id in `reservation_ids` is not one of this workspace's Booking.com reservations (`confirmationCode` on `GET /v1/reservations?platform=booking`), nothing is acknowledged and the response is `404 not_found` naming those ids in `reservation_ids`.

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


## booking_property_action

> <BookingPropertyActionResponse> booking_property_action(id, booking_property_action_request, opts)

Take a property off sale / put it back (unlist/relist)

Stop this listing's Booking.com property being sold, or start it again. `id` is a **Repull listing id**, not a Booking.com hotel id, as on the GET.  **Booking.com has no unlist, so this is an availability write.** Airbnb has a real deactivate; Booking.com does not. `unlist` closes the mapped room across the whole forward window, so the property stops selling. `relist` is not its mirror image: it re-syncs the true calendar, so dates that are genuinely blocked (a reservation, an owner stay) stay blocked and only the closure `unlist` wrote lifts. Re-opening everything would sell dates that are not for sale.  **Which property gets closed.** A listing can be mapped to more than one Booking.com property — the same unit re-listed under a new property keeps its old mapping, and workspaces routinely sit on five or six. With exactly one, send nothing. With several, name one with `hotelId` (or `?hotel_id=`); omit it and the request is refused with **`409 ambiguous_booking_mapping`** listing the candidates, and nothing is written. That refusal matters more here than on a publish: writing content into the wrong property is recoverable, closing the wrong property's availability takes real inventory off sale while the property you meant keeps selling. Naming a property this listing is not mapped to is a `404` that names the ones it is.  **This does not change the listing in Repull.** `active` — what Repull bills and serves — is untouched by both actions and is deliberately not echoed in the response, so the two ideas can never be read as one field. To take a listing off the market on every channel at once, use `POST /v1/listings/{id}/offline`.  Any other action returns a structured `422` naming the ones that are supported. To push content use `POST /v1/listings/{id}/publish/booking`; to map rooms use `POST /v1/connect/booking/map-rooms`.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
id = 56 # Integer | Repull listing id — NOT a Booking.com hotel id.
booking_property_action_request = Repull::BookingPropertyActionRequest.new({action: 'action_example'}) # BookingPropertyActionRequest | 
opts = {
  hotel_id: 'hotel_id_example', # String | Booking.com property to act on, for a listing mapped to more than one. The query-string spelling of the body's `hotelId`; the body wins when both are sent.
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Take a property off sale / put it back (unlist/relist)
  result = api_instance.booking_property_action(id, booking_property_action_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->booking_property_action: #{e}"
end
```

#### Using the booking_property_action_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BookingPropertyActionResponse>, Integer, Hash)> booking_property_action_with_http_info(id, booking_property_action_request, opts)

```ruby
begin
  # Take a property off sale / put it back (unlist/relist)
  data, status_code, headers = api_instance.booking_property_action_with_http_info(id, booking_property_action_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BookingPropertyActionResponse>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->booking_property_action_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id — NOT a Booking.com hotel id. |  |
| **booking_property_action_request** | [**BookingPropertyActionRequest**](BookingPropertyActionRequest.md) |  |  |
| **hotel_id** | **String** | Booking.com property to act on, for a listing mapped to more than one. The query-string spelling of the body&#39;s &#x60;hotelId&#x60;; the body wins when both are sent. | [optional] |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**BookingPropertyActionResponse**](BookingPropertyActionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## booking_setup

> booking_setup(booking_setup_request)

Booking.com property setup actions

Action-router for putting a property onto Booking.com — including building one from nothing. Select the step with `action`.  ## Opening a property  - `create-property` — create a NEW Booking.com property for a Repull listing (`listing_id`). Creates the property, its first room with the listing's beds, a rate plan and the room-rate product that makes the room sellable (under the listing's cancellation policy), sets the contact and invoice details and the facilities, seeds availability and rates, syncs the calendar, then runs Booking.com's readiness check and reports what still blocks opening in `warnings`. Send `contact` (`name`, `email`, `phone` in international form); without it the workspace owner is used, and a workspace with no usable contact is refused before anything is created. Returns 201. - `add-room` — add another room type (and its sellable product) to a property (`listing_id`, `property_id`). Returns 201. - `add-unit` — raise the number of identical units on an existing room (`listing_id`, `property_id`, `room_id`). - `advance` — run Booking.com's readiness check for a property (`property_id`) and, when it passes, open it. Returns `checked`, `opened`, `sellable` and `blockers` — Booking.com's own reasons it cannot open yet.  ## Account and policy steps  - `create-legal-entity` — register a legal entity directly (returns 201). Not normally needed: see the legal-entity rules below. - `check-legal-status` — always `404`. A legal entity's details are readable for any id on the connectivity-provider credentials every workspace shares, and nothing records which workspace registered which entity, so no entity can be shown to be yours. `create-property` resolves it for you. - `check-readiness` — whether a property is ready to open (`property_id`): `ready` and `blockers`, without trying to open it. - `open-property` — open the property for sale (`property_id`). Refused with `422 booking_rejected` naming the blockers when it is not ready. - `set-contacts` — set property contacts (`property_id`, `contacts` in Booking.com's Contacts API shape; at most one carries the `general` profile). - `set-policies` — add a cancellation policy (`property_id`, `policyCode`, optional `prepaymentRequired`). House rules, pets, children and the damage deposit are `POST /v1/channels/booking/content` with `type: \"settings\"`.  ## Three things about Booking.com that cost real money  **A newly created property is NOT sellable.** Booking.com opens it only when its readiness check passes, and the check names what is missing — a main photo still processing, no availability, a licence the region requires. The response always reports `status: \"being_built\"` and `sellable: false`, never a guess, with the reasons in `warnings`. Resolve them, then `advance`.  **A room with no ACTIVE rate plan is invisible.** Booking only renders rooms that have at least one active product linkage (room × rate plan). A room can be created successfully, return a `roomId`, and never appear on the property page. If `rateId` comes back `null` from `create-property` or `add-room`, that is exactly what happened: activate a rate plan on the property in the Extranet, then add the room again.  **Room names are Booking.com's.** Travellers see one of Booking.com's standard names (\"Two-Bedroom Apartment\"), chosen from the listing's bedrooms. The listing's own name is kept as the operator-side reference, never shown to guests.  ## The legal entity is resolved, not asked for  A property is created against the legal entity Booking.com contracts with, invoices and pays. You do not normally send one:  1. If this workspace already creates properties under a legal entity, that one is reused. A second is never registered. 2. If it has none and the request carries `legal_entity` (`company_name`, `legal_contact_name`, `legal_contact_email`), one is registered and used. Booking.com emails the legal contact a contract; creation only succeeds once it is signed. 3. If it has none and no `legal_entity`, the request is refused with `422 legal_entity_required` naming the fields — a contracted company is never invented.  `legal_entity_id` overrides all of that. An id that already carries another workspace's properties is refused with `403 legal_entity_not_yours` before anything is created.  ## What you do not control  Properties are created against Booking's **production** target only. A test-target property cannot be sold through and there is no route back from one, so `target` is not a parameter — sending it changes nothing.  The property category comes from the listing's property type (Apartment when it has none; Holiday home, Villa or Chalet when it says so). The initial room count is 1. Latitude and longitude come from the listing and are adjusted slightly to clear Booking.com's duplicate detection — send the property's true position on the listing and do not pre-adjust it yourself.  The listing's name, check-in/check-out times, currency, capacity and price come from the listing. Its postal code is taken from the listing's own `postalCode`; when the listing has none, it falls back to a connected Airbnb listing. A listing with neither is created without a postal code, so set `postalCode` on the listing first.  ## Guards  Every action that takes a `property_id` requires a property connected to this workspace; any other id returns `404 not_found`. Every action that takes a `listing_id` requires a listing in this workspace; any other id returns `404 not_found`.  `create-property` refuses a listing with no coordinates (`422 missing_coordinates`) before anything is created — creating a Booking.com property cannot be undone.  `create-property` is subject to the same published-listing gate as the dashboard: no plan, or the plan's listing limit reached, returns `403 billing_error` with `used` and `limit`, and nothing is created.  Returns `403 listing_inactive` when the listing — or any listing mapped to the Booking.com property — is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.  If a property is created and a later step fails, the response is `422 booking_create_partial` carrying `property_id`. The property EXISTS. Do not retry `create-property`, which would open a second one — continue with `add-room` and `advance`.

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
booking_setup_request = Repull::BookingSetupRequest.new({action: 'create-property'}) # BookingSetupRequest | 

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

**Not available through the API — always returns `403 forbidden`.** Booking.com notification subscriptions belong to the Repull platform account that every workspace shares: they are per notification type, not per property, so reading or changing them would affect every workspace. Booking.com events for your own properties are delivered through Repull webhooks — subscribe with `POST /v1/webhooks`.

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

**Not available through the API — always returns `403 forbidden`.** Booking.com notification subscriptions belong to the Repull platform account that every workspace shares: they are per notification type, not per property, so reading or changing them would affect every workspace. Booking.com events for your own properties are delivered through Repull webhooks — subscribe with `POST /v1/webhooks`.

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


## get_booking_availability

> <BookingAvailabilityStateResponse> get_booking_availability(property_id, opts)

Read current Booking.com rates/availability/restrictions

Read the current rate, availability, and restriction state for a Booking.com property so you can reconcile before writing with the PUT on this path. Keyed by `property_id` (the Booking hotel id), symmetric with the PUT.  Proxies Booking's `getRoomRateAvailability` — the returned fields (price, rooms-to-sell, min/max stay, closed-to-arrival/departure, stop-sell) are whatever Booking.com emits for the window. A listing-id-keyed equivalent is available at `GET /v1/channels/booking/listings/{id}/pricing`.  `property_id` must be a Booking.com property connected to this workspace (`GET /v1/channels/booking/properties` lists them). Any other id — including one connected to a different workspace — returns `404 not_found`, the same answer as an id that does not exist.  Returns `403 listing_inactive` when any listing mapped to the Booking.com property is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
opts = {
  start_date: Date.parse('2013-10-20'), # Date | Window start (ISO YYYY-MM-DD).
  number_of_days: 56, # Integer | Window length in days.
  room_id: 'room_id_example', # String | Restrict to a single Booking.com room id.
  room_level: true # Boolean | Defaults to `true`: availability per room, which is how Booking.com keeps inventory and how Vanio reads it. Send `false` for the per-rate read — its `roomsToSell` is often 0 for rooms that are on sale.
}

begin
  # Read current Booking.com rates/availability/restrictions
  result = api_instance.get_booking_availability(property_id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->get_booking_availability: #{e}"
end
```

#### Using the get_booking_availability_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BookingAvailabilityStateResponse>, Integer, Hash)> get_booking_availability_with_http_info(property_id, opts)

```ruby
begin
  # Read current Booking.com rates/availability/restrictions
  data, status_code, headers = api_instance.get_booking_availability_with_http_info(property_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BookingAvailabilityStateResponse>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->get_booking_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** | Booking.com hotel/property id. |  |
| **start_date** | **Date** | Window start (ISO YYYY-MM-DD). | [optional] |
| **number_of_days** | **Integer** | Window length in days. | [optional] |
| **room_id** | **String** | Restrict to a single Booking.com room id. | [optional] |
| **room_level** | **Boolean** | Defaults to &#x60;true&#x60;: availability per room, which is how Booking.com keeps inventory and how Vanio reads it. Send &#x60;false&#x60; for the per-rate read — its &#x60;roomsToSell&#x60; is often 0 for rooms that are on sale. | [optional] |

### Return type

[**BookingAvailabilityStateResponse**](BookingAvailabilityStateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_booking_charges

> get_booking_charges(property_id)

Get Booking.com charges

Fetch the extra-charge set (cleaning fee, resort fee, city tax, etc.) configured for a Booking.com property. Pass the Booking.com `property_id` as a query param — required.  `property_id` must be a Booking.com property connected to this workspace (`GET /v1/channels/booking/properties` lists them). Any other id — including one connected to a different workspace — returns `404 not_found`, the same answer as an id that does not exist.  Returns `403 listing_inactive` when any listing mapped to the Booking.com property is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

> get_booking_content(property_id, opts)

Get Booking.com content

Read one kind of content for a Booking.com property, straight from Booking.com.  | `type` | What it is | |---|---| | `photos` | The property's photos. Add `room_id` to read one room's gallery. | | `facilities` | Property facilities, or a room's with `room_id` (Booking.com's ids — `GET` returns them). | | `description` | The property description. Booking.com rewrites what you send into its own multilingual copy; allow about 3 hours to appear. | | `settings` | House rules, pets, children, damage deposit, invoice recipient, booking model. | | `policies` | Cancellation and prepayment policies. | | `licences` | The region's licence rules and the licence on file. | | `checkin_methods` | How guests get in (holiday homes). | | `contacts` | Who Booking.com contacts about the property. |  `amenities` is accepted as another name for `facilities`, and `descriptions` for `description`.  `property_id` must be a Booking.com property connected to this workspace (`GET /v1/channels/booking/properties` lists them). Any other id — including one connected to a different workspace — returns `404 not_found`, the same answer as an id that does not exist.  Returns `403 listing_inactive` when any listing mapped to the Booking.com property is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
property_id = 'property_id_example' # String | Booking.com property id.
opts = {
  type: 'photos', # String | Which content to read.
  room_id: 'room_id_example' # String | A Booking.com room id, for `photos`, `facilities` and `licences`.
}

begin
  # Get Booking.com content
  api_instance.get_booking_content(property_id, opts)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->get_booking_content: #{e}"
end
```

#### Using the get_booking_content_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_booking_content_with_http_info(property_id, opts)

```ruby
begin
  # Get Booking.com content
  data, status_code, headers = api_instance.get_booking_content_with_http_info(property_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->get_booking_content_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** | Booking.com property id. |  |
| **type** | **String** | Which content to read. | [optional][default to &#39;photos&#39;] |
| **room_id** | **String** | A Booking.com room id, for &#x60;photos&#x60;, &#x60;facilities&#x60; and &#x60;licences&#x60;. | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_booking_listing_pricing

> <BookingPricingResponse> get_booking_listing_pricing(id, opts)

Get Booking.com pricing for a listing

Resolves the Repull listing id to its Booking.com `hotel_id` (via the room mapping the Connect flow records for the authenticated workspace), then proxies Booking's `getRoomRateAvailability` for the requested window. Pricing on Booking is per-room/per-rate-plan, so `room_id` and `room_level` flow through query params unchanged.  Mirrors the per-channel `/listings/{id}/pricing` shape used by Airbnb so SDK consumers can carry a Repull listing id across channels. `id` is a Repull listing id, never a Booking.com hotel id — the hotel-id surface is `/v1/channels/booking/availability`.  A listing can be published under several Booking.com properties. GET uses the oldest and reports the rest in `otherHotelIds`; PUT refuses with `409 ambiguous_booking_mapping` rather than push rates into a property it guessed at. `?hotel_id=` names the property explicitly for either.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
id = 56 # Integer | Repull listing id — NOT a Booking.com hotel id. Resolved to a Booking.com hotel id via the workspace mapping.
opts = {
  start_date: Date.parse('2013-10-20'), # Date | 
  number_of_days: 56, # Integer | 
  room_id: 'room_id_example', # String | 
  room_level: true, # Boolean | Defaults to `true`: availability per room, which is how Booking.com keeps inventory and how Vanio reads it. Send `false` for the per-rate read — its `roomsToSell` is often 0 for rooms that are on sale.
  hotel_id: 'hotel_id_example' # String | Booking.com hotel id, when this listing is published under more than one property. Omit it and a read uses the oldest mapping (reporting the rest in `otherHotelIds`), while a write is refused with `409 ambiguous_booking_mapping` rather than guess. `GET /v1/channels/booking/properties` lists the valid ids.
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
| **id** | **Integer** | Repull listing id — NOT a Booking.com hotel id. Resolved to a Booking.com hotel id via the workspace mapping. |  |
| **start_date** | **Date** |  | [optional] |
| **number_of_days** | **Integer** |  | [optional] |
| **room_id** | **String** |  | [optional] |
| **room_level** | **Boolean** | Defaults to &#x60;true&#x60;: availability per room, which is how Booking.com keeps inventory and how Vanio reads it. Send &#x60;false&#x60; for the per-rate read — its &#x60;roomsToSell&#x60; is often 0 for rooms that are on sale. | [optional] |
| **hotel_id** | **String** | Booking.com hotel id, when this listing is published under more than one property. Omit it and a read uses the oldest mapping (reporting the rest in &#x60;otherHotelIds&#x60;), while a write is refused with &#x60;409 ambiguous_booking_mapping&#x60; rather than guess. &#x60;GET /v1/channels/booking/properties&#x60; lists the valid ids. | [optional] |

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

Return the Booking.com connection record(s) for a Repull listing — the linked Booking hotel id, sync flags, markup, sync category, suspension state, and the Booking room the mapping runs through.  `id` is a **Repull listing id**, not a Booking.com hotel id, despite the `properties` segment. (The hotel-id surface is `/v1/channels/booking/availability`.) The mapping is read from wherever the Connect flow recorded it — `listings_booking_rooms` for anything mapped through `POST /v1/connect/booking/map-rooms`, which is essentially every live mapping.  An ARRAY, because one listing can be published under several Booking.com properties at once; `mappedVia` says which record carries each mapping. A listing with no Booking.com mapping returns 404, and the message says which id space the path takes.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
id = 56 # Integer | Repull listing id — NOT a Booking.com hotel id.

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
| **id** | **Integer** | Repull listing id — NOT a Booking.com hotel id. |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_booking_conversations

> <Array<BookingConversation>> list_booking_conversations

List Booking.com conversations

List Booking.com guest conversations. Cursor-paginated. Use the messaging POST to send a reply.  Scoped to this workspace. With `property_id`, the property must be connected to this workspace — any other id returns `404 not_found`. Without it, only messages for this workspace's own Booking.com properties are returned.  Returns `403 listing_inactive` when any listing mapped to the Booking.com property is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

> <Array(<Array<BookingConversation>>, Integer, Hash)> list_booking_conversations_with_http_info

```ruby
begin
  # List Booking.com conversations
  data, status_code, headers = api_instance.list_booking_conversations_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<BookingConversation>>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_conversations_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;BookingConversation&gt;**](BookingConversation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_booking_properties

> <Array<BookingProperty>> list_booking_properties

List Booking.com properties

List every Booking.com property this workspace holds. Each property is returned ONCE, with the Repull listings mapped under it.  A Booking.com property is a building; its rooms are what guests book, and each room is mapped to one Repull listing — so one property routinely carries many listings. `listings[].roomBookingId` is the Booking.com room id an ARI write takes.  A property whose rooms are not mapped yet is still listed, with `mappingStatus: \"unmapped\"` and an empty `listings` array. That is a real mid-onboarding state, not an error: finish `POST /v1/connect/booking/map-rooms` and the listings appear. Such a property used to be dropped silently, which made a mapped-but-unreadable workspace indistinguishable from one with no Booking connection at all.  Inactive listings are left out of `listings`; they keep syncing and reappear once activated. Use `GET /v1/listings?status=inactive` to find them.

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

> <Array(<Array<BookingProperty>>, Integer, Hash)> list_booking_properties_with_http_info

```ruby
begin
  # List Booking.com properties
  data, status_code, headers = api_instance.list_booking_properties_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<BookingProperty>>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_properties_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;BookingProperty&gt;**](BookingProperty.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_booking_property_rooms

> <BookingRoomsRatesResponse> list_booking_property_rooms(id, opts)

List Booking.com rooms + rate-plan ids for a listing

Return every Booking.com room and its rate plans for a listing, each with the `roomId` / `rateId` needed to assemble a restriction write via `PUT /v1/channels/booking/availability`.  `id` is a **Repull listing id**, not a Booking.com hotel id, despite the `properties` segment — resolved to the Booking `hotel_id` through the workspace mapping, read from wherever the Connect flow recorded it (`listings_booking_rooms` for anything mapped through `POST /v1/connect/booking/map-rooms`). A listing with no active Booking.com mapping returns 404, and the message says which id space the path takes. When the listing is published under several properties the oldest is used, the rest come back in `otherHotelIds`, and `?hotel_id=` names a different one. Sourced from Booking's B.XML roomrates feed, which returns rooms and rate plans together (the rooms-unit feed alone omits rate-plan ids). This is the API-key surface for the room/rate ids that were previously only reachable inside the hosted Connect room-mapping flow.  `source` says where the answer came from. `booking` means it was read live just now. If Booking.com returns nothing usable for the property, the rooms and rate plans recorded at the last import are served instead, `source` is `mirror`, and `mirrorReason` names what went wrong live — the ids are Booking.com's own and can be written against, but they can be stale, and `maxPersons`, `policy`, `policyId`, `pricingType` and `isChildRate` come back `null` because only the live feed states them. `rooms` is empty only when Booking.com and the last import both have nothing; a read that failed is an error, never an empty list.  Each rate plan carries `maxPersons` — the party size that rate plan prices, which is the `occupancy` a rate amount must be written at. Each room carries `maxAdults`, Booking.com's capacity for the room, which is what a rate write falls back to when the rate plan states no `maxPersons`.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
id = 56 # Integer | Repull listing id — NOT a Booking.com hotel id. Resolved to a Booking.com hotel id via the workspace mapping.
opts = {
  hotel_id: 'hotel_id_example' # String | Booking.com hotel id, when this listing is published under more than one property. Omit it and a read uses the oldest mapping (reporting the rest in `otherHotelIds`), while a write is refused with `409 ambiguous_booking_mapping` rather than guess. `GET /v1/channels/booking/properties` lists the valid ids.
}

begin
  # List Booking.com rooms + rate-plan ids for a listing
  result = api_instance.list_booking_property_rooms(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_property_rooms: #{e}"
end
```

#### Using the list_booking_property_rooms_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BookingRoomsRatesResponse>, Integer, Hash)> list_booking_property_rooms_with_http_info(id, opts)

```ruby
begin
  # List Booking.com rooms + rate-plan ids for a listing
  data, status_code, headers = api_instance.list_booking_property_rooms_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BookingRoomsRatesResponse>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_property_rooms_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id — NOT a Booking.com hotel id. Resolved to a Booking.com hotel id via the workspace mapping. |  |
| **hotel_id** | **String** | Booking.com hotel id, when this listing is published under more than one property. Omit it and a read uses the oldest mapping (reporting the rest in &#x60;otherHotelIds&#x60;), while a write is refused with &#x60;409 ambiguous_booking_mapping&#x60; rather than guess. &#x60;GET /v1/channels/booking/properties&#x60; lists the valid ids. | [optional] |

### Return type

[**BookingRoomsRatesResponse**](BookingRoomsRatesResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_booking_reservations

> <ListBookingReservations200Response> list_booking_reservations(opts)

List Booking.com reservations

Pull reservations from Booking.com. `type=new` (default) returns un-acknowledged bookings; `type=modified` returns changed bookings. Pass both `reservation_id` and `hotel_id` to fetch a single reservation's full details. Acknowledge processed reservations with the POST so Booking stops re-serving them in the `new` queue.  Scoped to this workspace. `hotel_id` (or its alias `property_id`) must be a property connected to this workspace; any other id returns `404 not_found`, the same as an id that does not exist. Without a hotel, `new`/`modified` cover every Booking.com property this workspace holds (and return `404 not_found` if it holds none). A `reservation_id` that belongs to another workspace returns `404 not_found`.  Returns `403 listing_inactive` when any listing mapped to the Booking.com property is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
  result = api_instance.list_booking_reservations(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->list_booking_reservations: #{e}"
end
```

#### Using the list_booking_reservations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListBookingReservations200Response>, Integer, Hash)> list_booking_reservations_with_http_info(opts)

```ruby
begin
  # List Booking.com reservations
  data, status_code, headers = api_instance.list_booking_reservations_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListBookingReservations200Response>
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

[**ListBookingReservations200Response**](ListBookingReservations200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_booking_reviews

> list_booking_reviews(property_id)

List Booking.com reviews

List guest reviews for a Booking.com property. Pass `property_id` (the Booking.com hotel id) as a query param — required.  `property_id` must be a Booking.com property connected to this workspace (`GET /v1/channels/booking/properties` lists them). Any other id — including one connected to a different workspace — returns `404 not_found`, the same answer as an id that does not exist.  Returns `403 listing_inactive` when any listing mapped to the Booking.com property is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

**Not available through the API — always returns `403 forbidden`.** Booking.com notification subscriptions belong to the Repull platform account that every workspace shares: they are per notification type, not per property, so reading or changing them would affect every workspace. Booking.com events for your own properties are delivered through Repull webhooks — subscribe with `POST /v1/webhooks`.

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


## map_booking_room

> <MapBookingRoomResponse> map_booking_room(map_booking_room_request)

Map a Booking.com room to a Repull listing

Link a Booking.com room to a canonical Repull listing — the API-key equivalent of the room mapping the hosted Connect flow performs, and the counterpart of `POST /v1/channels/airbnb/listings/map`.  Discover `roomBookingId` with `GET /v1/channels/booking/properties/{id}/rooms`, which returns every room of a property with the `roomId` this route takes.  Booking.com attaches at the ROOM level: a property is a building and its rooms are what a guest books, so each room maps to one listing. Pass `listingId: null` to unmap a room and remove its channel link.  The room mapping and its channel link are repointed together in one transaction, so a link can never outlive the mapping it describes — a stale link keeps routing that room's reservations to the previous listing. Re-sending a mapping that is already in place writes nothing (`alreadyMapped: true`).  **The property's reservations are pulled as part of the call.** Once the room is mapped, every active reservation Booking.com holds for the property is imported and attached to its listing — `reservationsImported` says how many were processed. One already present is left as it is, so re-sending never duplicates. You do not need a follow-up call: reservations that arrived before the room was mapped are never picked up by the regular sync, so this is the moment they are brought in. It runs on every successful map, including a re-send, so re-sending retries an import that did not run. If the import cannot run, the mapping still stands and `reservationsImported` is `null`. A property with a long booking history can take tens of seconds. Unmapping pulls nothing.  Unlike the Airbnb route, there is no conflict when the target listing already carries another Booking.com room: one listing served by several rooms is a normal arrangement and is not refused.  Scope is enforced on both sides against your workspace — the room's property and the target listing. A room or listing belonging to another workspace returns the same 404 as one that does not exist.  Returns `403 listing_inactive` when the target listing, or the listing the room is mapped to now, is inactive; nothing is changed.

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
map_booking_room_request = Repull::MapBookingRoomRequest.new({room_booking_id: 'room_booking_id_example', listing_id: 37}) # MapBookingRoomRequest | 

begin
  # Map a Booking.com room to a Repull listing
  result = api_instance.map_booking_room(map_booking_room_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->map_booking_room: #{e}"
end
```

#### Using the map_booking_room_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MapBookingRoomResponse>, Integer, Hash)> map_booking_room_with_http_info(map_booking_room_request)

```ruby
begin
  # Map a Booking.com room to a Repull listing
  data, status_code, headers = api_instance.map_booking_room_with_http_info(map_booking_room_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MapBookingRoomResponse>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->map_booking_room_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **map_booking_room_request** | [**MapBookingRoomRequest**](MapBookingRoomRequest.md) |  |  |

### Return type

[**MapBookingRoomResponse**](MapBookingRoomResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## reply_booking_review

> <ReplyBookingReview200Response> reply_booking_review(reply_booking_review_request)

Reply to Booking.com review

Post a public host reply to a guest review on Booking.com. Booking allows one host reply per review — repeated POSTs are rejected by upstream.  Booking.com does NOT support host-authored reviews of guests via the API (platform-level limitation), so this endpoint is reply-only.  `property_id` must be a Booking.com property connected to this workspace (`GET /v1/channels/booking/properties` lists them). Any other id — including one connected to a different workspace — returns `404 not_found`, the same answer as an id that does not exist.  Returns `403 listing_inactive` when any listing mapped to the Booking.com property is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

> send_booking_message(send_booking_message_request)

Send Booking.com message

Send a text message in a Booking.com conversation as the host. Booking enforces content rules similar to Airbnb.  **Text only.** To send photos, use `POST /v1/conversations/{id}/messages` with `attachments` (JPEG or PNG, up to 10 MB each, with message text) — it uploads the files to Booking.com and records them in the conversation. Passing `attachments`, `attachment_ids` or `mediaUrl` here returns `422 attachments_not_supported` and sends nothing.  `property_id` must be a Booking.com property connected to this workspace (`GET /v1/channels/booking/properties` lists them). Any other id — including one connected to a different workspace — returns `404 not_found`, the same answer as an id that does not exist.  Returns `403 listing_inactive` when any listing mapped to the Booking.com property is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
send_booking_message_request = Repull::SendBookingMessageRequest.new({property_id: 37, conversation_id: 'conversation_id_example', message: 'message_example'}) # SendBookingMessageRequest | 

begin
  # Send Booking.com message
  api_instance.send_booking_message(send_booking_message_request)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->send_booking_message: #{e}"
end
```

#### Using the send_booking_message_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> send_booking_message_with_http_info(send_booking_message_request)

```ruby
begin
  # Send Booking.com message
  data, status_code, headers = api_instance.send_booking_message_with_http_info(send_booking_message_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->send_booking_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **send_booking_message_request** | [**SendBookingMessageRequest**](SendBookingMessageRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_booking_availability

> <BookingPricingUpdateResponse> update_booking_availability(booking_availability_update_request)

Update Booking.com rates/availability

Write rates, availability and restrictions to a Booking.com property. `type` selects the write:  - `rates` — nightly prices, plus any length-of-stay / arrival restrictions sent with them. - `availability` — inventory (`availableRooms`), the stop-sell flag (`closed`), and restrictions. Omit `availableRooms` and `closed` for a restriction-only write. - `derived-pricing` — occupancy-derived pricing rules.  **Dates are inclusive at both ends.** `{ \"start\": \"2026-11-04\", \"end\": \"2026-11-04\" }` is exactly one night.  **A rate amount needs an occupancy.** Booking.com stores the amount against the party size the rate plan prices: sent above that number it declines the price in silence, sent below it it answers 400. Send `occupancy`, or omit it and Repull resolves it from Booking.com's own data and echoes the value and its `source` back in `occupancy[]`. If it cannot be resolved the write is refused with `422` naming `updates[N].occupancy`.  **Restrictions are sent in the same call, on their own wire.** A price and a minimum stay are two writes on Booking.com's side. Send them together and the response reports each separately: `price` and `restrictions` carry their own state, their own read-back, and — when refused — Booking.com's own reason. The top-level `applied` is `partial` when they disagree, so a price that landed is never reported as a failure. `minStay`, `maxStay`, `minStayArrival`, `maxStayArrival`, `closedToArrival` and `closedToDeparture` are written; `exactStayArrival`, `minAdvanceRes` and `maxAdvanceRes` are refused with `422 restriction_not_supported` because Booking.com's notification has no element for them — set those on the rate plan in the Extranet. Nothing you send is ever silently ignored.  **Inventory is not part of a rate update.** `roomsToSell` on a `rates` update returns `422 inventory_not_in_rate_update`; send it as `type: \"availability\"` instead.  **The response says what is known.** Booking.com acknowledges a write with no per-date status, so the nights are read back — prices and restrictions out of the same read: `applied` is `verified`, `mismatch`, `partial`, `rejected` or `unverified` (send `verify: false` to skip the read-back). A bare acknowledgement is never reported as \"all updates applied\". Booking.com stores a 1-night minimum as no minimum, so `minStay: 1` reads back as `0` and still counts as applied.  Restrictions never leak across channels — this endpoint writes only to Booking.com. When Booking.com refuses a write outright, their own reason comes back as `422 booking_rejected` with `booking_ruid`; a genuine outage on their side is `502 booking_error`.  `property_id` must be a Booking.com property connected to this workspace (`GET /v1/channels/booking/properties` lists them). Any other id — including one connected to a different workspace — returns `404 not_found`, the same answer as an id that does not exist.  Returns `403 listing_inactive` when any listing mapped to the Booking.com property is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
booking_availability_update_request = Repull::BookingAvailabilityUpdateRequest.new({type: 'type_example', property_id: nil, updates: [Repull::BookingAvailabilityUpdate.new({room_id: 'room_id_example', rate_id: 'rate_id_example', date_range: Repull::BookingAvailabilityUpdateDateRange.new({start: Date.today, _end: Date.today})})]}) # BookingAvailabilityUpdateRequest | 

begin
  # Update Booking.com rates/availability
  result = api_instance.update_booking_availability(booking_availability_update_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_availability: #{e}"
end
```

#### Using the update_booking_availability_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BookingPricingUpdateResponse>, Integer, Hash)> update_booking_availability_with_http_info(booking_availability_update_request)

```ruby
begin
  # Update Booking.com rates/availability
  data, status_code, headers = api_instance.update_booking_availability_with_http_info(booking_availability_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BookingPricingUpdateResponse>
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **booking_availability_update_request** | [**BookingAvailabilityUpdateRequest**](BookingAvailabilityUpdateRequest.md) |  |  |

### Return type

[**BookingPricingUpdateResponse**](BookingPricingUpdateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_booking_charges

> update_booking_charges(update_booking_charges_request)

Set Booking.com charges

Replace the extra-charge set for a Booking.com property. The body carries the target `property_id` and the full `charges` array — Booking treats the write as a full replacement, so include every charge you want to keep.  `property_id` must be a Booking.com property connected to this workspace (`GET /v1/channels/booking/properties` lists them). Any other id — including one connected to a different workspace — returns `404 not_found`, the same answer as an id that does not exist.  Returns `403 listing_inactive` when any listing mapped to the Booking.com property is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

> update_booking_content(update_booking_content_request)

Update Booking.com content

Write one kind of content to a Booking.com property only. Nothing on the canonical listing or on Airbnb changes. To send the listing's own content to every channel instead, use `PUT /v1/listings/{id}/content` and publish.  | `type` | What it is | |---|---| | `photos` | The property's photos. Add `room_id` to read one room's gallery. | | `facilities` | Property facilities, or a room's with `room_id` (Booking.com's ids — `GET` returns them). | | `description` | The property description. Booking.com rewrites what you send into its own multilingual copy; allow about 3 hours to appear. | | `settings` | House rules, pets, children, damage deposit, invoice recipient, booking model. | | `policies` | Cancellation and prepayment policies. | | `licences` | The region's licence rules and the licence on file. | | `checkin_methods` | How guests get in (holiday homes). | | `contacts` | Who Booking.com contacts about the property. |  `amenities` is accepted as another name for `facilities`, and `descriptions` for `description`.  What each `type` takes:  - `description`: `text`, optional `language` (default `en`). - `facilities`: `facilities: [{ facility_id | room_facility_id, state: \"PRESENT\" | \"MISSING\", instances? }]`. Facilities you do not send stay as they are. - `photos`: `photos: [{ url }]`, uploaded in the background. With `room_id`, send `photo_ids` instead to add photos that have finished processing to that room. - `settings`: `settings: { <block>: {…} }`, for example `{ \"pets\": { \"pets_allowed\": \"PETS_ALLOWED\" } }`. Each block is written separately and reported in `results`. - `policies`: `policyCode` (152 = free cancellation at any time, 1 = non-refundable, …), optional `prepaymentRequired`; add `policyId` to change an existing policy. A property holds at most 7 policies and none can be deleted. - `licences`: `variantId` and `contentData: [{ name, value }]`, from the rules `GET ?type=licences` returns; optional `room_id`. - `checkin_methods`: `methods: [{ checkin_method }]`, using a name from `GET ?type=checkin_methods` `available`. - `contacts`: `contacts: [...]` in Booking.com's contact shape.  If Booking.com refuses the write, the response is `422 booking_rejected` with Booking.com's reason, even when Booking.com answered HTTP 200. Resending the same body will be refused again.  `property_id` must be a Booking.com property connected to this workspace (`GET /v1/channels/booking/properties` lists them). Any other id — including one connected to a different workspace — returns `404 not_found`, the same answer as an id that does not exist.  Returns `403 listing_inactive` when any listing mapped to the Booking.com property is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
update_booking_content_request = Repull::UpdateBookingContentRequest.new({type: 'photos', property_id: 'property_id_example'}) # UpdateBookingContentRequest | 

begin
  # Update Booking.com content
  api_instance.update_booking_content(update_booking_content_request)
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_content: #{e}"
end
```

#### Using the update_booking_content_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_booking_content_with_http_info(update_booking_content_request)

```ruby
begin
  # Update Booking.com content
  data, status_code, headers = api_instance.update_booking_content_with_http_info(update_booking_content_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_content_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **update_booking_content_request** | [**UpdateBookingContentRequest**](UpdateBookingContentRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_booking_listing_pricing

> <BookingPricingUpdateResponse> update_booking_listing_pricing(id, booking_pricing_update_request, opts)

Update Booking.com pricing for a listing

Writes nightly prices for a listing's Booking.com room + rate plan. Each update needs `roomId` + `rateId` + `dateRange` + `price` + `currency`; `dateRange` is inclusive at both ends, so `start` equal to `end` writes exactly one night.  **Occupancy.** Booking.com stores a rate amount against the party size the rate plan prices. Send `occupancy` and that is what is used; omit it and it is resolved from Booking.com's own data for that (room, rate plan) and echoed back in `occupancy[]` with its `source`. When it cannot be resolved the write is refused with `422` naming `updates[N].occupancy` — a price is never sent at a guessed party size, because Booking.com declines such an amount without saying so.  **Inventory is a separate write.** `roomsToSell` on a rate update returns `422 inventory_not_in_rate_update`; use `PUT /v1/channels/booking/availability` with `type: \"availability\"`.  **Restrictions ride along, on their own wire.** Send `restrictions` with the price and Booking.com receives two writes; the response reports each separately in `price` and `restrictions`, each with its own state, read-back and — when refused — Booking.com's own reason. `minStay`, `maxStay`, `minStayArrival`, `maxStayArrival`, `closedToArrival` and `closedToDeparture` are written; `exactStayArrival`, `minAdvanceRes` and `maxAdvanceRes` are refused with `422 restriction_not_supported` (Booking.com's notification has no element for them — set those on the rate plan in the Extranet). Nothing you send is silently ignored.  **The response says what is known.** Booking.com acknowledges a write without per-date status, so the affected nights are read back — prices and restrictions out of the same read — and `applied` reports `verified`, `mismatch`, `partial`, `rejected` or `unverified`. `partial` means one half landed and the other did not, which is never reported as a total failure. Send `verify: false` to skip the read-back; `applied` is then `unverified`. Booking.com stores a 1-night minimum as no minimum, so `minStay: 1` reads back as `0` and still counts as applied.  `id` is a Repull listing id. When it is published under several Booking.com properties this returns `409 ambiguous_booking_mapping` and pushes nothing — name the property with `?hotel_id=` instead.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
id = 56 # Integer | Repull listing id — NOT a Booking.com hotel id.
booking_pricing_update_request = Repull::BookingPricingUpdateRequest.new({updates: [Repull::BookingPricingRateUpdate.new({room_id: 'room_id_example', rate_id: 'rate_id_example', date_range: Repull::BookingPricingRateUpdateDateRange.new({start: Date.today, _end: Date.today}), price: 3.56, currency: 'EUR'})]}) # BookingPricingUpdateRequest | 
opts = {
  hotel_id: 'hotel_id_example' # String | Booking.com hotel id, when this listing is published under more than one property. Omit it and a read uses the oldest mapping (reporting the rest in `otherHotelIds`), while a write is refused with `409 ambiguous_booking_mapping` rather than guess. `GET /v1/channels/booking/properties` lists the valid ids.
}

begin
  # Update Booking.com pricing for a listing
  result = api_instance.update_booking_listing_pricing(id, booking_pricing_update_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->update_booking_listing_pricing: #{e}"
end
```

#### Using the update_booking_listing_pricing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BookingPricingUpdateResponse>, Integer, Hash)> update_booking_listing_pricing_with_http_info(id, booking_pricing_update_request, opts)

```ruby
begin
  # Update Booking.com pricing for a listing
  data, status_code, headers = api_instance.update_booking_listing_pricing_with_http_info(id, booking_pricing_update_request, opts)
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
| **id** | **Integer** | Repull listing id — NOT a Booking.com hotel id. |  |
| **booking_pricing_update_request** | [**BookingPricingUpdateRequest**](BookingPricingUpdateRequest.md) |  |  |
| **hotel_id** | **String** | Booking.com hotel id, when this listing is published under more than one property. Omit it and a read uses the oldest mapping (reporting the rest in &#x60;otherHotelIds&#x60;), while a write is refused with &#x60;409 ambiguous_booking_mapping&#x60; rather than guess. &#x60;GET /v1/channels/booking/properties&#x60; lists the valid ids. | [optional] |

### Return type

[**BookingPricingUpdateResponse**](BookingPricingUpdateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

