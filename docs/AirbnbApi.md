# Repull::AirbnbApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**airbnb_listing_action**](AirbnbApi.md#airbnb_listing_action) | **POST** /v1/channels/airbnb/listings/{id} | Listing action (delete/push/publish) |
| [**airbnb_reservation_action**](AirbnbApi.md#airbnb_reservation_action) | **POST** /v1/channels/airbnb/reservations/{code} | Accept/decline/cancel Airbnb reservation |
| [**create_airbnb_alteration**](AirbnbApi.md#create_airbnb_alteration) | **POST** /v1/channels/airbnb/alterations | Create Airbnb alteration |
| [**create_airbnb_listing_room**](AirbnbApi.md#create_airbnb_listing_room) | **POST** /v1/channels/airbnb/listings/{id}/rooms | Create an Airbnb room |
| [**create_airbnb_offer**](AirbnbApi.md#create_airbnb_offer) | **POST** /v1/channels/airbnb/offers | Create Airbnb special offer or pre-approval |
| [**delete_airbnb_listing_photo**](AirbnbApi.md#delete_airbnb_listing_photo) | **DELETE** /v1/channels/airbnb/listings/{id}/photos | Delete an Airbnb photo |
| [**delete_airbnb_listing_room**](AirbnbApi.md#delete_airbnb_listing_room) | **DELETE** /v1/channels/airbnb/listings/{id}/rooms | Delete an Airbnb room |
| [**edit_airbnb_review**](AirbnbApi.md#edit_airbnb_review) | **PUT** /v1/channels/airbnb/reviews/{id} | Edit Airbnb host review |
| [**get_airbnb_alteration**](AirbnbApi.md#get_airbnb_alteration) | **GET** /v1/channels/airbnb/alterations/{id} | Get Airbnb alteration |
| [**get_airbnb_checkin_guide**](AirbnbApi.md#get_airbnb_checkin_guide) | **GET** /v1/channels/airbnb/listings/{id}/checkin-guide | Get Airbnb check-in guide |
| [**get_airbnb_checkout_guide**](AirbnbApi.md#get_airbnb_checkout_guide) | **GET** /v1/channels/airbnb/listings/{id}/checkout-guide | Get Airbnb checkout guide |
| [**get_airbnb_connection**](AirbnbApi.md#get_airbnb_connection) | **GET** /v1/channels/airbnb/connection | Get Airbnb connection state |
| [**get_airbnb_listing**](AirbnbApi.md#get_airbnb_listing) | **GET** /v1/channels/airbnb/listings/{id} | Get Airbnb listing |
| [**get_airbnb_listing_availability**](AirbnbApi.md#get_airbnb_listing_availability) | **GET** /v1/channels/airbnb/listings/{id}/availability | Get Airbnb availability |
| [**get_airbnb_listing_pricing**](AirbnbApi.md#get_airbnb_listing_pricing) | **GET** /v1/channels/airbnb/listings/{id}/pricing | Get Airbnb pricing |
| [**get_airbnb_listing_quality**](AirbnbApi.md#get_airbnb_listing_quality) | **GET** /v1/channels/airbnb/listings/{id}/quality | Get Airbnb listing quality |
| [**get_airbnb_listing_settings**](AirbnbApi.md#get_airbnb_listing_settings) | **GET** /v1/channels/airbnb/listings/{id}/settings | Get Airbnb listing settings |
| [**get_airbnb_reservation**](AirbnbApi.md#get_airbnb_reservation) | **GET** /v1/channels/airbnb/reservations/{code} | Get Airbnb reservation |
| [**get_airbnb_thread**](AirbnbApi.md#get_airbnb_thread) | **GET** /v1/channels/airbnb/messaging/{threadId} | Get Airbnb thread |
| [**list_airbnb_alterations**](AirbnbApi.md#list_airbnb_alterations) | **GET** /v1/channels/airbnb/alterations | List Airbnb alterations |
| [**list_airbnb_listing_amenities**](AirbnbApi.md#list_airbnb_listing_amenities) | **GET** /v1/channels/airbnb/listings/{id}/amenities | List Airbnb amenities |
| [**list_airbnb_listing_descriptions**](AirbnbApi.md#list_airbnb_listing_descriptions) | **GET** /v1/channels/airbnb/listings/{id}/descriptions | List Airbnb descriptions |
| [**list_airbnb_listing_photos**](AirbnbApi.md#list_airbnb_listing_photos) | **GET** /v1/channels/airbnb/listings/{id}/photos | List Airbnb photos |
| [**list_airbnb_listing_rooms**](AirbnbApi.md#list_airbnb_listing_rooms) | **GET** /v1/channels/airbnb/listings/{id}/rooms | List Airbnb rooms |
| [**list_airbnb_listings**](AirbnbApi.md#list_airbnb_listings) | **GET** /v1/channels/airbnb/listings | List Airbnb listings |
| [**list_airbnb_reservations**](AirbnbApi.md#list_airbnb_reservations) | **GET** /v1/channels/airbnb/reservations | List Airbnb reservations |
| [**list_airbnb_reviews**](AirbnbApi.md#list_airbnb_reviews) | **GET** /v1/channels/airbnb/reviews | List Airbnb reviews |
| [**list_airbnb_thread_messages**](AirbnbApi.md#list_airbnb_thread_messages) | **GET** /v1/channels/airbnb/messaging/{threadId}/messages | Get Airbnb messages |
| [**list_airbnb_threads**](AirbnbApi.md#list_airbnb_threads) | **GET** /v1/channels/airbnb/messaging | List Airbnb message threads |
| [**list_airbnb_transactions**](AirbnbApi.md#list_airbnb_transactions) | **GET** /v1/channels/airbnb/transactions | List Airbnb transactions |
| [**map_airbnb_listing**](AirbnbApi.md#map_airbnb_listing) | **POST** /v1/channels/airbnb/listings/map | Map an Airbnb listing to a Repull listing |
| [**respond_airbnb_review**](AirbnbApi.md#respond_airbnb_review) | **POST** /v1/channels/airbnb/reviews/{id}/respond | Respond to Airbnb review |
| [**respond_airbnb_review_legacy**](AirbnbApi.md#respond_airbnb_review_legacy) | **POST** /v1/channels/airbnb/reviews | Respond to / submit Airbnb review (legacy) |
| [**send_airbnb_message**](AirbnbApi.md#send_airbnb_message) | **POST** /v1/channels/airbnb/messaging/{threadId}/messages | Send Airbnb message |
| [**update_airbnb_checkin_guide**](AirbnbApi.md#update_airbnb_checkin_guide) | **PUT** /v1/channels/airbnb/listings/{id}/checkin-guide | Upsert Airbnb check-in guide |
| [**update_airbnb_listing_availability**](AirbnbApi.md#update_airbnb_listing_availability) | **PUT** /v1/channels/airbnb/listings/{id}/availability | Update Airbnb availability |
| [**update_airbnb_listing_pricing**](AirbnbApi.md#update_airbnb_listing_pricing) | **PUT** /v1/channels/airbnb/listings/{id}/pricing | Update Airbnb pricing |
| [**update_airbnb_message**](AirbnbApi.md#update_airbnb_message) | **PATCH** /v1/channels/airbnb/messaging/{threadId}/messages/{messageId} | Edit / react to / mark an Airbnb message |
| [**upload_airbnb_listing_photos**](AirbnbApi.md#upload_airbnb_listing_photos) | **POST** /v1/channels/airbnb/listings/{id}/photos | Upload photos to Airbnb |
| [**withdraw_airbnb_offer**](AirbnbApi.md#withdraw_airbnb_offer) | **DELETE** /v1/channels/airbnb/offers | Withdraw Airbnb special offer |


## airbnb_listing_action

> airbnb_listing_action(id, opts)

Listing action (delete/push/publish)

Apply a state action to a listing by id. The path `id` is the canonical Repull listing id.  `delete` is a **deactivate of the Repull record only** — it sets the listing inactive and KEEPS the row; it does NOT touch the upstream Airbnb listing (Repull never deletes or deactivates on Airbnb's side). Use it to exclude a listing / trim back under the plan-listings cap; reactivate via `PATCH /v1/listings/{id}` with `{ \"active\": true }`. Idempotent.  `push` / `publish` push the listing's content to Airbnb via the same host-side sync orchestrator as `POST /v1/listings/{id}/publish/airbnb` — pass `airbnbConnectionId` to update an already-mapped Airbnb listing, or `hostId` to create + publish a new one under that host. `force` re-pushes every field, ignoring dirty-field tracking.  Any other action (e.g. `pull`, `unlist`) returns a structured 422 naming the supported actions.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 
opts = {
  airbnb_listing_action_request: Repull::AirbnbListingActionRequest.new({action: 'action_example'}) # AirbnbListingActionRequest | 
}

begin
  # Listing action (delete/push/publish)
  api_instance.airbnb_listing_action(id, opts)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_listing_action: #{e}"
end
```

#### Using the airbnb_listing_action_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> airbnb_listing_action_with_http_info(id, opts)

```ruby
begin
  # Listing action (delete/push/publish)
  data, status_code, headers = api_instance.airbnb_listing_action_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_listing_action_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **airbnb_listing_action_request** | [**AirbnbListingActionRequest**](AirbnbListingActionRequest.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## airbnb_reservation_action

> airbnb_reservation_action(code)

Accept/decline/cancel Airbnb reservation

Apply a state action to an Airbnb reservation — `accept` / `decline` (for inquiries and reservation requests), `cancel` (host cancellation, carries penalties), `pre-approve` (for inquiries).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
code = 'code_example' # String | 

begin
  # Accept/decline/cancel Airbnb reservation
  api_instance.airbnb_reservation_action(code)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_reservation_action: #{e}"
end
```

#### Using the airbnb_reservation_action_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> airbnb_reservation_action_with_http_info(code)

```ruby
begin
  # Accept/decline/cancel Airbnb reservation
  data, status_code, headers = api_instance.airbnb_reservation_action_with_http_info(code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_reservation_action_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## create_airbnb_alteration

> create_airbnb_alteration(create_airbnb_alteration_request)

Create Airbnb alteration

Create a reservation alteration request (change dates, guest count, or price) on Airbnb. **Write-side** — calls Airbnb upstream. Requires a connected Airbnb host for the workspace, else `404 no_connection`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
create_airbnb_alteration_request = Repull::CreateAirbnbAlterationRequest.new({confirmation_code: 'confirmation_code_example'}) # CreateAirbnbAlterationRequest | 

begin
  # Create Airbnb alteration
  api_instance.create_airbnb_alteration(create_airbnb_alteration_request)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_alteration: #{e}"
end
```

#### Using the create_airbnb_alteration_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_airbnb_alteration_with_http_info(create_airbnb_alteration_request)

```ruby
begin
  # Create Airbnb alteration
  data, status_code, headers = api_instance.create_airbnb_alteration_with_http_info(create_airbnb_alteration_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_alteration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_airbnb_alteration_request** | [**CreateAirbnbAlterationRequest**](CreateAirbnbAlterationRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_airbnb_listing_room

> create_airbnb_listing_room(id, request_body)

Create an Airbnb room

Create a new room on an Airbnb listing. **Write-side** — calls Airbnb upstream. Body is the full room object minus `room_id`. Requires a connected Airbnb host, else `404 no_connection`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Repull listing id (numeric string).
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Create an Airbnb room
  api_instance.create_airbnb_listing_room(id, request_body)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_listing_room: #{e}"
end
```

#### Using the create_airbnb_listing_room_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_airbnb_listing_room_with_http_info(id, request_body)

```ruby
begin
  # Create an Airbnb room
  data, status_code, headers = api_instance.create_airbnb_listing_room_with_http_info(id, request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_listing_room_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_airbnb_offer

> create_airbnb_offer(create_airbnb_offer_request)

Create Airbnb special offer or pre-approval

Create a special offer or a pre-approval on Airbnb. **Write-side** — calls Airbnb upstream. The `type` discriminator selects the flavour:  - `offer` — a special offer with custom terms (the remaining body fields are the offer params). - `preapproval` — pre-approve an inquiry thread (requires `threadId`; optional `blockInstantBooking`).  Requires a connected Airbnb host, else `404 no_connection`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
create_airbnb_offer_request = Repull::CreateAirbnbOfferRequest.new({type: 'offer'}) # CreateAirbnbOfferRequest | 

begin
  # Create Airbnb special offer or pre-approval
  api_instance.create_airbnb_offer(create_airbnb_offer_request)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_offer: #{e}"
end
```

#### Using the create_airbnb_offer_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_airbnb_offer_with_http_info(create_airbnb_offer_request)

```ruby
begin
  # Create Airbnb special offer or pre-approval
  data, status_code, headers = api_instance.create_airbnb_offer_with_http_info(create_airbnb_offer_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_offer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_airbnb_offer_request** | [**CreateAirbnbOfferRequest**](CreateAirbnbOfferRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_airbnb_listing_photo

> <DeleteAirbnbListingPhoto200Response> delete_airbnb_listing_photo(id, photo_id)

Delete an Airbnb photo

Remove a single photo from an Airbnb listing. Pass the Airbnb-side photo id as `?photoId=`. Write-side — calls Airbnb upstream; the local photo cache is reconciled by the sync worker afterwards.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 
photo_id = 'photo_id_example' # String | Airbnb-side photo id to delete.

begin
  # Delete an Airbnb photo
  result = api_instance.delete_airbnb_listing_photo(id, photo_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->delete_airbnb_listing_photo: #{e}"
end
```

#### Using the delete_airbnb_listing_photo_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DeleteAirbnbListingPhoto200Response>, Integer, Hash)> delete_airbnb_listing_photo_with_http_info(id, photo_id)

```ruby
begin
  # Delete an Airbnb photo
  data, status_code, headers = api_instance.delete_airbnb_listing_photo_with_http_info(id, photo_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DeleteAirbnbListingPhoto200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->delete_airbnb_listing_photo_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **photo_id** | **String** | Airbnb-side photo id to delete. |  |

### Return type

[**DeleteAirbnbListingPhoto200Response**](DeleteAirbnbListingPhoto200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_airbnb_listing_room

> <DeleteAirbnbListingPhoto200Response> delete_airbnb_listing_room(id, room_id)

Delete an Airbnb room

Delete a room from an Airbnb listing. **Write-side** — calls Airbnb upstream. Pass the Airbnb-side room id as `?roomId=`. Requires a connected Airbnb host, else `404 no_connection`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Repull listing id (numeric string).
room_id = 'room_id_example' # String | Airbnb-side room id to delete.

begin
  # Delete an Airbnb room
  result = api_instance.delete_airbnb_listing_room(id, room_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->delete_airbnb_listing_room: #{e}"
end
```

#### Using the delete_airbnb_listing_room_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DeleteAirbnbListingPhoto200Response>, Integer, Hash)> delete_airbnb_listing_room_with_http_info(id, room_id)

```ruby
begin
  # Delete an Airbnb room
  data, status_code, headers = api_instance.delete_airbnb_listing_room_with_http_info(id, room_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DeleteAirbnbListingPhoto200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->delete_airbnb_listing_room_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **room_id** | **String** | Airbnb-side room id to delete. |  |

### Return type

[**DeleteAirbnbListingPhoto200Response**](DeleteAirbnbListingPhoto200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## edit_airbnb_review

> <AirbnbReview> edit_airbnb_review(id, airbnb_review)

Edit Airbnb host review

Edit a host-side review for an Airbnb stay. Airbnb collapses POST + PUT into the same upstream call (`PUT /v2/listing_reviews/{id}`), so this endpoint covers both initial submit and subsequent edits while the review window is open.  Body is a partial `AirbnbReview` — pass the fields you want to change (rating, public review, private feedback, category ratings).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Airbnb review id (`HRabc123` style).
airbnb_review = Repull::AirbnbReview.new # AirbnbReview | 

begin
  # Edit Airbnb host review
  result = api_instance.edit_airbnb_review(id, airbnb_review)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->edit_airbnb_review: #{e}"
end
```

#### Using the edit_airbnb_review_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReview>, Integer, Hash)> edit_airbnb_review_with_http_info(id, airbnb_review)

```ruby
begin
  # Edit Airbnb host review
  data, status_code, headers = api_instance.edit_airbnb_review_with_http_info(id, airbnb_review)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReview>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->edit_airbnb_review_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb review id (&#x60;HRabc123&#x60; style). |  |
| **airbnb_review** | [**AirbnbReview**](AirbnbReview.md) |  |  |

### Return type

[**AirbnbReview**](AirbnbReview.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_airbnb_alteration

> <GetAirbnbAlteration200Response> get_airbnb_alteration(id)

Get Airbnb alteration

Fetch a single Airbnb reservation alteration by its Airbnb alteration id. **Pure DB read**, workspace-scoped via the reservations join. Returns `404 not_found` when no alteration matches the id in your workspace.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Airbnb alteration id.

begin
  # Get Airbnb alteration
  result = api_instance.get_airbnb_alteration(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_alteration: #{e}"
end
```

#### Using the get_airbnb_alteration_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAirbnbAlteration200Response>, Integer, Hash)> get_airbnb_alteration_with_http_info(id)

```ruby
begin
  # Get Airbnb alteration
  data, status_code, headers = api_instance.get_airbnb_alteration_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbAlteration200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_alteration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb alteration id. |  |

### Return type

[**GetAirbnbAlteration200Response**](GetAirbnbAlteration200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_checkin_guide

> <ListAirbnbTransactions200Response> get_airbnb_checkin_guide(id, opts)

Get Airbnb check-in guide

Return every published locale variant of an Airbnb listing's check-in guide. **Pure DB read** from `listings_airbnb_check_in_guides`. Pass `?locale=en` to filter to one locale (prefix match). Returns `404` when the listing has no Airbnb connection in this workspace.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Repull listing id (numeric string).
opts = {
  locale: 'en' # String | Filter to a single locale (prefix match, case-insensitive).
}

begin
  # Get Airbnb check-in guide
  result = api_instance.get_airbnb_checkin_guide(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_checkin_guide: #{e}"
end
```

#### Using the get_airbnb_checkin_guide_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAirbnbTransactions200Response>, Integer, Hash)> get_airbnb_checkin_guide_with_http_info(id, opts)

```ruby
begin
  # Get Airbnb check-in guide
  data, status_code, headers = api_instance.get_airbnb_checkin_guide_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAirbnbTransactions200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_checkin_guide_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **locale** | **String** | Filter to a single locale (prefix match, case-insensitive). | [optional] |

### Return type

[**ListAirbnbTransactions200Response**](ListAirbnbTransactions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_checkout_guide

> <ListAirbnbTransactions200Response> get_airbnb_checkout_guide(id)

Get Airbnb checkout guide

Return the checkout tasks an Airbnb listing shows guests at departure. **Pure DB read** from `listings_airbnb_checkout_tasks`. Returns `404` when the listing has no Airbnb connection in this workspace.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Repull listing id (numeric string).

begin
  # Get Airbnb checkout guide
  result = api_instance.get_airbnb_checkout_guide(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_checkout_guide: #{e}"
end
```

#### Using the get_airbnb_checkout_guide_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAirbnbTransactions200Response>, Integer, Hash)> get_airbnb_checkout_guide_with_http_info(id)

```ruby
begin
  # Get Airbnb checkout guide
  data, status_code, headers = api_instance.get_airbnb_checkout_guide_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAirbnbTransactions200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_checkout_guide_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |

### Return type

[**ListAirbnbTransactions200Response**](ListAirbnbTransactions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_connection

> <AirbnbConnectionResponse> get_airbnb_connection

Get Airbnb connection state

Returns the workspace's Airbnb host connection state in one envelope. Use this instead of inferring connection health from per-listing 401s on `GET /v1/channels/airbnb/listings` — that's noisy (every per-listing call has to fail before you know) and ambiguous (a single 5xx looks identical to a deauth).  Pure DB read — does NOT touch Airbnb's API, so it's cheap to poll from a status-page surface.  The response includes one row per Airbnb host the workspace has linked. Each row carries `isConnected`, `lastSyncedAt`, `deactivatedAt`, and `lastDisconnectReason` (most recent non-backfill row in `airbnb_host_events`).  A self-serve `fixUrl` is included whenever `status` is anything other than `connected` — points at the dashboard where the host re-authorizes (or initiates the first OAuth flow for `never_connected` workspaces).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new

begin
  # Get Airbnb connection state
  result = api_instance.get_airbnb_connection
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_connection: #{e}"
end
```

#### Using the get_airbnb_connection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbConnectionResponse>, Integer, Hash)> get_airbnb_connection_with_http_info

```ruby
begin
  # Get Airbnb connection state
  data, status_code, headers = api_instance.get_airbnb_connection_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbConnectionResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_connection_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AirbnbConnectionResponse**](AirbnbConnectionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_listing

> <AirbnbListing> get_airbnb_listing(id, opts)

Get Airbnb listing

Fetch all Airbnb connection rows for a single Vanio listing id. A property may be linked from multiple Airbnb hosts — every match is returned. Pass `?include=amenities` to enrich each row with its current Airbnb amenities.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 
opts = {
  include: 'amenities' # String | Comma-separated expansions. Currently supported: `amenities`.
}

begin
  # Get Airbnb listing
  result = api_instance.get_airbnb_listing(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing: #{e}"
end
```

#### Using the get_airbnb_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbListing>, Integer, Hash)> get_airbnb_listing_with_http_info(id, opts)

```ruby
begin
  # Get Airbnb listing
  data, status_code, headers = api_instance.get_airbnb_listing_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbListing>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **include** | **String** | Comma-separated expansions. Currently supported: &#x60;amenities&#x60;. | [optional] |

### Return type

[**AirbnbListing**](AirbnbListing.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_listing_availability

> get_airbnb_listing_availability(id)

Get Airbnb availability

Read the per-day availability calendar for an Airbnb listing. Returns one row per day including price overrides, min-stay, and blocked status.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 

begin
  # Get Airbnb availability
  api_instance.get_airbnb_listing_availability(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_availability: #{e}"
end
```

#### Using the get_airbnb_listing_availability_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_airbnb_listing_availability_with_http_info(id)

```ruby
begin
  # Get Airbnb availability
  data, status_code, headers = api_instance.get_airbnb_listing_availability_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_airbnb_listing_pricing

> get_airbnb_listing_pricing(id)

Get Airbnb pricing

Read the current pricing config (base price, weekend uplift, length-of-stay discounts, smart-pricing bounds) for an Airbnb listing.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 

begin
  # Get Airbnb pricing
  api_instance.get_airbnb_listing_pricing(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_pricing: #{e}"
end
```

#### Using the get_airbnb_listing_pricing_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_airbnb_listing_pricing_with_http_info(id)

```ruby
begin
  # Get Airbnb pricing
  data, status_code, headers = api_instance.get_airbnb_listing_pricing_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_airbnb_listing_quality

> <GetAirbnbListingQuality200Response> get_airbnb_listing_quality(id, opts)

Get Airbnb listing quality

Return an Airbnb listing's quality signals — standards, reservation issues, and monthly quality stats. **Pure DB read** from the local quality mirrors. Scope the response with `?type=all|standards|issues|stats` (default `all`, which returns `{ standards, issues }`). Returns `404` when the listing has no Airbnb connection in this workspace.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Repull listing id (numeric string).
opts = {
  type: 'all' # String | Which quality slice to return. `all` returns `{ standards, issues }`.
}

begin
  # Get Airbnb listing quality
  result = api_instance.get_airbnb_listing_quality(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_quality: #{e}"
end
```

#### Using the get_airbnb_listing_quality_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAirbnbListingQuality200Response>, Integer, Hash)> get_airbnb_listing_quality_with_http_info(id, opts)

```ruby
begin
  # Get Airbnb listing quality
  data, status_code, headers = api_instance.get_airbnb_listing_quality_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbListingQuality200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_quality_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **type** | **String** | Which quality slice to return. &#x60;all&#x60; returns &#x60;{ standards, issues }&#x60;. | [optional][default to &#39;all&#39;] |

### Return type

[**GetAirbnbListingQuality200Response**](GetAirbnbListingQuality200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_listing_settings

> <GetAirbnbListingSettings200Response> get_airbnb_listing_settings(id, opts)

Get Airbnb listing settings

Return an Airbnb listing's host roles, published locales, and regulatory permits. **Pure DB read** — host roles from `listings_airbnb_details.host_roles`, locales from distinct `listings_airbnb_descriptions.locale`, permits from `listings_airbnb_permits`. Scope with `?type=all|hosts|permits|locales` (default `all`, which returns `{ hosts, locales }`). Returns `404` when the listing has no Airbnb connection in this workspace.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Repull listing id (numeric string).
opts = {
  type: 'all' # String | Which settings slice to return. `all` returns `{ hosts, locales }`.
}

begin
  # Get Airbnb listing settings
  result = api_instance.get_airbnb_listing_settings(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_settings: #{e}"
end
```

#### Using the get_airbnb_listing_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAirbnbListingSettings200Response>, Integer, Hash)> get_airbnb_listing_settings_with_http_info(id, opts)

```ruby
begin
  # Get Airbnb listing settings
  data, status_code, headers = api_instance.get_airbnb_listing_settings_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbListingSettings200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_settings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **type** | **String** | Which settings slice to return. &#x60;all&#x60; returns &#x60;{ hosts, locales }&#x60;. | [optional][default to &#39;all&#39;] |

### Return type

[**GetAirbnbListingSettings200Response**](GetAirbnbListingSettings200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_reservation

> <AirbnbReservation> get_airbnb_reservation(code)

Get Airbnb reservation

Fetch a single Airbnb reservation by Airbnb confirmation code (e.g. `HMABCDEF12`).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
code = 'code_example' # String | 

begin
  # Get Airbnb reservation
  result = api_instance.get_airbnb_reservation(code)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_reservation: #{e}"
end
```

#### Using the get_airbnb_reservation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReservation>, Integer, Hash)> get_airbnb_reservation_with_http_info(code)

```ruby
begin
  # Get Airbnb reservation
  data, status_code, headers = api_instance.get_airbnb_reservation_with_http_info(code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReservation>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_reservation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** |  |  |

### Return type

[**AirbnbReservation**](AirbnbReservation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_thread

> <GetAirbnbThread200Response> get_airbnb_thread(thread_id)

Get Airbnb thread

Fetch a single Airbnb message thread by its Airbnb thread id. **Pure DB read** from the local `message_threads` mirror, workspace-scoped. Returns `404 not_found` when no thread matches. For the messages within a thread use `GET /v1/channels/airbnb/messaging/{threadId}/messages`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
thread_id = 'thread_id_example' # String | Airbnb thread id (matches the external thread id).

begin
  # Get Airbnb thread
  result = api_instance.get_airbnb_thread(thread_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_thread: #{e}"
end
```

#### Using the get_airbnb_thread_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAirbnbThread200Response>, Integer, Hash)> get_airbnb_thread_with_http_info(thread_id)

```ruby
begin
  # Get Airbnb thread
  data, status_code, headers = api_instance.get_airbnb_thread_with_http_info(thread_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbThread200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_thread_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **thread_id** | **String** | Airbnb thread id (matches the external thread id). |  |

### Return type

[**GetAirbnbThread200Response**](GetAirbnbThread200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_alterations

> <ListAirbnbAlterations200Response> list_airbnb_alterations(opts)

List Airbnb alterations

List reservation alteration requests for Airbnb reservations in this workspace. **Pure DB read** from the local `reservation_alterations` mirror — never calls Airbnb upstream — scoped to your workspace via the reservations join.  Default returns only pending alterations; pass `?type=all` for the full history. Filter to a single reservation with `?reservation_code=<confirmation code>`. Every response carries the `data_freshness` envelope.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
opts = {
  type: 'pending', # String | Scope: `pending` (default) returns only alterations awaiting a decision; `all` returns every alteration.
  reservation_code: 'reservation_code_example' # String | Airbnb confirmation code — restricts results to a single reservation. Returns an empty array when no reservation matches within your workspace.
}

begin
  # List Airbnb alterations
  result = api_instance.list_airbnb_alterations(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_alterations: #{e}"
end
```

#### Using the list_airbnb_alterations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAirbnbAlterations200Response>, Integer, Hash)> list_airbnb_alterations_with_http_info(opts)

```ruby
begin
  # List Airbnb alterations
  data, status_code, headers = api_instance.list_airbnb_alterations_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAirbnbAlterations200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_alterations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Scope: &#x60;pending&#x60; (default) returns only alterations awaiting a decision; &#x60;all&#x60; returns every alteration. | [optional][default to &#39;pending&#39;] |
| **reservation_code** | **String** | Airbnb confirmation code — restricts results to a single reservation. Returns an empty array when no reservation matches within your workspace. | [optional] |

### Return type

[**ListAirbnbAlterations200Response**](ListAirbnbAlterations200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_listing_amenities

> <ListAirbnbListingAmenities200Response> list_airbnb_listing_amenities(id)

List Airbnb amenities

List an Airbnb listing's amenities. **Pure DB read** from the local `listings_airbnb_amenities` cache — never calls Airbnb upstream. The response splits amenities into `amenities` (regular) and `accessibility_amenities` (step-free access, wide doorways, grab rails, disabled parking, wheelchair, accessible-height fixtures, hoists, etc). Both are arrays (`[]` when none). Consult `data_freshness` to disambiguate \"never synced\" from \"fresh and genuinely empty\". Returns `404` when the listing has no Airbnb connection in this workspace.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Repull listing id (numeric string).

begin
  # List Airbnb amenities
  result = api_instance.list_airbnb_listing_amenities(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_amenities: #{e}"
end
```

#### Using the list_airbnb_listing_amenities_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAirbnbListingAmenities200Response>, Integer, Hash)> list_airbnb_listing_amenities_with_http_info(id)

```ruby
begin
  # List Airbnb amenities
  data, status_code, headers = api_instance.list_airbnb_listing_amenities_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAirbnbListingAmenities200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_amenities_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |

### Return type

[**ListAirbnbListingAmenities200Response**](ListAirbnbListingAmenities200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_listing_descriptions

> <ListAirbnbTransactions200Response> list_airbnb_listing_descriptions(id, opts)

List Airbnb descriptions

List an Airbnb listing's per-locale content (name, summary, house rules, etc). **Pure DB read** from `listings_airbnb_descriptions`. Filter to one locale with `?locale=en` (the legacy `?country=` param is accepted as a soft alias). Returns `404` when the listing has no Airbnb connection in this workspace.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Repull listing id (numeric string).
opts = {
  locale: 'en', # String | Filter to a single locale (prefix match, case-insensitive).
  country: 'country_example' # String | Legacy alias for `locale`. Prefer `locale`.
}

begin
  # List Airbnb descriptions
  result = api_instance.list_airbnb_listing_descriptions(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_descriptions: #{e}"
end
```

#### Using the list_airbnb_listing_descriptions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAirbnbTransactions200Response>, Integer, Hash)> list_airbnb_listing_descriptions_with_http_info(id, opts)

```ruby
begin
  # List Airbnb descriptions
  data, status_code, headers = api_instance.list_airbnb_listing_descriptions_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAirbnbTransactions200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_descriptions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **locale** | **String** | Filter to a single locale (prefix match, case-insensitive). | [optional] |
| **country** | **String** | Legacy alias for &#x60;locale&#x60;. Prefer &#x60;locale&#x60;. | [optional] |

### Return type

[**ListAirbnbTransactions200Response**](ListAirbnbTransactions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_listing_photos

> list_airbnb_listing_photos(id)

List Airbnb photos

List photos attached to an Airbnb listing in display order. Returns the public CDN URL plus Airbnb-side metadata (id, caption, room).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 

begin
  # List Airbnb photos
  api_instance.list_airbnb_listing_photos(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_photos: #{e}"
end
```

#### Using the list_airbnb_listing_photos_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> list_airbnb_listing_photos_with_http_info(id)

```ruby
begin
  # List Airbnb photos
  data, status_code, headers = api_instance.list_airbnb_listing_photos_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_photos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## list_airbnb_listing_rooms

> <ListAirbnbTransactions200Response> list_airbnb_listing_rooms(id)

List Airbnb rooms

List the rooms configured on an Airbnb listing, ordered by room number. **Pure DB read** from `listings_airbnb_rooms`. Returns `404` when the listing has no Airbnb connection in this workspace.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Repull listing id (numeric string).

begin
  # List Airbnb rooms
  result = api_instance.list_airbnb_listing_rooms(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_rooms: #{e}"
end
```

#### Using the list_airbnb_listing_rooms_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAirbnbTransactions200Response>, Integer, Hash)> list_airbnb_listing_rooms_with_http_info(id)

```ruby
begin
  # List Airbnb rooms
  data, status_code, headers = api_instance.list_airbnb_listing_rooms_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAirbnbTransactions200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_rooms_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |

### Return type

[**ListAirbnbTransactions200Response**](ListAirbnbTransactions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_listings

> <AirbnbListingListResponse> list_airbnb_listings(opts)

List Airbnb listings

List every Airbnb listing this workspace has access to via the connected Airbnb account. **Pure DB read — never calls Airbnb upstream.** The connect flow is what populates the local cache; the API serves what's already there. Customers with a disconnected host still see their last-synced data, with the top-level `data_freshness` envelope flagging the staleness and pointing at the reconnect URL.  Pass `?include=amenities` to enrich each connection with its locally-cached amenity set. Returns `null` per connection when the cache is empty.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
opts = {
  include: 'amenities' # String | Comma-separated expansions. Currently supported: `amenities` (adds `amenities` and `accessibility_amenities` arrays to each connection, sourced from the local `listings_airbnb_amenities` cache).
}

begin
  # List Airbnb listings
  result = api_instance.list_airbnb_listings(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listings: #{e}"
end
```

#### Using the list_airbnb_listings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbListingListResponse>, Integer, Hash)> list_airbnb_listings_with_http_info(opts)

```ruby
begin
  # List Airbnb listings
  data, status_code, headers = api_instance.list_airbnb_listings_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbListingListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **include** | **String** | Comma-separated expansions. Currently supported: &#x60;amenities&#x60; (adds &#x60;amenities&#x60; and &#x60;accessibility_amenities&#x60; arrays to each connection, sourced from the local &#x60;listings_airbnb_amenities&#x60; cache). | [optional] |

### Return type

[**AirbnbListingListResponse**](AirbnbListingListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_reservations

> <AirbnbReservationListResponse> list_airbnb_reservations(opts)

List Airbnb reservations

Cursor-paginated list of reservations sourced directly from Airbnb. Use this when you need Airbnb-specific fields (guest payout split, cancellation policy snapshot) that the unified `/v1/reservations` endpoint flattens away.  Walk pages with `?cursor=<pagination.next_cursor>` until `pagination.has_more` is `false`. The cursor is opaque — never construct or parse it client-side.  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`. Internally this walks upstream Airbnb cursor pages to skip rows, so deep offsets cost N/limit upstream round-trips; cursor remains the better choice for deep pagination.  When `status` is omitted, all statuses are returned (Airbnb defaults to `accepted` only on its own surface, but this endpoint normalises to \"all\"). Pass `?status=accepted` to scope.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
opts = {
  cursor: 'cursor_example', # String | Opaque cursor returned by the previous response's `pagination.next_cursor`. Omit to fetch the first page.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.next_cursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  limit: 56, # Integer | Max items per page. Hard cap is 100.
  listing_id: 'listing_id_example', # String | Filter to one Airbnb listing id (numeric string).
  status: 'pending', # String | Filter by reservation status. Omit to receive all statuses.
  start_date: Date.parse('2013-10-20'), # Date | ISO 8601 (YYYY-MM-DD) lower bound on Airbnb's date range filter.
  end_date: Date.parse('2013-10-20'), # Date | ISO 8601 (YYYY-MM-DD) upper bound on Airbnb's date range filter.
  include_total: true # Boolean | Whether to include `pagination.total`. Always populated when Airbnb returns a total count (effectively always); accepted for shape symmetry with the rest of the API.
}

begin
  # List Airbnb reservations
  result = api_instance.list_airbnb_reservations(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_reservations: #{e}"
end
```

#### Using the list_airbnb_reservations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReservationListResponse>, Integer, Hash)> list_airbnb_reservations_with_http_info(opts)

```ruby
begin
  # List Airbnb reservations
  data, status_code, headers = api_instance.list_airbnb_reservations_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReservationListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_reservations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cursor** | **String** | Opaque cursor returned by the previous response&#39;s &#x60;pagination.next_cursor&#x60;. Omit to fetch the first page. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.next_cursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **limit** | **Integer** | Max items per page. Hard cap is 100. | [optional][default to 50] |
| **listing_id** | **String** | Filter to one Airbnb listing id (numeric string). | [optional] |
| **status** | **String** | Filter by reservation status. Omit to receive all statuses. | [optional] |
| **start_date** | **Date** | ISO 8601 (YYYY-MM-DD) lower bound on Airbnb&#39;s date range filter. | [optional] |
| **end_date** | **Date** | ISO 8601 (YYYY-MM-DD) upper bound on Airbnb&#39;s date range filter. | [optional] |
| **include_total** | **Boolean** | Whether to include &#x60;pagination.total&#x60;. Always populated when Airbnb returns a total count (effectively always); accepted for shape symmetry with the rest of the API. | [optional][default to true] |

### Return type

[**AirbnbReservationListResponse**](AirbnbReservationListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_reviews

> <AirbnbReviewListResponse> list_airbnb_reviews

List Airbnb reviews

List reviews left by guests on Airbnb listings in this workspace. Includes both reviews of the host and reviews of the guest (where the host has not yet submitted theirs).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new

begin
  # List Airbnb reviews
  result = api_instance.list_airbnb_reviews
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_reviews: #{e}"
end
```

#### Using the list_airbnb_reviews_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReviewListResponse>, Integer, Hash)> list_airbnb_reviews_with_http_info

```ruby
begin
  # List Airbnb reviews
  data, status_code, headers = api_instance.list_airbnb_reviews_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReviewListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_reviews_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AirbnbReviewListResponse**](AirbnbReviewListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_thread_messages

> <MessageListResponse> list_airbnb_thread_messages(thread_id)

Get Airbnb messages

Fetch the full message log for an Airbnb thread, ordered oldest-to-newest. Walk pages with `?cursor=` until `pagination.hasMore` is `false`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
thread_id = 'thread_id_example' # String | 

begin
  # Get Airbnb messages
  result = api_instance.list_airbnb_thread_messages(thread_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_thread_messages: #{e}"
end
```

#### Using the list_airbnb_thread_messages_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MessageListResponse>, Integer, Hash)> list_airbnb_thread_messages_with_http_info(thread_id)

```ruby
begin
  # Get Airbnb messages
  data, status_code, headers = api_instance.list_airbnb_thread_messages_with_http_info(thread_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MessageListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_thread_messages_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **thread_id** | **String** |  |  |

### Return type

[**MessageListResponse**](MessageListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_threads

> <AirbnbThreadListResponse> list_airbnb_threads

List Airbnb message threads

List Airbnb message threads (one per guest conversation). Cursor-paginated. Each thread includes a preview of the latest message.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new

begin
  # List Airbnb message threads
  result = api_instance.list_airbnb_threads
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_threads: #{e}"
end
```

#### Using the list_airbnb_threads_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbThreadListResponse>, Integer, Hash)> list_airbnb_threads_with_http_info

```ruby
begin
  # List Airbnb message threads
  data, status_code, headers = api_instance.list_airbnb_threads_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbThreadListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_threads_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AirbnbThreadListResponse**](AirbnbThreadListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_transactions

> <ListAirbnbTransactions200Response> list_airbnb_transactions

List Airbnb transactions

List Airbnb host transactions (payouts, adjustments, resolutions) for this workspace. **Pure DB read** — customer-facing reads never call Airbnb upstream. The transactions mirror is not yet synced into this surface, so today this endpoint returns an empty array with `data_freshness.stale = true` and `reason: \"never_synced\"`. Shape and contract are stable; the array populates once the sync worker lands.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new

begin
  # List Airbnb transactions
  result = api_instance.list_airbnb_transactions
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_transactions: #{e}"
end
```

#### Using the list_airbnb_transactions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAirbnbTransactions200Response>, Integer, Hash)> list_airbnb_transactions_with_http_info

```ruby
begin
  # List Airbnb transactions
  data, status_code, headers = api_instance.list_airbnb_transactions_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAirbnbTransactions200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_transactions_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListAirbnbTransactions200Response**](ListAirbnbTransactions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## map_airbnb_listing

> <MapAirbnbListingResponse> map_airbnb_listing(map_airbnb_listing_request)

Map an Airbnb listing to a Repull listing

Link an existing Airbnb listing to a canonical Repull listing/property. **API-key-scoped** (unlike the Booking room mapping, which is Connect-session-scoped).  Discover the `airbnbId` (+ `hostId`) via `GET /v1/channels/airbnb/listings`, then re-point it at the `listingId` of your choice — the dedup / consolidation case where the Airbnb sync auto-created its own listing but you want the inventory under an existing property.  Repoints both the Airbnb record and its platform link to the target listing in one transaction. Idempotent — re-mapping to the same listing is a 200 no-op (`alreadyMapped: true`). Scope is enforced against your workspace on both the target listing and the existing Airbnb record; a listing that already links a different Airbnb listing returns 409.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
map_airbnb_listing_request = Repull::MapAirbnbListingRequest.new({airbnb_id: 'airbnb_id_example', listing_id: 37}) # MapAirbnbListingRequest | 

begin
  # Map an Airbnb listing to a Repull listing
  result = api_instance.map_airbnb_listing(map_airbnb_listing_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->map_airbnb_listing: #{e}"
end
```

#### Using the map_airbnb_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MapAirbnbListingResponse>, Integer, Hash)> map_airbnb_listing_with_http_info(map_airbnb_listing_request)

```ruby
begin
  # Map an Airbnb listing to a Repull listing
  data, status_code, headers = api_instance.map_airbnb_listing_with_http_info(map_airbnb_listing_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MapAirbnbListingResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->map_airbnb_listing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **map_airbnb_listing_request** | [**MapAirbnbListingRequest**](MapAirbnbListingRequest.md) |  |  |

### Return type

[**MapAirbnbListingResponse**](MapAirbnbListingResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## respond_airbnb_review

> <AirbnbReview> respond_airbnb_review(id, respond_airbnb_review_request)

Respond to Airbnb review

Post a public host response to a guest review. Airbnb allows one response per review — repeated POSTs return 409. Response text is capped at 1000 characters.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Airbnb review id.
respond_airbnb_review_request = Repull::RespondAirbnbReviewRequest.new({response: 'response_example'}) # RespondAirbnbReviewRequest | 

begin
  # Respond to Airbnb review
  result = api_instance.respond_airbnb_review(id, respond_airbnb_review_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->respond_airbnb_review: #{e}"
end
```

#### Using the respond_airbnb_review_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReview>, Integer, Hash)> respond_airbnb_review_with_http_info(id, respond_airbnb_review_request)

```ruby
begin
  # Respond to Airbnb review
  data, status_code, headers = api_instance.respond_airbnb_review_with_http_info(id, respond_airbnb_review_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReview>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->respond_airbnb_review_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb review id. |  |
| **respond_airbnb_review_request** | [**RespondAirbnbReviewRequest**](RespondAirbnbReviewRequest.md) |  |  |

### Return type

[**AirbnbReview**](AirbnbReview.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## respond_airbnb_review_legacy

> respond_airbnb_review_legacy

Respond to / submit Airbnb review (legacy)

Legacy action-based shape. Body `{ action: \"respond\"|\"submit\", reviewId, response?, review? }`. Kept for backwards compatibility — prefer `PUT /v1/channels/airbnb/reviews/{id}` (edit) and `POST /v1/channels/airbnb/reviews/{id}/respond` (reply) for new integrations.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new

begin
  # Respond to / submit Airbnb review (legacy)
  api_instance.respond_airbnb_review_legacy
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->respond_airbnb_review_legacy: #{e}"
end
```

#### Using the respond_airbnb_review_legacy_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> respond_airbnb_review_legacy_with_http_info

```ruby
begin
  # Respond to / submit Airbnb review (legacy)
  data, status_code, headers = api_instance.respond_airbnb_review_legacy_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->respond_airbnb_review_legacy_with_http_info: #{e}"
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


## send_airbnb_message

> send_airbnb_message(thread_id)

Send Airbnb message

Send a message in an Airbnb thread as the host. Airbnb enforces content rules (no off-platform contact info, no external URLs) — violating messages are rejected upstream and surface as `airbnb_error`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
thread_id = 'thread_id_example' # String | 

begin
  # Send Airbnb message
  api_instance.send_airbnb_message(thread_id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->send_airbnb_message: #{e}"
end
```

#### Using the send_airbnb_message_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> send_airbnb_message_with_http_info(thread_id)

```ruby
begin
  # Send Airbnb message
  data, status_code, headers = api_instance.send_airbnb_message_with_http_info(thread_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->send_airbnb_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **thread_id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## update_airbnb_checkin_guide

> update_airbnb_checkin_guide(id, opts)

Upsert Airbnb check-in guide

Upsert the check-in guide for one locale on an Airbnb listing. **Write-side** — calls Airbnb upstream; the DB mirror is reconciled by the sync worker once the upstream call returns. Target the locale with `?locale=en` (defaults to `en`). Requires a connected Airbnb host, else `404 no_connection`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Repull listing id (numeric string).
opts = {
  locale: 'locale_example' # String | Locale to upsert. Defaults to `en`.
}

begin
  # Upsert Airbnb check-in guide
  api_instance.update_airbnb_checkin_guide(id, opts)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_checkin_guide: #{e}"
end
```

#### Using the update_airbnb_checkin_guide_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_airbnb_checkin_guide_with_http_info(id, opts)

```ruby
begin
  # Upsert Airbnb check-in guide
  data, status_code, headers = api_instance.update_airbnb_checkin_guide_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_checkin_guide_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **locale** | **String** | Locale to upsert. Defaults to &#x60;en&#x60;. | [optional][default to &#39;en&#39;] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_airbnb_listing_availability

> update_airbnb_listing_availability(id, airbnb_availability_write_request)

Update Airbnb availability

Push availability + restrictions to Airbnb. `type: \"calendar\"` writes per-date restrictions — min/max nights, closed-to-arrival, closed-to-departure, and stop-sell (`availability: \"unavailable\"`) — via a batch of operations that each target either a date range or an explicit date list. `type: \"rules\"` writes listing-level availability rules (default min/max nights, booking lead time, turnover days, seasonal/day-of-week min nights). Restrictions never leak across channels — this endpoint writes only to Airbnb.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 
airbnb_availability_write_request = Repull::AirbnbAvailabilityWriteRequest.new({type: 'type_example'}) # AirbnbAvailabilityWriteRequest | 

begin
  # Update Airbnb availability
  api_instance.update_airbnb_listing_availability(id, airbnb_availability_write_request)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_availability: #{e}"
end
```

#### Using the update_airbnb_listing_availability_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_airbnb_listing_availability_with_http_info(id, airbnb_availability_write_request)

```ruby
begin
  # Update Airbnb availability
  data, status_code, headers = api_instance.update_airbnb_listing_availability_with_http_info(id, airbnb_availability_write_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **airbnb_availability_write_request** | [**AirbnbAvailabilityWriteRequest**](AirbnbAvailabilityWriteRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## update_airbnb_listing_pricing

> update_airbnb_listing_pricing(id, airbnb_pricing_write_request)

Update Airbnb pricing

Push pricing changes to Airbnb. The `type` discriminator selects the sub-resource (model, standard settings, LOS, rate-plan, fees, currency, rule, or per-date `calendar`). `type: \"calendar\"` carries the full per-date restriction set — nightly price, min/max nights, closed-to-arrival, closed-to-departure, and stop-sell (`availability: \"unavailable\"`). For settings sub-resources the full object is replaced — GET first, mutate locally, then PUT the whole object.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 
airbnb_pricing_write_request = Repull::AirbnbPricingWriteRequest.new({type: 'type_example'}) # AirbnbPricingWriteRequest | 

begin
  # Update Airbnb pricing
  api_instance.update_airbnb_listing_pricing(id, airbnb_pricing_write_request)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_pricing: #{e}"
end
```

#### Using the update_airbnb_listing_pricing_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_airbnb_listing_pricing_with_http_info(id, airbnb_pricing_write_request)

```ruby
begin
  # Update Airbnb pricing
  data, status_code, headers = api_instance.update_airbnb_listing_pricing_with_http_info(id, airbnb_pricing_write_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **airbnb_pricing_write_request** | [**AirbnbPricingWriteRequest**](AirbnbPricingWriteRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## update_airbnb_message

> update_airbnb_message(thread_id, message_id, update_airbnb_message_request)

Edit / react to / mark an Airbnb message

Act on a single message in an Airbnb thread. **Write-side** — calls Airbnb upstream. The `action` discriminator selects the operation:  - `edit` — replace message text (requires `message`). - `unsend` — retract the message. - `read` — mark the message as read. - `react` — add a reaction (requires `reaction`).  Requires a connected Airbnb host, else `404 no_connection`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
thread_id = 'thread_id_example' # String | Airbnb thread id.
message_id = 'message_id_example' # String | Airbnb message id within the thread.
update_airbnb_message_request = Repull::UpdateAirbnbMessageRequest.new({action: 'edit'}) # UpdateAirbnbMessageRequest | 

begin
  # Edit / react to / mark an Airbnb message
  api_instance.update_airbnb_message(thread_id, message_id, update_airbnb_message_request)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_message: #{e}"
end
```

#### Using the update_airbnb_message_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_airbnb_message_with_http_info(thread_id, message_id, update_airbnb_message_request)

```ruby
begin
  # Edit / react to / mark an Airbnb message
  data, status_code, headers = api_instance.update_airbnb_message_with_http_info(thread_id, message_id, update_airbnb_message_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **thread_id** | **String** | Airbnb thread id. |  |
| **message_id** | **String** | Airbnb message id within the thread. |  |
| **update_airbnb_message_request** | [**UpdateAirbnbMessageRequest**](UpdateAirbnbMessageRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## upload_airbnb_listing_photos

> upload_airbnb_listing_photos(id)

Upload photos to Airbnb

Upload one or more photos to an Airbnb listing. Accepts public image URLs (Airbnb fetches them) — direct binary upload is not supported on this endpoint.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 

begin
  # Upload photos to Airbnb
  api_instance.upload_airbnb_listing_photos(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->upload_airbnb_listing_photos: #{e}"
end
```

#### Using the upload_airbnb_listing_photos_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> upload_airbnb_listing_photos_with_http_info(id)

```ruby
begin
  # Upload photos to Airbnb
  data, status_code, headers = api_instance.upload_airbnb_listing_photos_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->upload_airbnb_listing_photos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## withdraw_airbnb_offer

> withdraw_airbnb_offer(offer_id)

Withdraw Airbnb special offer

Withdraw a previously-created Airbnb special offer. **Write-side** — calls Airbnb upstream. Pass the offer id as `?offerId=`. Requires a connected Airbnb host, else `404 no_connection`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
offer_id = 'offer_id_example' # String | Airbnb special-offer id to withdraw.

begin
  # Withdraw Airbnb special offer
  api_instance.withdraw_airbnb_offer(offer_id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->withdraw_airbnb_offer: #{e}"
end
```

#### Using the withdraw_airbnb_offer_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> withdraw_airbnb_offer_with_http_info(offer_id)

```ruby
begin
  # Withdraw Airbnb special offer
  data, status_code, headers = api_instance.withdraw_airbnb_offer_with_http_info(offer_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->withdraw_airbnb_offer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offer_id** | **String** | Airbnb special-offer id to withdraw. |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

