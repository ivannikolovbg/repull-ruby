# Repull::AirbnbApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**accept_airbnb_alteration**](AirbnbApi.md#accept_airbnb_alteration) | **POST** /v1/channels/airbnb/alterations/{id}/accept | Accept Airbnb alteration |
| [**airbnb_listing_action**](AirbnbApi.md#airbnb_listing_action) | **POST** /v1/channels/airbnb/listings/{id} | Listing action (delete/push/publish/unlist/relist) |
| [**airbnb_reservation_action**](AirbnbApi.md#airbnb_reservation_action) | **POST** /v1/channels/airbnb/reservations/{code} | Accept, decline or cancel an Airbnb reservation |
| [**cancel_airbnb_alteration**](AirbnbApi.md#cancel_airbnb_alteration) | **POST** /v1/channels/airbnb/alterations/{id}/cancel | Cancel Airbnb alteration |
| [**create_airbnb_alteration**](AirbnbApi.md#create_airbnb_alteration) | **POST** /v1/channels/airbnb/alterations | Create Airbnb alteration |
| [**create_airbnb_listing_room**](AirbnbApi.md#create_airbnb_listing_room) | **POST** /v1/channels/airbnb/listings/{id}/rooms | Create an Airbnb room |
| [**create_airbnb_offer**](AirbnbApi.md#create_airbnb_offer) | **POST** /v1/channels/airbnb/offers | Create Airbnb special offer or pre-approval |
| [**decline_airbnb_alteration**](AirbnbApi.md#decline_airbnb_alteration) | **POST** /v1/channels/airbnb/alterations/{id}/decline | Decline Airbnb alteration |
| [**delete_airbnb_listing_photo**](AirbnbApi.md#delete_airbnb_listing_photo) | **DELETE** /v1/channels/airbnb/listings/{id}/photos | Delete an Airbnb photo |
| [**delete_airbnb_listing_room**](AirbnbApi.md#delete_airbnb_listing_room) | **DELETE** /v1/channels/airbnb/listings/{id}/rooms | Delete an Airbnb room |
| [**edit_airbnb_review**](AirbnbApi.md#edit_airbnb_review) | **PUT** /v1/channels/airbnb/reviews/{id} | Edit Airbnb host review |
| [**get_airbnb_alteration**](AirbnbApi.md#get_airbnb_alteration) | **GET** /v1/channels/airbnb/alterations/{id} | Get Airbnb alteration |
| [**get_airbnb_booking_settings**](AirbnbApi.md#get_airbnb_booking_settings) | **GET** /v1/channels/airbnb/listings/{id}/booking-settings | Get Airbnb booking settings |
| [**get_airbnb_checkin_guide**](AirbnbApi.md#get_airbnb_checkin_guide) | **GET** /v1/channels/airbnb/listings/{id}/checkin-guide | Get Airbnb check-in guide |
| [**get_airbnb_checkout_guide**](AirbnbApi.md#get_airbnb_checkout_guide) | **GET** /v1/channels/airbnb/listings/{id}/checkout-guide | Get Airbnb checkout guide |
| [**get_airbnb_connection**](AirbnbApi.md#get_airbnb_connection) | **GET** /v1/channels/airbnb/connection | Get Airbnb connection state |
| [**get_airbnb_listing**](AirbnbApi.md#get_airbnb_listing) | **GET** /v1/channels/airbnb/listings/{id} | Get Airbnb listing |
| [**get_airbnb_listing_availability**](AirbnbApi.md#get_airbnb_listing_availability) | **GET** /v1/channels/airbnb/listings/{id}/availability | Get Airbnb availability |
| [**get_airbnb_listing_details**](AirbnbApi.md#get_airbnb_listing_details) | **GET** /v1/channels/airbnb/listings/{id}/details | Get Airbnb listing details |
| [**get_airbnb_listing_pricing**](AirbnbApi.md#get_airbnb_listing_pricing) | **GET** /v1/channels/airbnb/listings/{id}/pricing | Get Airbnb pricing |
| [**get_airbnb_listing_quality**](AirbnbApi.md#get_airbnb_listing_quality) | **GET** /v1/channels/airbnb/listings/{id}/quality | Get Airbnb listing quality |
| [**get_airbnb_listing_settings**](AirbnbApi.md#get_airbnb_listing_settings) | **GET** /v1/channels/airbnb/listings/{id}/settings | Get Airbnb listing settings |
| [**get_airbnb_offer**](AirbnbApi.md#get_airbnb_offer) | **GET** /v1/channels/airbnb/offers | Get Airbnb special offer |
| [**get_airbnb_reservation**](AirbnbApi.md#get_airbnb_reservation) | **GET** /v1/channels/airbnb/reservations/{code} | Get Airbnb reservation |
| [**get_airbnb_thread**](AirbnbApi.md#get_airbnb_thread) | **GET** /v1/channels/airbnb/messaging/{threadId} | Get Airbnb thread |
| [**list_airbnb_alterations**](AirbnbApi.md#list_airbnb_alterations) | **GET** /v1/channels/airbnb/alterations | List Airbnb alterations |
| [**list_airbnb_listing_amenities**](AirbnbApi.md#list_airbnb_listing_amenities) | **GET** /v1/channels/airbnb/listings/{id}/amenities | List Airbnb amenities |
| [**list_airbnb_listing_descriptions**](AirbnbApi.md#list_airbnb_listing_descriptions) | **GET** /v1/channels/airbnb/listings/{id}/descriptions | List Airbnb descriptions |
| [**list_airbnb_listing_permits**](AirbnbApi.md#list_airbnb_listing_permits) | **GET** /v1/channels/airbnb/listings/{id}/permits | List Airbnb permits and licences |
| [**list_airbnb_listing_photos**](AirbnbApi.md#list_airbnb_listing_photos) | **GET** /v1/channels/airbnb/listings/{id}/photos | List Airbnb photos |
| [**list_airbnb_listing_rooms**](AirbnbApi.md#list_airbnb_listing_rooms) | **GET** /v1/channels/airbnb/listings/{id}/rooms | List Airbnb rooms |
| [**list_airbnb_listing_safety_disclosures**](AirbnbApi.md#list_airbnb_listing_safety_disclosures) | **GET** /v1/channels/airbnb/listings/{id}/safety-disclosures | List guest-safety disclosures |
| [**list_airbnb_listings**](AirbnbApi.md#list_airbnb_listings) | **GET** /v1/channels/airbnb/listings | List Airbnb listings |
| [**list_airbnb_reservations**](AirbnbApi.md#list_airbnb_reservations) | **GET** /v1/channels/airbnb/reservations | List Airbnb reservations |
| [**list_airbnb_reviews**](AirbnbApi.md#list_airbnb_reviews) | **GET** /v1/channels/airbnb/reviews | List Airbnb reviews |
| [**list_airbnb_thread_messages**](AirbnbApi.md#list_airbnb_thread_messages) | **GET** /v1/channels/airbnb/messaging/{threadId}/messages | Get Airbnb messages |
| [**list_airbnb_threads**](AirbnbApi.md#list_airbnb_threads) | **GET** /v1/channels/airbnb/messaging | List Airbnb message threads |
| [**list_airbnb_transactions**](AirbnbApi.md#list_airbnb_transactions) | **GET** /v1/channels/airbnb/transactions | List Airbnb transactions |
| [**map_airbnb_listing**](AirbnbApi.md#map_airbnb_listing) | **POST** /v1/channels/airbnb/listings/map | Map an Airbnb listing to a Repull listing |
| [**reorder_airbnb_listing_photos**](AirbnbApi.md#reorder_airbnb_listing_photos) | **PUT** /v1/channels/airbnb/listings/{id}/photos/order | Reorder the Airbnb photo tour |
| [**respond_airbnb_review**](AirbnbApi.md#respond_airbnb_review) | **POST** /v1/channels/airbnb/reviews/{id}/respond | Respond to Airbnb review |
| [**respond_airbnb_review_legacy**](AirbnbApi.md#respond_airbnb_review_legacy) | **POST** /v1/channels/airbnb/reviews | Respond to / submit Airbnb review (legacy) |
| [**send_airbnb_message**](AirbnbApi.md#send_airbnb_message) | **POST** /v1/channels/airbnb/messaging/{threadId}/messages | Send Airbnb message |
| [**set_airbnb_listing_cover_photo**](AirbnbApi.md#set_airbnb_listing_cover_photo) | **PUT** /v1/channels/airbnb/listings/{id}/photos/cover | Set the Airbnb cover photo |
| [**sync_airbnb_transactions**](AirbnbApi.md#sync_airbnb_transactions) | **POST** /v1/channels/airbnb/transactions | Sync Airbnb transactions |
| [**update_airbnb_booking_settings**](AirbnbApi.md#update_airbnb_booking_settings) | **PUT** /v1/channels/airbnb/listings/{id}/booking-settings | Update Airbnb booking settings |
| [**update_airbnb_checkin_guide**](AirbnbApi.md#update_airbnb_checkin_guide) | **PUT** /v1/channels/airbnb/listings/{id}/checkin-guide | Upsert Airbnb check-in guide |
| [**update_airbnb_listing_amenities**](AirbnbApi.md#update_airbnb_listing_amenities) | **PUT** /v1/channels/airbnb/listings/{id}/amenities | Update Airbnb amenities |
| [**update_airbnb_listing_availability**](AirbnbApi.md#update_airbnb_listing_availability) | **PUT** /v1/channels/airbnb/listings/{id}/availability | Update Airbnb availability |
| [**update_airbnb_listing_description**](AirbnbApi.md#update_airbnb_listing_description) | **PUT** /v1/channels/airbnb/listings/{id}/descriptions | Update an Airbnb description for one locale |
| [**update_airbnb_listing_details**](AirbnbApi.md#update_airbnb_listing_details) | **PUT** /v1/channels/airbnb/listings/{id}/details | Update property type, room type, quiet hours or check-in method |
| [**update_airbnb_listing_permits**](AirbnbApi.md#update_airbnb_listing_permits) | **PUT** /v1/channels/airbnb/listings/{id}/permits | Answer Airbnb permit questions |
| [**update_airbnb_listing_photo**](AirbnbApi.md#update_airbnb_listing_photo) | **PATCH** /v1/channels/airbnb/listings/{id}/photos | Update an Airbnb photo |
| [**update_airbnb_listing_pricing**](AirbnbApi.md#update_airbnb_listing_pricing) | **PUT** /v1/channels/airbnb/listings/{id}/pricing | Update Airbnb pricing |
| [**update_airbnb_listing_room**](AirbnbApi.md#update_airbnb_listing_room) | **PUT** /v1/channels/airbnb/listings/{id}/rooms | Update an Airbnb room |
| [**update_airbnb_listing_safety_disclosures**](AirbnbApi.md#update_airbnb_listing_safety_disclosures) | **PUT** /v1/channels/airbnb/listings/{id}/safety-disclosures | Update guest-safety disclosures |
| [**update_airbnb_message**](AirbnbApi.md#update_airbnb_message) | **PATCH** /v1/channels/airbnb/messaging/{threadId}/messages/{messageId} | Edit / react to / mark an Airbnb message |
| [**upload_airbnb_listing_photos**](AirbnbApi.md#upload_airbnb_listing_photos) | **POST** /v1/channels/airbnb/listings/{id}/photos | Upload photos to Airbnb |
| [**withdraw_airbnb_offer**](AirbnbApi.md#withdraw_airbnb_offer) | **DELETE** /v1/channels/airbnb/offers | Withdraw Airbnb special offer |


## accept_airbnb_alteration

> accept_airbnb_alteration(id, opts)

Accept Airbnb alteration

Accept a pending Airbnb reservation alteration. **Write-side** — calls Airbnb upstream (`respondToAlteration`) to approve the proposed date / guest-count / price change. Requires a connected Airbnb host for the workspace (else `404 no_connection`) and that the alteration id belongs to a reservation in your workspace (else `404 not_found`). No request body is required.  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
id = 'id_example' # String | Airbnb alteration id (the `alterationId` from a `GET /v1/channels/airbnb/alterations` row).
opts = {
  body: { ... } # Object | 
}

begin
  # Accept Airbnb alteration
  api_instance.accept_airbnb_alteration(id, opts)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->accept_airbnb_alteration: #{e}"
end
```

#### Using the accept_airbnb_alteration_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> accept_airbnb_alteration_with_http_info(id, opts)

```ruby
begin
  # Accept Airbnb alteration
  data, status_code, headers = api_instance.accept_airbnb_alteration_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->accept_airbnb_alteration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb alteration id (the &#x60;alterationId&#x60; from a &#x60;GET /v1/channels/airbnb/alterations&#x60; row). |  |
| **body** | **Object** |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## airbnb_listing_action

> <AirbnbListingAction200Response> airbnb_listing_action(id, opts)

Listing action (delete/push/publish/unlist/relist)

Apply a state action to a listing by id. The path `id` is the canonical Repull listing id.  **`delete` here never touches Airbnb. Read this before you call it.**  | | `action: \"delete\"` (this endpoint) | `action: \"unlist\"` (this endpoint) | |---|---|---| | What it changes | The Repull record | The live Airbnb listing | | Calls Airbnb | **No. Never.** | Yes | | The guest-facing listing | Stays live and keeps taking bookings | **Goes down** and stops taking bookings | | Billing and plan limits | No longer billed, no longer counts toward the cap | Unchanged | | API access to the listing | `403 listing_inactive` until reactivated | Unchanged — you can still read and write it | | Reverse it with | `PATCH /v1/listings/{id}` `{ \"active\": true }` | `action: \"relist\"` | | Data kept | Yes, and it keeps syncing | Yes |  Neither one deletes anything on Airbnb. **There is no endpoint on this API that deletes an Airbnb listing** — the word `delete` on this route means \"deactivate the Repull record\" and nothing else. (Main vanio's internal listing-sync layer has a same-named action that DOES hard-delete on Airbnb; it is not exposed here, by any endpoint, deliberately. If you have read that code, note that the two names do not mean the same thing.)  `delete` is idempotent. To take a listing off the market on every channel at once — Airbnb and Booking.com together — use `POST /v1/listings/{id}/offline`.  `unlist` calls Airbnb and **takes the live listing down**: it is deactivated with a valid deactivation reason and then READ BACK, so \"Airbnb accepted the call but the listing is still live\" is reported as a failure rather than a success. Requires `airbnbConnectionId` — a listing can be connected to more than one Airbnb listing, and taking down the wrong one is not undoable through this API. `relist` puts it back up (re-enables sync and makes the listing available again); it does not push content.  `relist` goes through the channel-publish billing gate and `unlist` does not, so on a workspace whose subscription has lapsed a listing can be taken down and not put back until billing is sorted out. That refusal comes back as `402` with the action that fixes it — never as an Airbnb error, because retrying and reconnecting Airbnb do nothing for it.  `push` / `publish` push the listing's content to Airbnb via the same host-side sync orchestrator as `POST /v1/listings/{id}/publish/airbnb` — pass `airbnbConnectionId` to update an already-mapped Airbnb listing, or `hostId` to create + publish a new one under that host. `force` re-pushes every field, ignoring dirty-field tracking. The result is per-section: see `AirbnbPublishResult`.  Any other action (e.g. `pull`) returns a structured 422 naming the supported actions.  Returns `403 listing_inactive` for `push`/`publish`/`unlist`/`relist` when the listing is inactive. `delete` (deactivation) is always accepted.

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
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31', # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
  airbnb_listing_action_request: Repull::AirbnbListingActionRequest.new({action: 'action_example'}) # AirbnbListingActionRequest | 
}

begin
  # Listing action (delete/push/publish/unlist/relist)
  result = api_instance.airbnb_listing_action(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_listing_action: #{e}"
end
```

#### Using the airbnb_listing_action_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbListingAction200Response>, Integer, Hash)> airbnb_listing_action_with_http_info(id, opts)

```ruby
begin
  # Listing action (delete/push/publish/unlist/relist)
  data, status_code, headers = api_instance.airbnb_listing_action_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbListingAction200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_listing_action_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |
| **airbnb_listing_action_request** | [**AirbnbListingActionRequest**](AirbnbListingActionRequest.md) |  | [optional] |

### Return type

[**AirbnbListingAction200Response**](AirbnbListingAction200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## airbnb_reservation_action

> <AirbnbReservationAction200Response> airbnb_reservation_action(code, airbnb_reservation_action_request, opts)

Accept, decline or cancel an Airbnb reservation

Act on an Airbnb reservation by its Airbnb confirmation code. **Write-side** — calls Airbnb upstream, as the Airbnb account that owns the booking.  - `accept` — accept a pending booking request. - `decline` — decline a pending booking request. Requires `reason` (one of Airbnb's decline reasons) and `message` (sent to the guest, at most 500 characters). - `cancel` — cancel a confirmed booking as the host. Requires `reason` (one of Airbnb's host-cancellation reasons). **Host cancellations carry Airbnb penalties.**  The body is validated before anything reaches Airbnb; unknown fields are refused. There is no `pre-approve` action: a pre-approval answers an inquiry, which has no confirmation code — use `POST /v1/conversations/{id}/pre-approval`. For accept/decline, `POST /v1/reservations/{id}/accept` and `/decline` do the same by Repull id and keep the reservation in Repull in sync.  Airbnb refusals are mapped rather than returned as a 500: a request that already moved on is `409 request_no_longer_pending` (do not retry), an expired one `409 request_expired`, any other refusal `422 airbnb_rejected` with Airbnb's reason.  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.  Send `Idempotency-Key` to make a retry safe.

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
code = 'code_example' # String | Airbnb confirmation code, e.g. `HM9J2MFR3W`.
airbnb_reservation_action_request = Repull::AirbnbReservationActionRequest.new({action: 'accept'}) # AirbnbReservationActionRequest | 
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Accept, decline or cancel an Airbnb reservation
  result = api_instance.airbnb_reservation_action(code, airbnb_reservation_action_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_reservation_action: #{e}"
end
```

#### Using the airbnb_reservation_action_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReservationAction200Response>, Integer, Hash)> airbnb_reservation_action_with_http_info(code, airbnb_reservation_action_request, opts)

```ruby
begin
  # Accept, decline or cancel an Airbnb reservation
  data, status_code, headers = api_instance.airbnb_reservation_action_with_http_info(code, airbnb_reservation_action_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReservationAction200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_reservation_action_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | Airbnb confirmation code, e.g. &#x60;HM9J2MFR3W&#x60;. |  |
| **airbnb_reservation_action_request** | [**AirbnbReservationActionRequest**](AirbnbReservationActionRequest.md) |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**AirbnbReservationAction200Response**](AirbnbReservationAction200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## cancel_airbnb_alteration

> cancel_airbnb_alteration(id, opts)

Cancel Airbnb alteration

Withdraw an alteration you proposed, before the other side has answered it. **Write-side** — calls Airbnb upstream (`respondToAlteration` with status `canceled`). Use this when you sent the wrong dates, guest count, price or listing: the alteration stops being pending instead of sitting there until the guest acts on it.  This is the third of Airbnb's three answers to a pending alteration, alongside `accept` and `decline`, and behaves identically to them: requires a connected Airbnb host for the workspace (else `404 no_connection`) and that the alteration id belongs to a reservation in your workspace (else `404 not_found`). No request body is required.  Airbnb decides whether an alteration can still be withdrawn — one that has already been accepted or declined is refused upstream, and Airbnb's own reason comes back in `message`.  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
id = 'id_example' # String | Airbnb alteration id (the `alterationId` from a `GET /v1/channels/airbnb/alterations` row).
opts = {
  body: { ... } # Object | 
}

begin
  # Cancel Airbnb alteration
  api_instance.cancel_airbnb_alteration(id, opts)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->cancel_airbnb_alteration: #{e}"
end
```

#### Using the cancel_airbnb_alteration_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> cancel_airbnb_alteration_with_http_info(id, opts)

```ruby
begin
  # Cancel Airbnb alteration
  data, status_code, headers = api_instance.cancel_airbnb_alteration_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->cancel_airbnb_alteration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb alteration id (the &#x60;alterationId&#x60; from a &#x60;GET /v1/channels/airbnb/alterations&#x60; row). |  |
| **body** | **Object** |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_airbnb_alteration

> <AirbnbAlteration> create_airbnb_alteration(airbnb_alteration_create_request)

Create Airbnb alteration

Propose a change to an existing Airbnb reservation: new dates, a new guest count, a new total price, or a move to a different listing. **Write-side** — calls Airbnb upstream. Requires a connected Airbnb host for the workspace, else `404 no_connection`.  The body is validated before anything reaches Airbnb. `confirmation_code` is required and **at least one** of `check_in`, `check_out`, `number_of_guests`, `total_price` or `listing_id` must be sent with it — an alteration that changes nothing is `422 invalid_params`, not a request Airbnb is asked to act on. Unknown fields are refused rather than ignored, so a misspelling can never look like a successful write.  **Listing transfer.** `listing_id` moves the reservation to another listing in your workspace. Send the **Repull** listing id (the `id` from `GET /v1/properties`); Repull checks you own it, that it is active and connected to Airbnb, translates it to the Airbnb listing id and sends it upstream. Callers who hold the Airbnb-side id instead may send `airbnb_listing_id`. **Airbnb decides** whether to honour a listing change on an alteration — Repull sends it and reports Airbnb’s answer; a refusal comes back as `422 airbnb_rejected` carrying Airbnb’s own message.  Returns `403 listing_inactive` when the reservation’s listing, or the listing it is being moved to, is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
airbnb_alteration_create_request = Repull::AirbnbAlterationCreateRequest.new({confirmation_code: 'HMX4CMA2X9'}) # AirbnbAlterationCreateRequest | 

begin
  # Create Airbnb alteration
  result = api_instance.create_airbnb_alteration(airbnb_alteration_create_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_alteration: #{e}"
end
```

#### Using the create_airbnb_alteration_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbAlteration>, Integer, Hash)> create_airbnb_alteration_with_http_info(airbnb_alteration_create_request)

```ruby
begin
  # Create Airbnb alteration
  data, status_code, headers = api_instance.create_airbnb_alteration_with_http_info(airbnb_alteration_create_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbAlteration>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_alteration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **airbnb_alteration_create_request** | [**AirbnbAlterationCreateRequest**](AirbnbAlterationCreateRequest.md) |  |  |

### Return type

[**AirbnbAlteration**](AirbnbAlteration.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_airbnb_listing_room

> create_airbnb_listing_room(id, create_airbnb_listing_room_request)

Create an Airbnb room

Create a new room on an Airbnb listing, with its sleeping arrangement. **Write-side** — calls Airbnb upstream. Requires a connected Airbnb host, else `404 no_connection`.  The response is the room object as Airbnb returned it. The new room is also seeded into our own copy, so the very next `GET /rooms` shows it rather than waiting for the sync.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
create_airbnb_listing_room_request = Repull::CreateAirbnbListingRoomRequest.new({room_number: 37, room_type: 'bedroom'}) # CreateAirbnbListingRoomRequest | 

begin
  # Create an Airbnb room
  api_instance.create_airbnb_listing_room(id, create_airbnb_listing_room_request)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_listing_room: #{e}"
end
```

#### Using the create_airbnb_listing_room_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_airbnb_listing_room_with_http_info(id, create_airbnb_listing_room_request)

```ruby
begin
  # Create an Airbnb room
  data, status_code, headers = api_instance.create_airbnb_listing_room_with_http_info(id, create_airbnb_listing_room_request)
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
| **create_airbnb_listing_room_request** | [**CreateAirbnbListingRoomRequest**](CreateAirbnbListingRoomRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_airbnb_offer

> <GetAirbnbOffer200Response> create_airbnb_offer(create_airbnb_offer_request, opts)

Create Airbnb special offer or pre-approval

Create a pre-approval or a special offer on an Airbnb thread, addressed by **Airbnb** ids. **Write-side** — calls Airbnb upstream. The Repull-id equivalents, which also update the inquiry in Vanio, are `POST /v1/conversations/{id}/pre-approval` and `POST /v1/conversations/{id}/special-offers` — prefer those unless you only hold Airbnb ids.  - `type: \"preapproval\"` — let the guest book the dates and price they asked about. Requires `thread_id`; optional `block_instant_booking`. - `type: \"offer\"` — your own terms. Requires `thread_id`, `listing_id` (the **Airbnb** listing id, as a string), `start_date`, `nights`, `total_price` (whole stay, listing currency) and `guest_details` with `number_of_guests` (or `number_of_adults`; Airbnb counts adults + children).  The body is validated before anything reaches Airbnb (a `422 invalid_params` names the field), and unknown fields are refused. The legacy spellings `threadId` and `blockInstantBooking` still work. The request is sent as the Airbnb account that owns the thread or listing.  Airbnb refusals are mapped rather than returned as a 500: `409 inquiry_no_longer_open` / `inquiry_expired` when the inquiry moved on, `422 airbnb_rejected` with Airbnb’s reason otherwise, `403 connection_reauth_required` when the grant does not allow it.  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.  Send `Idempotency-Key`: a repeat with the same key replays the first response instead of acting twice (a `409 idempotency_key_in_use` while the first is still running). A 5xx, a `429 airbnb_rate_limited` or a `403 connection_reauth_required` is not stored — nothing was done — so retrying with the same key reaches Airbnb again.

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
create_airbnb_offer_request = Repull::CreateAirbnbOfferRequest.new({type: 'offer', thread_id: '2675957479'}) # CreateAirbnbOfferRequest | 
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Create Airbnb special offer or pre-approval
  result = api_instance.create_airbnb_offer(create_airbnb_offer_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_offer: #{e}"
end
```

#### Using the create_airbnb_offer_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAirbnbOffer200Response>, Integer, Hash)> create_airbnb_offer_with_http_info(create_airbnb_offer_request, opts)

```ruby
begin
  # Create Airbnb special offer or pre-approval
  data, status_code, headers = api_instance.create_airbnb_offer_with_http_info(create_airbnb_offer_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbOffer200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_offer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_airbnb_offer_request** | [**CreateAirbnbOfferRequest**](CreateAirbnbOfferRequest.md) |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**GetAirbnbOffer200Response**](GetAirbnbOffer200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## decline_airbnb_alteration

> decline_airbnb_alteration(id, opts)

Decline Airbnb alteration

Decline a pending Airbnb reservation alteration. **Write-side** — calls Airbnb upstream (`respondToAlteration`) to reject the proposed change. Requires a connected Airbnb host for the workspace (else `404 no_connection`) and that the alteration id belongs to a reservation in your workspace (else `404 not_found`). No request body is required.  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
id = 'id_example' # String | Airbnb alteration id (the `alterationId` from a `GET /v1/channels/airbnb/alterations` row).
opts = {
  body: { ... } # Object | 
}

begin
  # Decline Airbnb alteration
  api_instance.decline_airbnb_alteration(id, opts)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->decline_airbnb_alteration: #{e}"
end
```

#### Using the decline_airbnb_alteration_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> decline_airbnb_alteration_with_http_info(id, opts)

```ruby
begin
  # Decline Airbnb alteration
  data, status_code, headers = api_instance.decline_airbnb_alteration_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->decline_airbnb_alteration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb alteration id (the &#x60;alterationId&#x60; from a &#x60;GET /v1/channels/airbnb/alterations&#x60; row). |  |
| **body** | **Object** |  | [optional] |

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

Remove a single photo from an Airbnb listing. Pass the Airbnb-side photo id as `?photoId=`. **Write-side** — calls Airbnb upstream.  The photo is proven to belong to the listing named in the path first; a photo from another listing returns `404`. Airbnb refuses to delete a listing's last photo. Both stored copies drop the photo on success — `stored` reports whether that succeeded.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

> <DeleteAirbnbListingRoom200Response> delete_airbnb_listing_room(id, room_id)

Delete an Airbnb room

Delete a room from an Airbnb listing, and its beds with it. **Write-side** — calls Airbnb upstream. Pass the Airbnb-side room id as `?roomId=`. Requires a connected Airbnb host, else `404 no_connection`.  The room is proven to belong to the listing named in the path first; a room from another listing returns `404`. Both stored copies drop the room on success — `stored` reports whether that succeeded.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

> <Array(<DeleteAirbnbListingRoom200Response>, Integer, Hash)> delete_airbnb_listing_room_with_http_info(id, room_id)

```ruby
begin
  # Delete an Airbnb room
  data, status_code, headers = api_instance.delete_airbnb_listing_room_with_http_info(id, room_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DeleteAirbnbListingRoom200Response>
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

[**DeleteAirbnbListingRoom200Response**](DeleteAirbnbListingRoom200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## edit_airbnb_review

> <AirbnbReview> edit_airbnb_review(id, airbnb_review)

Edit Airbnb host review

Edit a host-side review for an Airbnb stay. Airbnb collapses POST + PUT into the same upstream call (`PUT /v2/listing_reviews/{id}`), so this endpoint covers both initial submit and subsequent edits while the review window is open.  Body is a partial `AirbnbReview` — pass the fields you want to change (rating, public review, private feedback, category ratings).  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

Fetch a single Airbnb reservation alteration by its Airbnb alteration id. **Pure DB read**, workspace-scoped via the reservations join. Returns `404 not_found` when no alteration matches the id in your workspace.  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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


## get_airbnb_booking_settings

> <GetAirbnbBookingSettings200Response> get_airbnb_booking_settings(id)

Get Airbnb booking settings

Read how an Airbnb listing takes bookings and what happens when a guest cancels: booking mode, Instant Book state, the good-track-record requirement, check-in/check-out times, advance notice, preparation time, booking window, the short-stay and long-stay cancellation policies, and the non-refundable option.  **This is Repull's stored copy, not a live call to Airbnb.** Values come from the local Airbnb mirror that the sync workers fill, so the response always carries `dataFreshness` — check `dataFreshness.stale` (and `dataFreshness.accounts[]` when the workspace has several Airbnb accounts) before treating a value as current.  **Not exposed by Airbnb.** The pre-reservation message and automatic stay extension have no field on Airbnb's `booking_settings` resource, so neither can be read or written here; set the pre-reservation message in the Airbnb host dashboard, and handle extensions through `/v1/channels/airbnb/alterations`. Airbnb also expresses the same-day cutoff only as whole hours of advance notice, so `advanceNotice.hours` is as precise as the cutoff gets.  Returns `404` when the listing has no Airbnb connection in this workspace, and `403 listing_inactive` when the listing is inactive — an inactive listing keeps syncing but cannot be read or changed through the API until it is activated.

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
id = 'id_example' # String | Repull listing id (numeric string), not the Airbnb listing id.

begin
  # Get Airbnb booking settings
  result = api_instance.get_airbnb_booking_settings(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_booking_settings: #{e}"
end
```

#### Using the get_airbnb_booking_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAirbnbBookingSettings200Response>, Integer, Hash)> get_airbnb_booking_settings_with_http_info(id)

```ruby
begin
  # Get Airbnb booking settings
  data, status_code, headers = api_instance.get_airbnb_booking_settings_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbBookingSettings200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_booking_settings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string), not the Airbnb listing id. |  |

### Return type

[**GetAirbnbBookingSettings200Response**](GetAirbnbBookingSettings200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_checkin_guide

> <GetAirbnbCheckinGuide200Response> get_airbnb_checkin_guide(id, opts)

Get Airbnb check-in guide

Return every published locale variant of an Airbnb listing's check-in guide. **Pure DB read** from `listings_airbnb_check_in_guides`. Pass `?locale=en` to filter to one locale (prefix match). Returns `404` when the listing has no Airbnb connection in this workspace.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

> <Array(<GetAirbnbCheckinGuide200Response>, Integer, Hash)> get_airbnb_checkin_guide_with_http_info(id, opts)

```ruby
begin
  # Get Airbnb check-in guide
  data, status_code, headers = api_instance.get_airbnb_checkin_guide_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbCheckinGuide200Response>
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

[**GetAirbnbCheckinGuide200Response**](GetAirbnbCheckinGuide200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_checkout_guide

> <GetAirbnbCheckinGuide200Response> get_airbnb_checkout_guide(id)

Get Airbnb checkout guide

Return the checkout tasks an Airbnb listing shows guests at departure. **Pure DB read** from `listings_airbnb_checkout_tasks`. Returns `404` when the listing has no Airbnb connection in this workspace.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

> <Array(<GetAirbnbCheckinGuide200Response>, Integer, Hash)> get_airbnb_checkout_guide_with_http_info(id)

```ruby
begin
  # Get Airbnb checkout guide
  data, status_code, headers = api_instance.get_airbnb_checkout_guide_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbCheckinGuide200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_checkout_guide_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |

### Return type

[**GetAirbnbCheckinGuide200Response**](GetAirbnbCheckinGuide200Response.md)

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

Fetch all Airbnb connection rows for a single Vanio listing id. A property may be linked from multiple Airbnb hosts — every match is returned. Pass `?include=amenities` to enrich each row with its current Airbnb amenities.  Each row carries `syncCategory` — Airbnb's own per-listing API sync decision (`sync_all`, `sync_rates_and_availability`, or `none`) — and `writable`, which is `false` exactly when that category is `none`, meaning Airbnb refuses every write to the listing and Repull returns `403 listing_not_api_connected` without sending anything. `GET /v1/channels/airbnb/listings` reports both fields for the whole portfolio in one call.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

Read the per-day availability calendar for an Airbnb listing. Returns one row per day including price overrides, min-stay, and blocked status.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
- **Accept**: application/json


## get_airbnb_listing_details

> <GetAirbnbListingDetails200Response> get_airbnb_listing_details(id)

Get Airbnb listing details

What kind of property Airbnb thinks this is — property type group and category, room type, capacity — plus the check-in method (`checkInOption`), whether the listing is live (`hasAvailability`), and **`lockedFields`: the attributes Airbnb refuses to change on this listing**.  **Pure DB read** from the local mirror, one entry per Airbnb connection.  Read `lockedFields` before a content write. Airbnb does not refuse a write to a locked attribute: it returns 200, reports the attribute as locked, and applies nothing — which is why a write can look successful and change nothing. 1,180 of 5,917 synced listings carry at least one locked attribute.  Returns `404` when the listing has no Airbnb connection in this workspace, and `403 listing_inactive` when the listing is inactive.

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
  # Get Airbnb listing details
  result = api_instance.get_airbnb_listing_details(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_details: #{e}"
end
```

#### Using the get_airbnb_listing_details_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAirbnbListingDetails200Response>, Integer, Hash)> get_airbnb_listing_details_with_http_info(id)

```ruby
begin
  # Get Airbnb listing details
  data, status_code, headers = api_instance.get_airbnb_listing_details_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbListingDetails200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_details_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |

### Return type

[**GetAirbnbListingDetails200Response**](GetAirbnbListingDetails200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_listing_pricing

> get_airbnb_listing_pricing(id)

Get Airbnb pricing

Read the current pricing config (base price, weekend uplift, length-of-stay discounts, smart-pricing bounds) for an Airbnb listing.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
- **Accept**: application/json


## get_airbnb_listing_quality

> <GetAirbnbListingQuality200Response> get_airbnb_listing_quality(id, opts)

Get Airbnb listing quality

Return an Airbnb listing's quality signals — standards, reservation issues, and monthly quality stats. **Pure DB read** from the local quality mirrors. Scope the response with `?type=all|standards|issues|stats` (default `all`, which returns `{ standards, issues }`). Returns `404` when the listing has no Airbnb connection in this workspace.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

Return an Airbnb listing's host roles, published locales, and regulatory permits. **Pure DB read** — host roles from `listings_airbnb_details.host_roles`, locales from distinct `listings_airbnb_descriptions.locale`, permits from `listings_airbnb_permits`. Scope with `?type=all|hosts|permits|locales` (default `all`, which returns `{ hosts, locales }`). Returns `404` when the listing has no Airbnb connection in this workspace.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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


## get_airbnb_offer

> <GetAirbnbOffer200Response> get_airbnb_offer(offer_id)

Get Airbnb special offer

Read a pre-approval or special offer from Airbnb by its Airbnb id. **Live read** — calls Airbnb upstream. Pass the id as `?offerId=`. The Repull-id equivalent is `GET /v1/conversations/{id}/special-offers/{offerId}`, which also confirms the offer belongs to that conversation.

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
offer_id = 'offer_id_example' # String | Airbnb special-offer id (the `id` Airbnb returned when the offer was created).

begin
  # Get Airbnb special offer
  result = api_instance.get_airbnb_offer(offer_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_offer: #{e}"
end
```

#### Using the get_airbnb_offer_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAirbnbOffer200Response>, Integer, Hash)> get_airbnb_offer_with_http_info(offer_id)

```ruby
begin
  # Get Airbnb special offer
  data, status_code, headers = api_instance.get_airbnb_offer_with_http_info(offer_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbOffer200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_offer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offer_id** | **String** | Airbnb special-offer id (the &#x60;id&#x60; Airbnb returned when the offer was created). |  |

### Return type

[**GetAirbnbOffer200Response**](GetAirbnbOffer200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_reservation

> <AirbnbReservation> get_airbnb_reservation(code)

Get Airbnb reservation

Fetch a single Airbnb reservation by Airbnb confirmation code (e.g. `HMABCDEF12`).  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

Fetch a single Airbnb message thread by its Airbnb thread id. **Pure DB read** from the local `message_threads` mirror, workspace-scoped. Returns `404 not_found` when no thread matches. For the messages within a thread use `GET /v1/channels/airbnb/messaging/{threadId}/messages`.  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

List reservation alteration requests for Airbnb reservations in this workspace. **Pure DB read** from the local `reservation_alterations` mirror — never calls Airbnb upstream — scoped to your workspace via the reservations join.  Default returns only pending alterations; pass `?type=all` for the full history. Filter to a single reservation with `?reservation_code=<confirmation code>`. Every response carries the `dataFreshness` envelope.  Each row carries the proposed change in its `new*` fields. A **listing transfer** shows up as `newListingId` (Repull listing id) and `newAirbnbListingId` (Airbnb's own id); both are `null` when the alteration does not move the reservation.  Alterations of reservations on inactive listings are left out. Filtering by a reservation on an inactive listing (`reservation_code`) returns `403 listing_inactive`.  **Several Airbnb accounts?** A workspace can connect more than one. By default this returns every connected account's rows; pass `?account_id=<airbnb host id>` to scope to one. Every row carries `accountId` + `accountName` either way, and `dataFreshness.accounts[]` reports each account's freshness separately, so one disconnected host no longer marks the whole response stale.

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
  account_id: '1772489413932732258', # String | Scope the response to ONE connected Airbnb account. The value is the Airbnb host id — the same `accounts[].externalAccountId` that `GET /v1/connect/airbnb` returns and `DELETE /v1/connect/airbnb?accountId=` accepts.  A workspace can connect several Airbnb accounts. Omit this and you get every account's rows (the default, unchanged). Every row carries `accountId` + `accountName` either way, so you can group without a second call.  An id that is not connected to THIS workspace returns `404 not_found` with your own ids in `valid_values` — we do not distinguish \"no such host\" from \"someone else's host\", because confirming the latter would leak another workspace's account.  Note this is NOT the `X-Account-Id` header, which carries a connection id and cannot tell two Airbnb hosts apart.
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
| **account_id** | **String** | Scope the response to ONE connected Airbnb account. The value is the Airbnb host id — the same &#x60;accounts[].externalAccountId&#x60; that &#x60;GET /v1/connect/airbnb&#x60; returns and &#x60;DELETE /v1/connect/airbnb?accountId&#x3D;&#x60; accepts.  A workspace can connect several Airbnb accounts. Omit this and you get every account&#39;s rows (the default, unchanged). Every row carries &#x60;accountId&#x60; + &#x60;accountName&#x60; either way, so you can group without a second call.  An id that is not connected to THIS workspace returns &#x60;404 not_found&#x60; with your own ids in &#x60;valid_values&#x60; — we do not distinguish \&quot;no such host\&quot; from \&quot;someone else&#39;s host\&quot;, because confirming the latter would leak another workspace&#39;s account.  Note this is NOT the &#x60;X-Account-Id&#x60; header, which carries a connection id and cannot tell two Airbnb hosts apart. | [optional] |
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

List an Airbnb listing's amenities. **Pure DB read** from the local `listings_airbnb_amenities` cache — never calls Airbnb upstream. The response splits amenities into `amenities` (regular) and `accessibility_amenities` (step-free access, wide doorways, grab rails, disabled parking, wheelchair, accessible-height fixtures, hoists, etc). Both are arrays (`[]` when none). Consult `dataFreshness` to disambiguate \"never synced\" from \"fresh and genuinely empty\". Returns `404` when the listing has no Airbnb connection in this workspace.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

> <GetAirbnbCheckinGuide200Response> list_airbnb_listing_descriptions(id, opts)

List Airbnb descriptions

List an Airbnb listing's per-locale content (name, summary, house rules, etc). **Pure DB read** from `listings_airbnb_descriptions`. Filter to one locale with `?locale=en` (the legacy `?country=` param is accepted as a soft alias). Returns `404` when the listing has no Airbnb connection in this workspace.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

> <Array(<GetAirbnbCheckinGuide200Response>, Integer, Hash)> list_airbnb_listing_descriptions_with_http_info(id, opts)

```ruby
begin
  # List Airbnb descriptions
  data, status_code, headers = api_instance.list_airbnb_listing_descriptions_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbCheckinGuide200Response>
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

[**GetAirbnbCheckinGuide200Response**](GetAirbnbCheckinGuide200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_listing_permits

> <ListAirbnbListingPermits200Response> list_airbnb_listing_permits(id, opts)

List Airbnb permits and licences

The regulatory permits, licences and registration numbers attached to an Airbnb listing.  **DB-only by default.** `?source=cache` (the default) returns the permits as last mirrored by the sync worker — regulatory body, regulation type, status, permit number — with no upstream call.  **`?source=live` also returns the QUESTIONS.** The mirror stores the RESULT of a permit, not what Airbnb asks for it, so a caller that is about to write needs `?source=live` once: it returns each permit's `flows[]` with the `answer_key`, `type` and `choices` of every question, and the answers already on file. Airbnb refuses an `answer_key` it did not ask for on this listing, so this is not optional guesswork you can skip.  Returns `404` when the listing has no Airbnb connection in this workspace, and `403 listing_inactive` when the listing is inactive.

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
  source: 'cache' # String | `cache` (default) reads the local mirror only. `live` additionally asks Airbnb for the permit questions.
}

begin
  # List Airbnb permits and licences
  result = api_instance.list_airbnb_listing_permits(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_permits: #{e}"
end
```

#### Using the list_airbnb_listing_permits_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAirbnbListingPermits200Response>, Integer, Hash)> list_airbnb_listing_permits_with_http_info(id, opts)

```ruby
begin
  # List Airbnb permits and licences
  data, status_code, headers = api_instance.list_airbnb_listing_permits_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAirbnbListingPermits200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_permits_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **source** | **String** | &#x60;cache&#x60; (default) reads the local mirror only. &#x60;live&#x60; additionally asks Airbnb for the permit questions. | [optional][default to &#39;cache&#39;] |

### Return type

[**ListAirbnbListingPermits200Response**](ListAirbnbListingPermits200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_listing_photos

> list_airbnb_listing_photos(id)

List Airbnb photos

List photos attached to an Airbnb listing in display order. Returns the public CDN URL plus Airbnb-side metadata (id, caption, room).  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
- **Accept**: application/json


## list_airbnb_listing_rooms

> <GetAirbnbCheckinGuide200Response> list_airbnb_listing_rooms(id)

List Airbnb rooms

List the rooms configured on an Airbnb listing, ordered by room number, each with its sleeping arrangement in `beds`. **Pure DB read** from `listings_airbnb_rooms` + `listings_airbnb_beds`. Returns `404` when the listing has no Airbnb connection in this workspace.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

> <Array(<GetAirbnbCheckinGuide200Response>, Integer, Hash)> list_airbnb_listing_rooms_with_http_info(id)

```ruby
begin
  # List Airbnb rooms
  data, status_code, headers = api_instance.list_airbnb_listing_rooms_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbCheckinGuide200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_rooms_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |

### Return type

[**GetAirbnbCheckinGuide200Response**](GetAirbnbCheckinGuide200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_listing_safety_disclosures

> <ListAirbnbListingSafetyDisclosures200Response> list_airbnb_listing_safety_disclosures(id)

List guest-safety disclosures

What a guest is told about the property before they book — exterior security cameras, a decibel noise monitor, pets on the property, stairs, a pool with no fence, weapons, shared spaces, limited parking. Airbnb calls them `listing_expectations_for_guests` and shows them at booking time.  **Pure DB read** from the local mirror. EVERY supported disclosure type is returned, including the ones this listing has not declared (`value: false`), so \"does this property have cameras?\" has an answer rather than a missing key — `declared` tells you whether Airbnb holds an explicit answer. Types Airbnb returns that are not in the documented set are passed through rather than dropped.  Where a listing is connected to several Airbnb listings, a disclosure declared on any of them is reported as true of the property.  Returns `404` when the listing has no Airbnb connection in this workspace, and `403 listing_inactive` when the listing is inactive.

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
  # List guest-safety disclosures
  result = api_instance.list_airbnb_listing_safety_disclosures(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_safety_disclosures: #{e}"
end
```

#### Using the list_airbnb_listing_safety_disclosures_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAirbnbListingSafetyDisclosures200Response>, Integer, Hash)> list_airbnb_listing_safety_disclosures_with_http_info(id)

```ruby
begin
  # List guest-safety disclosures
  data, status_code, headers = api_instance.list_airbnb_listing_safety_disclosures_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAirbnbListingSafetyDisclosures200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_safety_disclosures_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |

### Return type

[**ListAirbnbListingSafetyDisclosures200Response**](ListAirbnbListingSafetyDisclosures200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_listings

> <AirbnbListingListResponse> list_airbnb_listings(opts)

List Airbnb listings

List every Airbnb listing this workspace has access to via the connected Airbnb account. **Pure DB read — never calls Airbnb upstream.** The connect flow is what populates the local cache; the API serves what's already there. Customers with a disconnected host still see their last-synced data, with the top-level `dataFreshness` envelope flagging the staleness and pointing at the reconnect URL.  Pass `?include=amenities` to enrich each connection with its locally-cached amenity set. Returns `null` per connection when the cache is empty.  Pass `?include=thumbnail` to add `thumbnailUrl` to each listing — one extra column on the query that already runs, so a selection screen renders from a single request instead of one call per listing. `null` when the listing has no thumbnail stored. Combine comma-separated, e.g. `?include=amenities,thumbnail`.  **Can this listing be written to?** Every connection carries `syncCategory` — Airbnb's own per-listing API sync decision (`sync_all`, `sync_rates_and_availability`, or `none`) — and `writable`, which is `false` exactly when that category is `none`. Airbnb authorises sync one listing at a time, so a connected account can still hold listings Airbnb refuses every write to; a write to one of those returns `403 listing_not_api_connected` before anything is sent, and reconnecting the account does not change it (the host must switch the listing on in Airbnb). Check `writable` here before a portfolio-wide push instead of discovering it one 403 at a time.  Inactive listings are left out; they keep syncing and reappear once activated. Use `GET /v1/listings?status=inactive` to find them.  **Several Airbnb accounts?** A workspace can connect more than one. By default this returns every connected account's rows; pass `?account_id=<airbnb host id>` to scope to one. Every row carries `accountId` + `accountName` either way, and `dataFreshness.accounts[]` reports each account's freshness separately, so one disconnected host no longer marks the whole response stale.

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
  account_id: '1772489413932732258', # String | Scope the response to ONE connected Airbnb account. The value is the Airbnb host id — the same `accounts[].externalAccountId` that `GET /v1/connect/airbnb` returns and `DELETE /v1/connect/airbnb?accountId=` accepts.  A workspace can connect several Airbnb accounts. Omit this and you get every account's rows (the default, unchanged). Every row carries `accountId` + `accountName` either way, so you can group without a second call.  An id that is not connected to THIS workspace returns `404 not_found` with your own ids in `valid_values` — we do not distinguish \"no such host\" from \"someone else's host\", because confirming the latter would leak another workspace's account.  Note this is NOT the `X-Account-Id` header, which carries a connection id and cannot tell two Airbnb hosts apart.
  include: 'amenities,thumbnail' # String | Comma-separated expansions. Currently supported: `amenities` (adds `amenities` and `accessibility_amenities` arrays to each connection, sourced from the local `listings_airbnb_amenities` cache) and `thumbnail` (adds `thumbnailUrl` to each listing). Unknown values return 422 with a `valid_values` envelope.
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
| **account_id** | **String** | Scope the response to ONE connected Airbnb account. The value is the Airbnb host id — the same &#x60;accounts[].externalAccountId&#x60; that &#x60;GET /v1/connect/airbnb&#x60; returns and &#x60;DELETE /v1/connect/airbnb?accountId&#x3D;&#x60; accepts.  A workspace can connect several Airbnb accounts. Omit this and you get every account&#39;s rows (the default, unchanged). Every row carries &#x60;accountId&#x60; + &#x60;accountName&#x60; either way, so you can group without a second call.  An id that is not connected to THIS workspace returns &#x60;404 not_found&#x60; with your own ids in &#x60;valid_values&#x60; — we do not distinguish \&quot;no such host\&quot; from \&quot;someone else&#39;s host\&quot;, because confirming the latter would leak another workspace&#39;s account.  Note this is NOT the &#x60;X-Account-Id&#x60; header, which carries a connection id and cannot tell two Airbnb hosts apart. | [optional] |
| **include** | **String** | Comma-separated expansions. Currently supported: &#x60;amenities&#x60; (adds &#x60;amenities&#x60; and &#x60;accessibility_amenities&#x60; arrays to each connection, sourced from the local &#x60;listings_airbnb_amenities&#x60; cache) and &#x60;thumbnail&#x60; (adds &#x60;thumbnailUrl&#x60; to each listing). Unknown values return 422 with a &#x60;valid_values&#x60; envelope. | [optional] |

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

Cursor-paginated list of reservations sourced directly from Airbnb. Use this when you need Airbnb-specific fields (guest payout split, cancellation policy snapshot) that the unified `/v1/reservations` endpoint flattens away.  Walk pages with `?cursor=<pagination.nextCursor>` until `pagination.hasMore` is `false`. The cursor is opaque — never construct or parse it client-side.  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`. Internally this walks upstream Airbnb cursor pages to skip rows, so deep offsets cost N/limit upstream round-trips; cursor remains the better choice for deep pagination.  When `status` is omitted, all statuses are returned (Airbnb defaults to `accepted` only on its own surface, but this endpoint normalises to \"all\"). Pass `?status=accepted` to scope.  Reservations on inactive listings are left out (counts and cursors included); they keep syncing and reappear once the listing is activated. Filtering by an inactive listing (`listing_id`) returns `403 listing_inactive`.  **Several Airbnb accounts?** A workspace can connect more than one. By default this returns every connected account's rows; pass `?account_id=<airbnb host id>` to scope to one. Every row carries `accountId` + `accountName` either way, and `dataFreshness.accounts[]` reports each account's freshness separately, so one disconnected host no longer marks the whole response stale.

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
  account_id: '1772489413932732258', # String | Scope the response to ONE connected Airbnb account. The value is the Airbnb host id — the same `accounts[].externalAccountId` that `GET /v1/connect/airbnb` returns and `DELETE /v1/connect/airbnb?accountId=` accepts.  A workspace can connect several Airbnb accounts. Omit this and you get every account's rows (the default, unchanged). Every row carries `accountId` + `accountName` either way, so you can group without a second call.  An id that is not connected to THIS workspace returns `404 not_found` with your own ids in `valid_values` — we do not distinguish \"no such host\" from \"someone else's host\", because confirming the latter would leak another workspace's account.  Note this is NOT the `X-Account-Id` header, which carries a connection id and cannot tell two Airbnb hosts apart.
  cursor: 'cursor_example', # String | Opaque cursor returned by the previous response's `pagination.nextCursor`. Omit to fetch the first page.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.nextCursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
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
| **account_id** | **String** | Scope the response to ONE connected Airbnb account. The value is the Airbnb host id — the same &#x60;accounts[].externalAccountId&#x60; that &#x60;GET /v1/connect/airbnb&#x60; returns and &#x60;DELETE /v1/connect/airbnb?accountId&#x3D;&#x60; accepts.  A workspace can connect several Airbnb accounts. Omit this and you get every account&#39;s rows (the default, unchanged). Every row carries &#x60;accountId&#x60; + &#x60;accountName&#x60; either way, so you can group without a second call.  An id that is not connected to THIS workspace returns &#x60;404 not_found&#x60; with your own ids in &#x60;valid_values&#x60; — we do not distinguish \&quot;no such host\&quot; from \&quot;someone else&#39;s host\&quot;, because confirming the latter would leak another workspace&#39;s account.  Note this is NOT the &#x60;X-Account-Id&#x60; header, which carries a connection id and cannot tell two Airbnb hosts apart. | [optional] |
| **cursor** | **String** | Opaque cursor returned by the previous response&#39;s &#x60;pagination.nextCursor&#x60;. Omit to fetch the first page. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
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

> <AirbnbReviewListResponse> list_airbnb_reviews(opts)

List Airbnb reviews

List reviews left by guests on Airbnb listings in this workspace. Includes both reviews of the host and reviews of the guest (where the host has not yet submitted theirs).  Reviews of inactive listings are left out; they keep syncing and reappear once the listing is activated. Filtering by an inactive listing (`listing_id`) returns `403 listing_inactive`.  **Several Airbnb accounts?** A workspace can connect more than one. By default this returns every connected account's rows; pass `?account_id=<airbnb host id>` to scope to one. Every row carries `accountId` + `accountName` either way, and `dataFreshness.accounts[]` reports each account's freshness separately, so one disconnected host no longer marks the whole response stale.

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
  account_id: '1772489413932732258' # String | Scope the response to ONE connected Airbnb account. The value is the Airbnb host id — the same `accounts[].externalAccountId` that `GET /v1/connect/airbnb` returns and `DELETE /v1/connect/airbnb?accountId=` accepts.  A workspace can connect several Airbnb accounts. Omit this and you get every account's rows (the default, unchanged). Every row carries `accountId` + `accountName` either way, so you can group without a second call.  An id that is not connected to THIS workspace returns `404 not_found` with your own ids in `valid_values` — we do not distinguish \"no such host\" from \"someone else's host\", because confirming the latter would leak another workspace's account.  Note this is NOT the `X-Account-Id` header, which carries a connection id and cannot tell two Airbnb hosts apart.
}

begin
  # List Airbnb reviews
  result = api_instance.list_airbnb_reviews(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_reviews: #{e}"
end
```

#### Using the list_airbnb_reviews_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReviewListResponse>, Integer, Hash)> list_airbnb_reviews_with_http_info(opts)

```ruby
begin
  # List Airbnb reviews
  data, status_code, headers = api_instance.list_airbnb_reviews_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReviewListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_reviews_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Scope the response to ONE connected Airbnb account. The value is the Airbnb host id — the same &#x60;accounts[].externalAccountId&#x60; that &#x60;GET /v1/connect/airbnb&#x60; returns and &#x60;DELETE /v1/connect/airbnb?accountId&#x3D;&#x60; accepts.  A workspace can connect several Airbnb accounts. Omit this and you get every account&#39;s rows (the default, unchanged). Every row carries &#x60;accountId&#x60; + &#x60;accountName&#x60; either way, so you can group without a second call.  An id that is not connected to THIS workspace returns &#x60;404 not_found&#x60; with your own ids in &#x60;valid_values&#x60; — we do not distinguish \&quot;no such host\&quot; from \&quot;someone else&#39;s host\&quot;, because confirming the latter would leak another workspace&#39;s account.  Note this is NOT the &#x60;X-Account-Id&#x60; header, which carries a connection id and cannot tell two Airbnb hosts apart. | [optional] |

### Return type

[**AirbnbReviewListResponse**](AirbnbReviewListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_thread_messages

> <ListAirbnbThreadMessages200Response> list_airbnb_thread_messages(thread_id, opts)

Get Airbnb messages

Messages stored for an Airbnb thread, as recorded rows (not the unified `Message` shape — use `GET /v1/conversations/{id}/messages` for that). By default returns 50 per page, newest first; walk older pages with `?cursor=` (the `pagination.nextCursor` of the previous page) until `pagination.hasMore` is `false`. `?all=true` returns up to 1000 rows oldest-first in one response, with no `pagination`.  Each row carries `attachments` — photos and other files on that message, inbound or outbound — in the same shape as the unified endpoint.  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
opts = {
  cursor: 'cursor_example', # String | `pagination.nextCursor` from the previous page.
  all: true # Boolean | `true` returns up to 1000 messages oldest-first in one response, without `pagination`.
}

begin
  # Get Airbnb messages
  result = api_instance.list_airbnb_thread_messages(thread_id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_thread_messages: #{e}"
end
```

#### Using the list_airbnb_thread_messages_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAirbnbThreadMessages200Response>, Integer, Hash)> list_airbnb_thread_messages_with_http_info(thread_id, opts)

```ruby
begin
  # Get Airbnb messages
  data, status_code, headers = api_instance.list_airbnb_thread_messages_with_http_info(thread_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAirbnbThreadMessages200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_thread_messages_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **thread_id** | **String** |  |  |
| **cursor** | **String** | &#x60;pagination.nextCursor&#x60; from the previous page. | [optional] |
| **all** | **Boolean** | &#x60;true&#x60; returns up to 1000 messages oldest-first in one response, without &#x60;pagination&#x60;. | [optional] |

### Return type

[**ListAirbnbThreadMessages200Response**](ListAirbnbThreadMessages200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_threads

> <AirbnbThreadListResponse> list_airbnb_threads(opts)

List Airbnb message threads

List Airbnb message threads (one per guest conversation). Cursor-paginated. Each thread includes a preview of the latest message.  Threads on inactive listings are left out; they keep syncing and reappear once the listing is activated. Filtering by an inactive listing (`listing_id`) returns `403 listing_inactive`.  **Several Airbnb accounts?** A workspace can connect more than one. By default this returns every connected account's rows; pass `?account_id=<airbnb host id>` to scope to one. Every row carries `accountId` + `accountName` either way, and `dataFreshness.accounts[]` reports each account's freshness separately, so one disconnected host no longer marks the whole response stale.

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
  account_id: '1772489413932732258' # String | Scope the response to ONE connected Airbnb account. The value is the Airbnb host id — the same `accounts[].externalAccountId` that `GET /v1/connect/airbnb` returns and `DELETE /v1/connect/airbnb?accountId=` accepts.  A workspace can connect several Airbnb accounts. Omit this and you get every account's rows (the default, unchanged). Every row carries `accountId` + `accountName` either way, so you can group without a second call.  An id that is not connected to THIS workspace returns `404 not_found` with your own ids in `valid_values` — we do not distinguish \"no such host\" from \"someone else's host\", because confirming the latter would leak another workspace's account.  Note this is NOT the `X-Account-Id` header, which carries a connection id and cannot tell two Airbnb hosts apart.
}

begin
  # List Airbnb message threads
  result = api_instance.list_airbnb_threads(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_threads: #{e}"
end
```

#### Using the list_airbnb_threads_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbThreadListResponse>, Integer, Hash)> list_airbnb_threads_with_http_info(opts)

```ruby
begin
  # List Airbnb message threads
  data, status_code, headers = api_instance.list_airbnb_threads_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbThreadListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_threads_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Scope the response to ONE connected Airbnb account. The value is the Airbnb host id — the same &#x60;accounts[].externalAccountId&#x60; that &#x60;GET /v1/connect/airbnb&#x60; returns and &#x60;DELETE /v1/connect/airbnb?accountId&#x3D;&#x60; accepts.  A workspace can connect several Airbnb accounts. Omit this and you get every account&#39;s rows (the default, unchanged). Every row carries &#x60;accountId&#x60; + &#x60;accountName&#x60; either way, so you can group without a second call.  An id that is not connected to THIS workspace returns &#x60;404 not_found&#x60; with your own ids in &#x60;valid_values&#x60; — we do not distinguish \&quot;no such host\&quot; from \&quot;someone else&#39;s host\&quot;, because confirming the latter would leak another workspace&#39;s account.  Note this is NOT the &#x60;X-Account-Id&#x60; header, which carries a connection id and cannot tell two Airbnb hosts apart. | [optional] |

### Return type

[**AirbnbThreadListResponse**](AirbnbThreadListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_transactions

> <ListAirbnbTransactions200Response> list_airbnb_transactions(opts)

List Airbnb transactions

List Airbnb host transactions (reservation earnings, payouts, resolution adjustments) for this workspace, newest first. **Pure DB read** — customer-facing reads never call Airbnb upstream; they serve the `airbnb_transactions` mirror. Each row carries the genuine host- and guest-side financial breakdown (accommodation subtotal, cleaning fee, host + guest service fees split base/VAT, tax buckets, expected/actual host payout with settlement status). Trigger a refresh with `POST` on this path. When the mirror is empty or the host disconnected, `dataFreshness.stale = true` with a `reason` (`never_synced`, `host_disconnected_<iso>`, `sync_lag_>_24h`).  Transactions of reservations on inactive listings are left out; payout rows, which belong to no listing, are always included.  **Several Airbnb accounts?** A workspace can connect more than one. By default this returns every connected account's rows; pass `?account_id=<airbnb host id>` to scope to one. Every row carries `accountId` + `accountName` either way, and `dataFreshness.accounts[]` reports each account's freshness separately, so one disconnected host no longer marks the whole response stale.

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
  account_id: '1772489413932732258' # String | Scope the response to ONE connected Airbnb account. The value is the Airbnb host id — the same `accounts[].externalAccountId` that `GET /v1/connect/airbnb` returns and `DELETE /v1/connect/airbnb?accountId=` accepts.  A workspace can connect several Airbnb accounts. Omit this and you get every account's rows (the default, unchanged). Every row carries `accountId` + `accountName` either way, so you can group without a second call.  An id that is not connected to THIS workspace returns `404 not_found` with your own ids in `valid_values` — we do not distinguish \"no such host\" from \"someone else's host\", because confirming the latter would leak another workspace's account.  Note this is NOT the `X-Account-Id` header, which carries a connection id and cannot tell two Airbnb hosts apart.
}

begin
  # List Airbnb transactions
  result = api_instance.list_airbnb_transactions(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_transactions: #{e}"
end
```

#### Using the list_airbnb_transactions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAirbnbTransactions200Response>, Integer, Hash)> list_airbnb_transactions_with_http_info(opts)

```ruby
begin
  # List Airbnb transactions
  data, status_code, headers = api_instance.list_airbnb_transactions_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAirbnbTransactions200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_transactions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Scope the response to ONE connected Airbnb account. The value is the Airbnb host id — the same &#x60;accounts[].externalAccountId&#x60; that &#x60;GET /v1/connect/airbnb&#x60; returns and &#x60;DELETE /v1/connect/airbnb?accountId&#x3D;&#x60; accepts.  A workspace can connect several Airbnb accounts. Omit this and you get every account&#39;s rows (the default, unchanged). Every row carries &#x60;accountId&#x60; + &#x60;accountName&#x60; either way, so you can group without a second call.  An id that is not connected to THIS workspace returns &#x60;404 not_found&#x60; with your own ids in &#x60;valid_values&#x60; — we do not distinguish \&quot;no such host\&quot; from \&quot;someone else&#39;s host\&quot;, because confirming the latter would leak another workspace&#39;s account.  Note this is NOT the &#x60;X-Account-Id&#x60; header, which carries a connection id and cannot tell two Airbnb hosts apart. | [optional] |

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

Link an existing Airbnb listing to a canonical Repull listing/property. **API-key-scoped** (unlike the Booking room mapping, which is Connect-session-scoped).  Discover the `airbnbId` (+ `hostId`) via `GET /v1/channels/airbnb/listings`, then re-point it at the `listingId` of your choice — the dedup / consolidation case where the Airbnb sync auto-created its own listing but you want the inventory under an existing property.  Repoints both the Airbnb record and its platform link to the target listing in one transaction. Idempotent — re-mapping to the same listing is a 200 no-op (`alreadyMapped: true`). Scope is enforced against your workspace on both the target listing and the existing Airbnb record; a listing that already links a different Airbnb listing returns 409.  Returns `403 listing_inactive` when the target listing, or the listing the Airbnb listing is mapped to now, is inactive; nothing is changed.

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


## reorder_airbnb_listing_photos

> <ReorderAirbnbListingPhotos200Response> reorder_airbnb_listing_photos(id, reorder_airbnb_listing_photos_request)

Reorder the Airbnb photo tour

Set the order of a listing's photo tour in one call. **Write-side** — calls Airbnb upstream.  Send the photo ids in the order you want them shown, first photo first. Ids you leave out keep their current relative order behind the ones you list, so moving one photo to the front is `{\"photo_ids\": [\"<id>\"]}`. Positions are then written as a dense run starting at 1.  Airbnb has no bulk photo endpoint — order is one `sort_order` per photo — so this saves a loop of up to 200 requests against your rate limit and makes the partial-failure case reportable. How much is atomic:  - Everything is validated before anything is written. A duplicate id, an id that is not on this listing, an inactive listing or a missing connection all fail with **zero** upstream writes. - Only photos whose position actually changes are written; re-sending the order you already have writes nothing. - On the first upstream failure the run stops — nothing after it is attempted. The error carries `applied`, `failed_photo_id` and `not_attempted`, uses Airbnb's own status (`422` rejected / `403` reauth / `429` / `502`), and the operation is idempotent: re-send the identical body to finish the run. - Our stored copy records what actually landed, never the intent.  Validation is against our cached copy of the tour, so a listing whose photos have never synced returns `404` — use `PATCH /photos` (which needs no cache) until the first sync lands.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
reorder_airbnb_listing_photos_request = Repull::ReorderAirbnbListingPhotosRequest.new({photo_ids: ['photo_ids_example']}) # ReorderAirbnbListingPhotosRequest | 

begin
  # Reorder the Airbnb photo tour
  result = api_instance.reorder_airbnb_listing_photos(id, reorder_airbnb_listing_photos_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->reorder_airbnb_listing_photos: #{e}"
end
```

#### Using the reorder_airbnb_listing_photos_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReorderAirbnbListingPhotos200Response>, Integer, Hash)> reorder_airbnb_listing_photos_with_http_info(id, reorder_airbnb_listing_photos_request)

```ruby
begin
  # Reorder the Airbnb photo tour
  data, status_code, headers = api_instance.reorder_airbnb_listing_photos_with_http_info(id, reorder_airbnb_listing_photos_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReorderAirbnbListingPhotos200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->reorder_airbnb_listing_photos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **reorder_airbnb_listing_photos_request** | [**ReorderAirbnbListingPhotosRequest**](ReorderAirbnbListingPhotosRequest.md) |  |  |

### Return type

[**ReorderAirbnbListingPhotos200Response**](ReorderAirbnbListingPhotos200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## respond_airbnb_review

> <AirbnbReview> respond_airbnb_review(id, respond_airbnb_review_request)

Respond to Airbnb review

Post a public host response to a guest review. Airbnb allows one response per review — repeated POSTs return 409. Response text is capped at 1000 characters.  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

Legacy action-based shape. Body `{ action: \"respond\"|\"submit\", reviewId, response?, review? }`. Kept for backwards compatibility — prefer `PUT /v1/channels/airbnb/reviews/{id}` (edit) and `POST /v1/channels/airbnb/reviews/{id}/respond` (reply) for new integrations.  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
- **Accept**: application/json


## send_airbnb_message

> <SendAirbnbMessage201Response> send_airbnb_message(thread_id, send_airbnb_message_request)

Send Airbnb message

Send a message in an Airbnb thread as the host. Airbnb enforces content rules (no off-platform contact info, no external URLs) — violating messages are rejected upstream and surface as `422 airbnb_rejected` carrying Airbnb's own reason. Resending the same text is refused again; edit it first. `502 airbnb_error` is the other answer and means something else entirely: Airbnb did not complete the send, so retry it unchanged.  ### Sending a photo or video (`mediaUrl`)  Airbnb only accepts media uploaded to a signed URL it issues, one file per message and no text on the same message. With `mediaUrl`, Repull downloads the file (public `https://` only, 10 MB max), reads its real type from the bytes (JPEG, PNG, GIF, WebP — converted to JPEG — or MP4/QuickTime), uploads it to Airbnb and sends it; `message`, if given, follows as a separate message. This is the same flow as `POST /v1/conversations/{id}/messages` with `attachments` — prefer that endpoint, which also takes several files per request. The response is a `SendMessageResponse`, the send is recorded in the conversation, and failures are the 422 codes documented there (`attachment_type_not_supported`, `attachment_too_large`, `message_not_sent` for a pre-booking thread, …). The thread must already be synced to Repull (`GET /v1/conversations` lists them), otherwise `404`.  Text-only sends (no `mediaUrl`) go straight to Airbnb and return Airbnb's message object.  The `{threadId}` is the Airbnb thread id — the `externalThreadId` field on a unified `Conversation` (`GET /v1/conversations`).  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
thread_id = 'thread_id_example' # String | Airbnb thread id (the `externalThreadId` on a unified `Conversation`).
send_airbnb_message_request = Repull::SendAirbnbMessageRequest.new # SendAirbnbMessageRequest | 

begin
  # Send Airbnb message
  result = api_instance.send_airbnb_message(thread_id, send_airbnb_message_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->send_airbnb_message: #{e}"
end
```

#### Using the send_airbnb_message_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SendAirbnbMessage201Response>, Integer, Hash)> send_airbnb_message_with_http_info(thread_id, send_airbnb_message_request)

```ruby
begin
  # Send Airbnb message
  data, status_code, headers = api_instance.send_airbnb_message_with_http_info(thread_id, send_airbnb_message_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SendAirbnbMessage201Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->send_airbnb_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **thread_id** | **String** | Airbnb thread id (the &#x60;externalThreadId&#x60; on a unified &#x60;Conversation&#x60;). |  |
| **send_airbnb_message_request** | [**SendAirbnbMessageRequest**](SendAirbnbMessageRequest.md) |  |  |

### Return type

[**SendAirbnbMessage201Response**](SendAirbnbMessage201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## set_airbnb_listing_cover_photo

> <SetAirbnbListingCoverPhoto200Response> set_airbnb_listing_cover_photo(id, set_airbnb_listing_cover_photo_request)

Set the Airbnb cover photo

Choose which photo leads the listing. **Write-side** — calls Airbnb upstream.  Airbnb has no \"cover\" field: the cover is the first photo of the tour, so this is a position write. Usually it is a single upstream request — the chosen photo takes a position below the current first one and nothing else moves. When the tour already starts at position 1 and there is no room below it, the tour is renumbered instead, one request per photo whose position actually changes, with the same stop-at-first-failure reporting as `PUT /photos/order` (`applied`, `failed_photo_id`, `not_attempted`; re-send the identical body to finish).  The listing thumbnail — what every list view renders — is repointed at the new cover, so the change is not visible only inside the photo tour.  The photo must already be in our cached copy of the tour; one uploaded since the last sync returns `404`, and `PATCH /photos` can set its position in the meantime.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
set_airbnb_listing_cover_photo_request = Repull::SetAirbnbListingCoverPhotoRequest.new({photo_id: 'photo_id_example'}) # SetAirbnbListingCoverPhotoRequest | 

begin
  # Set the Airbnb cover photo
  result = api_instance.set_airbnb_listing_cover_photo(id, set_airbnb_listing_cover_photo_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->set_airbnb_listing_cover_photo: #{e}"
end
```

#### Using the set_airbnb_listing_cover_photo_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SetAirbnbListingCoverPhoto200Response>, Integer, Hash)> set_airbnb_listing_cover_photo_with_http_info(id, set_airbnb_listing_cover_photo_request)

```ruby
begin
  # Set the Airbnb cover photo
  data, status_code, headers = api_instance.set_airbnb_listing_cover_photo_with_http_info(id, set_airbnb_listing_cover_photo_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SetAirbnbListingCoverPhoto200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->set_airbnb_listing_cover_photo_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **set_airbnb_listing_cover_photo_request** | [**SetAirbnbListingCoverPhotoRequest**](SetAirbnbListingCoverPhotoRequest.md) |  |  |

### Return type

[**SetAirbnbListingCoverPhoto200Response**](SetAirbnbListingCoverPhoto200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## sync_airbnb_transactions

> <SyncAirbnbTransactions200Response> sync_airbnb_transactions(opts)

Sync Airbnb transactions

Refresh the Airbnb transactions mirror for this workspace by pulling from Airbnb upstream and upserting the breakdown that `GET` serves. Optional JSON body `{ start_date, end_date, transaction_type }` (`transaction_type` is `COMPLETED` or `UPCOMING`; both are synced when omitted). Returns `{ synced, count }`.

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
  sync_airbnb_transactions_request: Repull::SyncAirbnbTransactionsRequest.new # SyncAirbnbTransactionsRequest | 
}

begin
  # Sync Airbnb transactions
  result = api_instance.sync_airbnb_transactions(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->sync_airbnb_transactions: #{e}"
end
```

#### Using the sync_airbnb_transactions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SyncAirbnbTransactions200Response>, Integer, Hash)> sync_airbnb_transactions_with_http_info(opts)

```ruby
begin
  # Sync Airbnb transactions
  data, status_code, headers = api_instance.sync_airbnb_transactions_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SyncAirbnbTransactions200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->sync_airbnb_transactions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sync_airbnb_transactions_request** | [**SyncAirbnbTransactionsRequest**](SyncAirbnbTransactionsRequest.md) |  | [optional] |

### Return type

[**SyncAirbnbTransactions200Response**](SyncAirbnbTransactions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_airbnb_booking_settings

> <UpdateAirbnbBookingSettings200Response> update_airbnb_booking_settings(id, update_airbnb_booking_settings_request)

Update Airbnb booking settings

Set any subset of a listing's booking settings on Airbnb. Partial — a field you do not send is left as it is.  `{id}` is the **Repull listing id** (from `GET /v1/properties` or `GET /v1/channels/airbnb/listings`), not the Airbnb listing id; Repull translates it before calling Airbnb.  The body is validated before anything reaches Airbnb, so a bad value is a `422` naming the field rather than a failed upstream call. Unknown fields are refused rather than dropped.  **Two groups, applied in order.** Instant Book, check-in/out and the cancellation fields go to Airbnb's booking-settings resource. Advance notice, preparation time and booking window go to Airbnb's availability rules — Airbnb replaces that whole document, so Repull reads the current rules first and merges your change onto them, which is why setting a preparation time does not blank the listing's min/max nights. The response's `applied` array names the groups that were written.  **Non-refundable is a percentage here, a factor on Airbnb.** Airbnb stores `non_refundable_price_factor` between 0.7 and 1.0; send `cancellation.nonRefundable.discountPercent` (0-30) and Repull converts — 10% becomes 0.9. `enabled: false` sets the factor to 1.0.  **Not exposed by Airbnb:** `preReservationMessage` and `automaticStayExtension`. Sending either returns a `422` explaining where to set it instead.  **Errors:** `403 connection_reauth_required` — Airbnb no longer accepts the connection for this listing (reconnect; retrying won't help). `403 listing_inactive` — the listing is inactive. `404 not_found` — no Airbnb-connected listing with this id in the workspace. `422 invalid_params` — the body is wrong; `field` names it. `422 airbnb_rejected` — Airbnb refused the change; `message` carries its reason. `429 airbnb_rate_limited` — back off. `502 airbnb_error` — Airbnb outage or timeout; retry.

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
id = 'id_example' # String | Repull listing id (numeric string), not the Airbnb listing id.
update_airbnb_booking_settings_request = Repull::UpdateAirbnbBookingSettingsRequest.new # UpdateAirbnbBookingSettingsRequest | 

begin
  # Update Airbnb booking settings
  result = api_instance.update_airbnb_booking_settings(id, update_airbnb_booking_settings_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_booking_settings: #{e}"
end
```

#### Using the update_airbnb_booking_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateAirbnbBookingSettings200Response>, Integer, Hash)> update_airbnb_booking_settings_with_http_info(id, update_airbnb_booking_settings_request)

```ruby
begin
  # Update Airbnb booking settings
  data, status_code, headers = api_instance.update_airbnb_booking_settings_with_http_info(id, update_airbnb_booking_settings_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateAirbnbBookingSettings200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_booking_settings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string), not the Airbnb listing id. |  |
| **update_airbnb_booking_settings_request** | [**UpdateAirbnbBookingSettingsRequest**](UpdateAirbnbBookingSettingsRequest.md) |  |  |

### Return type

[**UpdateAirbnbBookingSettings200Response**](UpdateAirbnbBookingSettings200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_airbnb_checkin_guide

> update_airbnb_checkin_guide(id, opts)

Upsert Airbnb check-in guide

Upsert the check-in guide for one locale on an Airbnb listing. **Write-side** — calls Airbnb upstream; the DB mirror is reconciled by the sync worker once the upstream call returns. Target the locale with `?locale=en` (defaults to `en`). Requires a connected Airbnb host, else `404 no_connection`.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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


## update_airbnb_listing_amenities

> <UpdateAirbnbListingAmenities200Response> update_airbnb_listing_amenities(id, update_airbnb_listing_amenities_request)

Update Airbnb amenities

Set amenities on an Airbnb listing. **Write-side** — calls Airbnb upstream.  **Partial by design**: only the amenities you name change, so turning one off is a one-line body and nothing else on the listing moves. Ids are the `id` values `GET /amenities` returns (e.g. `wireless_internet`, `ac`, `kitchen`); case is ignored. Airbnb refuses ids outside its vocabulary — that comes back as `422 airbnb_rejected` carrying Airbnb's own message.  `accessibility_amenities` go to Airbnb's separate accessibility resource, which has **no read side at all** — Airbnb offers no endpoint to fetch them back, and the combined amenities GET 404s on production listings. What you can read back is our own copy: this endpoint updates it on success, and `GET /amenities` returns it under `accessibilityAmenities`. Airbnb may also hold an accessibility claim for review until photo evidence is attached; pass `photo_ids` to supply it.  Our Airbnb copy is updated on success so a read straight after this write returns the new values. The platform-neutral copy behind `GET /v1/listings/{id}?include=amenities` uses a different amenity vocabulary and is refreshed by the next sync, except where an id happens to be identical in both.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
update_airbnb_listing_amenities_request = Repull::UpdateAirbnbListingAmenitiesRequest.new # UpdateAirbnbListingAmenitiesRequest | 

begin
  # Update Airbnb amenities
  result = api_instance.update_airbnb_listing_amenities(id, update_airbnb_listing_amenities_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_amenities: #{e}"
end
```

#### Using the update_airbnb_listing_amenities_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateAirbnbListingAmenities200Response>, Integer, Hash)> update_airbnb_listing_amenities_with_http_info(id, update_airbnb_listing_amenities_request)

```ruby
begin
  # Update Airbnb amenities
  data, status_code, headers = api_instance.update_airbnb_listing_amenities_with_http_info(id, update_airbnb_listing_amenities_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateAirbnbListingAmenities200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_amenities_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **update_airbnb_listing_amenities_request** | [**UpdateAirbnbListingAmenitiesRequest**](UpdateAirbnbListingAmenitiesRequest.md) |  |  |

### Return type

[**UpdateAirbnbListingAmenities200Response**](UpdateAirbnbListingAmenities200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_airbnb_listing_availability

> update_airbnb_listing_availability(id, airbnb_availability_write_request)

Update Airbnb availability

Push availability + restrictions to Airbnb. `type: \"calendar\"` writes per-date restrictions — min/max nights, closed-to-arrival, closed-to-departure, and stop-sell (`availability: \"unavailable\"`) — via a batch of operations that each target either a date range or an explicit date list. `type: \"rules\"` writes listing-level availability rules (default min/max nights, booking lead time, turnover days, seasonal/day-of-week min nights). Restrictions never leak across channels — this endpoint writes only to Airbnb.  `{id}` is the **Repull listing id** (from `GET /v1/properties` or `GET /v1/channels/airbnb/listings`), not the Airbnb listing id — Repull translates it before calling Airbnb.  The body is validated before anything reaches Airbnb: a malformed body is `422 invalid_params` naming the `field`. Calendar operations accept only the documented fields.  **Blocking dates:** Airbnb requires a `busy_subtype` whenever `availability` is `\"unavailable\"`. If an operation leaves it out, Repull sends `busy_subtype: \"BLOCKED_BY_HOST\"`; send `\"OUTSIDE_RESERVATION\"` for dates held by a booking made on another channel.  **Errors:** `403 listing_not_api_connected` — Airbnb was never told to sync this listing (its `syncCategory` is `none`); the host must switch API sync on for it in Airbnb, reconnecting the account will not help. `403 connection_reauth_required` — Airbnb no longer accepts the connection at all (reconnect; retrying won't help). `403 listing_inactive` — the listing is inactive. `404 not_found` — no Airbnb-connected listing with this id in the workspace. `422 airbnb_rejected` — Airbnb refused the change; `message` carries its reason. `429 airbnb_rate_limited` — back off. `502 airbnb_error` — Airbnb outage or timeout; retry.

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
- **Accept**: application/json


## update_airbnb_listing_description

> <AirbnbContentWriteResponse> update_airbnb_listing_description(id, airbnb_description_write_request, opts)

Update an Airbnb description for one locale

Write one locale's copy to the live Airbnb listing.  Airbnb keeps a SEPARATE description per locale (`PUT /v2/listing_descriptions/{listingId}/{locale}`), which is why `locale` is part of the request and not a guess: a listing can carry twelve of them, and writing Italian copy into the English row is how a translation gets lost. Only the fields you send are written; Airbnb keeps the rest. `GET /v1/channels/airbnb/listings/{id}/settings?type=locales` lists the locales already synced for the listing.  `description` is not an accepted field: Airbnb composes the public description from the sections (`summary`, `space`, `access`, …) and ignores a directly-supplied one.  **A 200 does not by itself mean the change was applied.** On an established listing Airbnb LOCKS host-managed description fields — the write returns 200, reports them as locked, and applies nothing for them. The response reports `blockedFields`: the fields YOU sent that Airbnb dropped. `blockedFields: []` is what a landed write looks like; a non-empty list is still a 200 (the other fields really were written) with a `message` naming what was not. Reporting that as a clean success is the bug behind \"the description does not push to Airbnb\".  This writes to AIRBNB. To write Repull's own canonical copy — the content a later publish distributes — use `PUT /v1/listings/{id}/content` with `locale`.  Send `Idempotency-Key` to make a retry safe.  Returns `403 listing_inactive` when the listing is inactive.

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
airbnb_description_write_request = Repull::AirbnbDescriptionWriteRequest.new({locale: 'it', description: Repull::AirbnbDescriptionWriteRequestDescription.new}) # AirbnbDescriptionWriteRequest | 
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Update an Airbnb description for one locale
  result = api_instance.update_airbnb_listing_description(id, airbnb_description_write_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_description: #{e}"
end
```

#### Using the update_airbnb_listing_description_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbContentWriteResponse>, Integer, Hash)> update_airbnb_listing_description_with_http_info(id, airbnb_description_write_request, opts)

```ruby
begin
  # Update an Airbnb description for one locale
  data, status_code, headers = api_instance.update_airbnb_listing_description_with_http_info(id, airbnb_description_write_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbContentWriteResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_description_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **airbnb_description_write_request** | [**AirbnbDescriptionWriteRequest**](AirbnbDescriptionWriteRequest.md) |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**AirbnbContentWriteResponse**](AirbnbContentWriteResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_airbnb_listing_details

> <AirbnbContentWriteResponse> update_airbnb_listing_details(id, airbnb_listing_details_write_request, opts)

Update property type, room type, quiet hours or check-in method

Change what kind of property the Airbnb listing is, when its quiet hours are, or how the guest gets in. Partial: only the fields you send are written. At least one required; an unknown field is refused by name rather than dropped.  This is the UPDATE path for fields that previously had none. `POST /v1/listings` accepts a `propertyType` when a listing is CREATED and nothing could change it afterwards, so a listing mis-typed at import stayed mis-typed; the check-in method was mirrored and never exposed at all.  **A 200 does not by itself mean the change was applied.** `property_type_category`, `property_type_group` and `check_in_option` are among the attributes Airbnb locks on established listings: the write returns 200, and Airbnb applies nothing for the locked ones. The response reports `blockedFields` — the fields YOU sent that Airbnb dropped — and `blockedFields: []` is what a landed write looks like. `GET …/details` reports the same list as `lockedFields` so you can check first.  Canonical property type (the value Repull keeps and republishes) is set with `PUT /v1/listings/{id}/content` under `details`; this endpoint writes straight to Airbnb.  Send `Idempotency-Key` to make a retry safe.

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
airbnb_listing_details_write_request = Repull::AirbnbListingDetailsWriteRequest.new # AirbnbListingDetailsWriteRequest | 
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Update property type, room type, quiet hours or check-in method
  result = api_instance.update_airbnb_listing_details(id, airbnb_listing_details_write_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_details: #{e}"
end
```

#### Using the update_airbnb_listing_details_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbContentWriteResponse>, Integer, Hash)> update_airbnb_listing_details_with_http_info(id, airbnb_listing_details_write_request, opts)

```ruby
begin
  # Update property type, room type, quiet hours or check-in method
  data, status_code, headers = api_instance.update_airbnb_listing_details_with_http_info(id, airbnb_listing_details_write_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbContentWriteResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_details_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **airbnb_listing_details_write_request** | [**AirbnbListingDetailsWriteRequest**](AirbnbListingDetailsWriteRequest.md) |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**AirbnbContentWriteResponse**](AirbnbContentWriteResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_airbnb_listing_permits

> <UpdateAirbnbListingPermits200Response> update_airbnb_listing_permits(id, airbnb_permits_write_request, opts)

Answer Airbnb permit questions

Answer the regulatory permit questions for a listing — the licence or registration number a city requires to keep the listing up.  Read the questions first with `GET …/permits?source=live`. For each permit, pick one of its `flows[]` and send its `slug` as `flow_slug`; key every answer by the question's `answer_key`, and let the question's `type` decide the value field (`text_value`, `attestation_value`, `radio_value`, `date_value` or `selected_options_value`). Answers are forwarded verbatim — nothing is defaulted or inferred, because a wrong licence number can take a listing down in a regulated city.  Send `Idempotency-Key`: a timeout here leaves you unable to tell \"never arrived\" from \"arrived, response lost\", and this is a compliance filing.  Airbnb refusing the answers (an unknown `answer_key`, a malformed licence number) is `422 airbnb_rejected` carrying Airbnb's own reason. An expired or revoked Airbnb connection is `403 connection_reauth_required`.

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
airbnb_permits_write_request = Repull::AirbnbPermitsWriteRequest.new({permits: [Repull::AirbnbPermitsWriteRequestPermitsInner.new({regulatory_body: 'regulatory_body_example', regulation_type: 'regulation_type_example', flow_slug: 'flow_slug_example', answers: { key: Repull::AirbnbPermitsWriteRequestPermitsInnerAnswersValue.new}})]}) # AirbnbPermitsWriteRequest | 
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Answer Airbnb permit questions
  result = api_instance.update_airbnb_listing_permits(id, airbnb_permits_write_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_permits: #{e}"
end
```

#### Using the update_airbnb_listing_permits_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateAirbnbListingPermits200Response>, Integer, Hash)> update_airbnb_listing_permits_with_http_info(id, airbnb_permits_write_request, opts)

```ruby
begin
  # Answer Airbnb permit questions
  data, status_code, headers = api_instance.update_airbnb_listing_permits_with_http_info(id, airbnb_permits_write_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateAirbnbListingPermits200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_permits_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **airbnb_permits_write_request** | [**AirbnbPermitsWriteRequest**](AirbnbPermitsWriteRequest.md) |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**UpdateAirbnbListingPermits200Response**](UpdateAirbnbListingPermits200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_airbnb_listing_photo

> <UpdateAirbnbListingPhoto200Response> update_airbnb_listing_photo(id, update_airbnb_listing_photo_request)

Update an Airbnb photo

Change one photo's caption, its position in the tour, the room it is filed under, or its metadata. **Write-side** — calls Airbnb upstream.  Airbnb's photo endpoints are keyed by photo id alone, so the photo is proven to belong to the listing named in the path before anything is sent; a photo from another listing returns `404`, the same answer a photo that does not exist gets.  On success both stored copies are updated — the Airbnb mirror `GET /photos` serves AND the canonical photo tour behind `GET /v1/listings/{id}` — so a read straight after this write returns the new value instead of waiting for the next sync. `stored` says whether that succeeded; `false` means Airbnb accepted the change but our copy will only catch up at the next sync.  To move several photos at once use `PUT /photos/order`: it is one call instead of N, it validates the whole order before writing anything, and it reports exactly what landed if Airbnb refuses part-way.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
update_airbnb_listing_photo_request = Repull::UpdateAirbnbListingPhotoRequest.new({photo_id: 'photo_id_example'}) # UpdateAirbnbListingPhotoRequest | 

begin
  # Update an Airbnb photo
  result = api_instance.update_airbnb_listing_photo(id, update_airbnb_listing_photo_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_photo: #{e}"
end
```

#### Using the update_airbnb_listing_photo_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateAirbnbListingPhoto200Response>, Integer, Hash)> update_airbnb_listing_photo_with_http_info(id, update_airbnb_listing_photo_request)

```ruby
begin
  # Update an Airbnb photo
  data, status_code, headers = api_instance.update_airbnb_listing_photo_with_http_info(id, update_airbnb_listing_photo_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateAirbnbListingPhoto200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_photo_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **update_airbnb_listing_photo_request** | [**UpdateAirbnbListingPhotoRequest**](UpdateAirbnbListingPhotoRequest.md) |  |  |

### Return type

[**UpdateAirbnbListingPhoto200Response**](UpdateAirbnbListingPhoto200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_airbnb_listing_pricing

> update_airbnb_listing_pricing(id, airbnb_pricing_write_request)

Update Airbnb pricing

Push pricing changes to Airbnb. The `type` discriminator selects the sub-resource (model, standard settings, LOS, rate-plan, fees, currency, rule, or per-date `calendar`). `type: \"calendar\"` carries the full per-date restriction set — nightly price, min/max nights, closed-to-arrival, closed-to-departure, and stop-sell (`availability: \"unavailable\"`). For settings sub-resources the full object is replaced — GET first, mutate locally, then PUT the whole object.  `{id}` is the **Repull listing id** (from `GET /v1/properties` or `GET /v1/channels/airbnb/listings`), not the Airbnb listing id — Repull translates it before calling Airbnb.  The body is validated before anything reaches Airbnb: a malformed body is `422 invalid_params` naming the `field`. Calendar operations accept only the documented fields.  **Blocking dates:** Airbnb requires a `busy_subtype` whenever `availability` is `\"unavailable\"`. If an operation leaves it out, Repull sends `busy_subtype: \"BLOCKED_BY_HOST\"`; send `\"OUTSIDE_RESERVATION\"` for dates held by a booking made on another channel.  **Errors:** `403 listing_not_api_connected` — Airbnb was never told to sync this listing (its `syncCategory` is `none`); the host must switch API sync on for it in Airbnb, reconnecting the account will not help. `403 connection_reauth_required` — Airbnb no longer accepts the connection at all (reconnect; retrying won't help). `403 listing_inactive` — the listing is inactive. `404 not_found` — no Airbnb-connected listing with this id in the workspace. `422 airbnb_rejected` — Airbnb refused the change; `message` carries its reason. `429 airbnb_rate_limited` — back off. `502 airbnb_error` — Airbnb outage or timeout; retry.

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
- **Accept**: application/json


## update_airbnb_listing_room

> <UpdateAirbnbListingRoom200Response> update_airbnb_listing_room(id, room_id, update_airbnb_listing_room_request)

Update an Airbnb room

Change a room's type, number, privacy or sleeping arrangement. **Write-side** — calls Airbnb upstream. Pass the Airbnb-side room id as `?roomId=` and send only the fields you want to change.  `beds` REPLACES the room's whole arrangement — that is Airbnb's semantics for the field — so send every bed the room has, not just the changed one.  Airbnb's room endpoints are keyed by room id alone, so the room is proven to belong to the listing named in the path before anything is sent; a room from another listing returns `404`, the same answer a room that does not exist gets.  On success both stored copies are rebuilt to match, so a read straight after this write returns the new arrangement. `stored` says whether that succeeded.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
room_id = 'room_id_example' # String | Airbnb-side room id to update.
update_airbnb_listing_room_request = Repull::UpdateAirbnbListingRoomRequest.new # UpdateAirbnbListingRoomRequest | 

begin
  # Update an Airbnb room
  result = api_instance.update_airbnb_listing_room(id, room_id, update_airbnb_listing_room_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_room: #{e}"
end
```

#### Using the update_airbnb_listing_room_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateAirbnbListingRoom200Response>, Integer, Hash)> update_airbnb_listing_room_with_http_info(id, room_id, update_airbnb_listing_room_request)

```ruby
begin
  # Update an Airbnb room
  data, status_code, headers = api_instance.update_airbnb_listing_room_with_http_info(id, room_id, update_airbnb_listing_room_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateAirbnbListingRoom200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_room_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **room_id** | **String** | Airbnb-side room id to update. |  |
| **update_airbnb_listing_room_request** | [**UpdateAirbnbListingRoomRequest**](UpdateAirbnbListingRoomRequest.md) |  |  |

### Return type

[**UpdateAirbnbListingRoom200Response**](UpdateAirbnbListingRoom200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_airbnb_listing_safety_disclosures

> <UpdateAirbnbListingSafetyDisclosures200Response> update_airbnb_listing_safety_disclosures(id, airbnb_safety_disclosures_write_request, opts)

Update guest-safety disclosures

Declare or retract the guest-safety disclosures on the live Airbnb listing.  **This is a MERGE, not a replacement.** Airbnb keeps one value per disclosure type: a type you leave out keeps the value it has, and to retract one you send it with `value: false`. A full replacement would let a partial request silently un-declare a security camera — a guest-safety statement, not a preference.  Only the disclosures are sent upstream. The same Airbnb endpoint carries the cancellation policy and instant-book settings, and this endpoint never touches them.  Send `Idempotency-Key` to make a retry safe.  Airbnb refusing the change is `422 airbnb_rejected` with Airbnb's own reason; an expired or revoked connection is `403 connection_reauth_required`.

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
airbnb_safety_disclosures_write_request = Repull::AirbnbSafetyDisclosuresWriteRequest.new({disclosures: [Repull::AirbnbSafetyDisclosure.new({type: 'type_example', value: false})]}) # AirbnbSafetyDisclosuresWriteRequest | 
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Update guest-safety disclosures
  result = api_instance.update_airbnb_listing_safety_disclosures(id, airbnb_safety_disclosures_write_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_safety_disclosures: #{e}"
end
```

#### Using the update_airbnb_listing_safety_disclosures_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateAirbnbListingSafetyDisclosures200Response>, Integer, Hash)> update_airbnb_listing_safety_disclosures_with_http_info(id, airbnb_safety_disclosures_write_request, opts)

```ruby
begin
  # Update guest-safety disclosures
  data, status_code, headers = api_instance.update_airbnb_listing_safety_disclosures_with_http_info(id, airbnb_safety_disclosures_write_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateAirbnbListingSafetyDisclosures200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_safety_disclosures_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **airbnb_safety_disclosures_write_request** | [**AirbnbSafetyDisclosuresWriteRequest**](AirbnbSafetyDisclosuresWriteRequest.md) |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**UpdateAirbnbListingSafetyDisclosures200Response**](UpdateAirbnbListingSafetyDisclosures200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_airbnb_message

> update_airbnb_message(thread_id, message_id, update_airbnb_message_request)

Edit / react to / mark an Airbnb message

Act on a single message in an Airbnb thread. **Write-side** — calls Airbnb upstream. The `action` discriminator selects the operation:  - `edit` — replace message text (requires `message`). - `unsend` — retract the message. - `read` — mark the message as read. - `react` — add a reaction (requires `reaction`).  Requires a connected Airbnb host, else `404 no_connection`.  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

> upload_airbnb_listing_photos(id, upload_airbnb_listing_photos_request)

Upload photos to Airbnb

Upload one or more photos to an Airbnb listing.  `image` is base64 image DATA, not a url — a `data:image/jpeg;base64,…` prefix is accepted and stripped, and the decoded image must be under 25 MB. (This operation previously documented public image urls that Airbnb would fetch. It never did: a url arrived at Airbnb as a ~60-byte image.)  Airbnb assigns the photo id and CDN urls, so the newly uploaded photos appear in `GET /photos` after the next sync. Caption, order and room assignment can be set straight away with `PATCH /photos`, `PUT /photos/order` and `PUT /photos/cover`.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
upload_airbnb_listing_photos_request = Repull::UploadAirbnbListingPhotosRequest.new({photos: [Repull::UploadAirbnbListingPhotosRequestPhotosInner.new({image: 'image_example'})]}) # UploadAirbnbListingPhotosRequest | 

begin
  # Upload photos to Airbnb
  api_instance.upload_airbnb_listing_photos(id, upload_airbnb_listing_photos_request)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->upload_airbnb_listing_photos: #{e}"
end
```

#### Using the upload_airbnb_listing_photos_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> upload_airbnb_listing_photos_with_http_info(id, upload_airbnb_listing_photos_request)

```ruby
begin
  # Upload photos to Airbnb
  data, status_code, headers = api_instance.upload_airbnb_listing_photos_with_http_info(id, upload_airbnb_listing_photos_request)
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
| **upload_airbnb_listing_photos_request** | [**UploadAirbnbListingPhotosRequest**](UploadAirbnbListingPhotosRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## withdraw_airbnb_offer

> <GetAirbnbOffer200Response> withdraw_airbnb_offer(offer_id)

Withdraw Airbnb special offer

Withdraw a special offer the guest has not booked. **Write-side** — calls Airbnb upstream. Pass the Airbnb offer id as `?offerId=`. The Repull-id equivalent is `DELETE /v1/conversations/{id}/special-offers/{offerId}`.

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
offer_id = 'offer_id_example' # String | Airbnb special-offer id (the `id` Airbnb returned when the offer was created).

begin
  # Withdraw Airbnb special offer
  result = api_instance.withdraw_airbnb_offer(offer_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->withdraw_airbnb_offer: #{e}"
end
```

#### Using the withdraw_airbnb_offer_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAirbnbOffer200Response>, Integer, Hash)> withdraw_airbnb_offer_with_http_info(offer_id)

```ruby
begin
  # Withdraw Airbnb special offer
  data, status_code, headers = api_instance.withdraw_airbnb_offer_with_http_info(offer_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAirbnbOffer200Response>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->withdraw_airbnb_offer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offer_id** | **String** | Airbnb special-offer id (the &#x60;id&#x60; Airbnb returned when the offer was created). |  |

### Return type

[**GetAirbnbOffer200Response**](GetAirbnbOffer200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

