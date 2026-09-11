# Repull::ConnectApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**booking_connect_callback**](ConnectApi.md#booking_connect_callback) | **POST** /v1/connect/booking/callback | Booking.com connectivity callback |
| [**create_connect_session**](ConnectApi.md#create_connect_session) | **POST** /v1/connect | Create a multi-channel Connect picker session |
| [**create_connection**](ConnectApi.md#create_connection) | **POST** /v1/connect/{provider} | Connect to PMS/OTA provider |
| [**delete_connection**](ConnectApi.md#delete_connection) | **DELETE** /v1/connect/{provider} | Disconnect provider |
| [**get_connect_status**](ConnectApi.md#get_connect_status) | **GET** /v1/connect/{provider} | Get connection status |
| [**list_connect_booking_rooms**](ConnectApi.md#list_connect_booking_rooms) | **GET** /v1/connect/booking/rooms | List Booking.com rooms imported for a Connect session |
| [**list_connect_providers**](ConnectApi.md#list_connect_providers) | **GET** /v1/connect/providers | List Connect channels |
| [**list_connections**](ConnectApi.md#list_connections) | **GET** /v1/connect | List PMS/OTA connections |
| [**map_connect_booking_rooms**](ConnectApi.md#map_connect_booking_rooms) | **POST** /v1/connect/booking/map-rooms | Submit room→listing mappings for a Booking.com Connect session |
| [**select_connect_provider**](ConnectApi.md#select_connect_provider) | **POST** /v1/connect/sessions/{sessionId}/select-provider | Bind a picker session to a provider |
| [**submit_beds24_credentials**](ConnectApi.md#submit_beds24_credentials) | **POST** /v1/connect/beds24/credentials | Submit Beds24 credentials for a Connect session |
| [**submit_bookingsync_credentials**](ConnectApi.md#submit_bookingsync_credentials) | **POST** /v1/connect/bookingsync/credentials | Submit BookingSync credentials for a Connect session |
| [**submit_guesty_credentials**](ConnectApi.md#submit_guesty_credentials) | **POST** /v1/connect/guesty/credentials | Submit Guesty credentials for a Connect session |
| [**submit_hospitable_credentials**](ConnectApi.md#submit_hospitable_credentials) | **POST** /v1/connect/hospitable/credentials | Submit Hospitable credentials for a Connect session |
| [**submit_hostaway_credentials**](ConnectApi.md#submit_hostaway_credentials) | **POST** /v1/connect/hostaway/credentials | Submit Hostaway credentials for a Connect session |
| [**submit_igms_credentials**](ConnectApi.md#submit_igms_credentials) | **POST** /v1/connect/igms/credentials | Submit iGMS credentials for a Connect session |
| [**submit_lodgify_credentials**](ConnectApi.md#submit_lodgify_credentials) | **POST** /v1/connect/lodgify/credentials | Submit Lodgify credentials for a Connect session |
| [**submit_ownerrez_credentials**](ConnectApi.md#submit_ownerrez_credentials) | **POST** /v1/connect/ownerrez/credentials | Submit OwnerRez credentials for a Connect session |
| [**submit_smoobu_credentials**](ConnectApi.md#submit_smoobu_credentials) | **POST** /v1/connect/smoobu/credentials | Submit Smoobu credentials for a Connect session |
| [**submit_vrbo_credentials**](ConnectApi.md#submit_vrbo_credentials) | **POST** /v1/connect/vrbo/credentials | Submit Vrbo credentials for a Connect session |
| [**verify_booking_hotel**](ConnectApi.md#verify_booking_hotel) | **POST** /v1/connect/booking/verify | Verify a Booking.com hotel ID for a Connect session |


## booking_connect_callback

> booking_connect_callback(request_body)

Booking.com connectivity callback

Receives Booking.com's asynchronous confirmation that a property has designated Repull as its connectivity provider, and advances the Connect session. Called by Booking.com, not by integrators.

### Examples

```ruby
require 'time'
require 'repull'

api_instance = Repull::ConnectApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Booking.com connectivity callback
  api_instance.booking_connect_callback(request_body)
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->booking_connect_callback: #{e}"
end
```

#### Using the booking_connect_callback_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> booking_connect_callback_with_http_info(request_body)

```ruby
begin
  # Booking.com connectivity callback
  data, status_code, headers = api_instance.booking_connect_callback_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->booking_connect_callback_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_connect_session

> <ConnectSession> create_connect_session(create_connect_session_request)

Create a multi-channel Connect picker session

Mints a session that lands the user on the channel picker at `connect.repull.dev/{sessionId}` instead of jumping straight to a single provider. The user picks a channel from the registry, the picker page POSTs `selectConnectProvider` to bind the choice, and the per-provider flow takes over.  Use this when you want one entry point for all 13 channels. Use `POST /v1/connect/{provider}` instead when your UI already knows which channel to connect.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
create_connect_session_request = Repull::CreateConnectSessionRequest.new({redirect_url: 'redirect_url_example'}) # CreateConnectSessionRequest | 

begin
  # Create a multi-channel Connect picker session
  result = api_instance.create_connect_session(create_connect_session_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->create_connect_session: #{e}"
end
```

#### Using the create_connect_session_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConnectSession>, Integer, Hash)> create_connect_session_with_http_info(create_connect_session_request)

```ruby
begin
  # Create a multi-channel Connect picker session
  data, status_code, headers = api_instance.create_connect_session_with_http_info(create_connect_session_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConnectSession>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->create_connect_session_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_connect_session_request** | [**CreateConnectSessionRequest**](CreateConnectSessionRequest.md) |  |  |

### Return type

[**ConnectSession**](ConnectSession.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_connection

> <Connection> create_connection(provider, opts)

Connect to PMS/OTA provider

Establish a connection to a PMS or OTA platform. Credentials vary by provider — see docs for each provider.  Airbnb-specific: pass `redirectUrl` (where to send the user after consent) and optionally `accessType`. Three tiers: `read_only` grants read-only scopes; `messaging` grants read scopes plus message read/send but NOT property management, so it can coexist with another app (e.g. an existing PMS) that already holds property management on the same Airbnb account; `full_access` — the default — grants full host scopes including the exclusive property management (only one app per Airbnb account can hold it). The response returns a hosted `url` to redirect the user to.  Booking.com: pass `redirectUrl` (no `accessType`). The response returns a hosted `url` — send the user there to designate FantasticStay in their Booking.com Extranet and paste their Hotel ID. Same response shape as Airbnb (`url`, `sessionId`, `expiresAt`).  PMS providers (api-key based) pass `apiKey` instead; Plumguide passes `clientId`/`clientSecret`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
provider = 'provider_example' # String | PMS provider slug (e.g., hostaway, guesty, ownerrez)
opts = {
  create_connection_request: Repull::CreateConnectionRequest.new # CreateConnectionRequest | 
}

begin
  # Connect to PMS/OTA provider
  result = api_instance.create_connection(provider, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->create_connection: #{e}"
end
```

#### Using the create_connection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Connection>, Integer, Hash)> create_connection_with_http_info(provider, opts)

```ruby
begin
  # Connect to PMS/OTA provider
  data, status_code, headers = api_instance.create_connection_with_http_info(provider, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Connection>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->create_connection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** | PMS provider slug (e.g., hostaway, guesty, ownerrez) |  |
| **create_connection_request** | [**CreateConnectionRequest**](CreateConnectionRequest.md) |  | [optional] |

### Return type

[**Connection**](Connection.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_connection

> delete_connection(provider)

Disconnect provider

Disconnect a PMS or OTA from this workspace.  Currently supported for `booking` only: drops the stored connection and stops syncing the mapped rooms. Resources already synced remain queryable but become read-only and stop receiving updates.  Every other provider returns `501 not_implemented` with instructions for disconnecting on the provider's side — Airbnb in particular has to be revoked by the host (Account → Privacy & sharing → Connected apps), because the OAuth grant lives outside this service. The endpoint used to report `200 { disconnected: true }` for every provider while doing nothing; it now tells you the truth.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
provider = 'provider_example' # String | PMS provider slug (e.g., hostaway, guesty, ownerrez)

begin
  # Disconnect provider
  api_instance.delete_connection(provider)
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->delete_connection: #{e}"
end
```

#### Using the delete_connection_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_connection_with_http_info(provider)

```ruby
begin
  # Disconnect provider
  data, status_code, headers = api_instance.delete_connection_with_http_info(provider)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->delete_connection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** | PMS provider slug (e.g., hostaway, guesty, ownerrez) |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_connect_status

> <ConnectStatus> get_connect_status(provider)

Get connection status

Returns the current connection status for a provider, including host metadata (display name + avatar) for Airbnb so clients can render an account-level confirmation UI.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
provider = 'provider_example' # String | PMS provider slug (e.g., hostaway, guesty, ownerrez)

begin
  # Get connection status
  result = api_instance.get_connect_status(provider)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->get_connect_status: #{e}"
end
```

#### Using the get_connect_status_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConnectStatus>, Integer, Hash)> get_connect_status_with_http_info(provider)

```ruby
begin
  # Get connection status
  data, status_code, headers = api_instance.get_connect_status_with_http_info(provider)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConnectStatus>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->get_connect_status_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** | PMS provider slug (e.g., hostaway, guesty, ownerrez) |  |

### Return type

[**ConnectStatus**](ConnectStatus.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_connect_booking_rooms

> <BookingConnectRoomsResponse> list_connect_booking_rooms(session_id)

List Booking.com rooms imported for a Connect session

Returns the rooms imported from the Booking.com hotel claimed in this Connect session, plus the customer's listing options for the mapping dropdowns. Hosted-picker pages poll this endpoint every ~2s after `verifyBookingHotel` succeeds; once rooms appear the page transitions to the mapping UI.  No API key required — the `sessionId` query param is the capability token.

### Examples

```ruby
require 'time'
require 'repull'

api_instance = Repull::ConnectApi.new
session_id = 'session_id_example' # String | The Connect session ID returned by `createConnectSession`.

begin
  # List Booking.com rooms imported for a Connect session
  result = api_instance.list_connect_booking_rooms(session_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->list_connect_booking_rooms: #{e}"
end
```

#### Using the list_connect_booking_rooms_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BookingConnectRoomsResponse>, Integer, Hash)> list_connect_booking_rooms_with_http_info(session_id)

```ruby
begin
  # List Booking.com rooms imported for a Connect session
  data, status_code, headers = api_instance.list_connect_booking_rooms_with_http_info(session_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BookingConnectRoomsResponse>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->list_connect_booking_rooms_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | The Connect session ID returned by &#x60;createConnectSession&#x60;. |  |

### Return type

[**BookingConnectRoomsResponse**](BookingConnectRoomsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_connect_providers

> <ConnectProviderListResponse> list_connect_providers

List Connect channels

Returns the public registry of every channel the picker supports. No customer-specific data — display metadata only. Cached for 5 minutes at the edge.

### Examples

```ruby
require 'time'
require 'repull'

api_instance = Repull::ConnectApi.new

begin
  # List Connect channels
  result = api_instance.list_connect_providers
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->list_connect_providers: #{e}"
end
```

#### Using the list_connect_providers_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConnectProviderListResponse>, Integer, Hash)> list_connect_providers_with_http_info

```ruby
begin
  # List Connect channels
  data, status_code, headers = api_instance.list_connect_providers_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConnectProviderListResponse>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->list_connect_providers_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ConnectProviderListResponse**](ConnectProviderListResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_connections

> <ConnectionListResponse> list_connections

List PMS/OTA connections

Returns all active connections to PMS and OTA platforms.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new

begin
  # List PMS/OTA connections
  result = api_instance.list_connections
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->list_connections: #{e}"
end
```

#### Using the list_connections_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConnectionListResponse>, Integer, Hash)> list_connections_with_http_info

```ruby
begin
  # List PMS/OTA connections
  data, status_code, headers = api_instance.list_connections_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConnectionListResponse>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->list_connections_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ConnectionListResponse**](ConnectionListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## map_connect_booking_rooms

> <MapConnectBookingRoomsResponse> map_connect_booking_rooms(map_connect_booking_rooms_request)

Submit room→listing mappings for a Booking.com Connect session

Submits the customer's room→listing mapping choices in one transaction. For each mapping, updates `listings_booking_rooms.listing_id` and replaces the corresponding `listing_platform_links` row. Pass `listingId: null` to explicitly unmap a room.  On success the Connect session is marked `completed` and the hosted picker page emits a `repull:connect:completed` postMessage to the embedding window.  No API key required — the `sessionId` in the body is the capability token. Each mapping's `roomId` must belong to the customer's claimed hotel; mismatched IDs are rejected with 403.

### Examples

```ruby
require 'time'
require 'repull'

api_instance = Repull::ConnectApi.new
map_connect_booking_rooms_request = Repull::MapConnectBookingRoomsRequest.new({session_id: 'session_id_example', mappings: [Repull::BookingRoomMapping.new({room_id: 'room_id_example'})]}) # MapConnectBookingRoomsRequest | 

begin
  # Submit room→listing mappings for a Booking.com Connect session
  result = api_instance.map_connect_booking_rooms(map_connect_booking_rooms_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->map_connect_booking_rooms: #{e}"
end
```

#### Using the map_connect_booking_rooms_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MapConnectBookingRoomsResponse>, Integer, Hash)> map_connect_booking_rooms_with_http_info(map_connect_booking_rooms_request)

```ruby
begin
  # Submit room→listing mappings for a Booking.com Connect session
  data, status_code, headers = api_instance.map_connect_booking_rooms_with_http_info(map_connect_booking_rooms_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MapConnectBookingRoomsResponse>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->map_connect_booking_rooms_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **map_connect_booking_rooms_request** | [**MapConnectBookingRoomsRequest**](MapConnectBookingRoomsRequest.md) |  |  |

### Return type

[**MapConnectBookingRoomsResponse**](MapConnectBookingRoomsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## select_connect_provider

> <SelectProviderResponse> select_connect_provider(session_id, select_connect_provider_request)

Bind a picker session to a provider

Called by the hosted picker page once the user clicks a channel card. Validates the provider exists and is permitted by the session's `allowed_providers` whitelist (if any), then returns the next-step URL the picker should navigate to.  No API key required — the session ID is the capability token. The session must still be pending and unexpired.

### Examples

```ruby
require 'time'
require 'repull'

api_instance = Repull::ConnectApi.new
session_id = 'session_id_example' # String | The picker session ID returned by `createConnectSession`.
select_connect_provider_request = Repull::SelectConnectProviderRequest.new({provider: 'airbnb'}) # SelectConnectProviderRequest | 

begin
  # Bind a picker session to a provider
  result = api_instance.select_connect_provider(session_id, select_connect_provider_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->select_connect_provider: #{e}"
end
```

#### Using the select_connect_provider_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SelectProviderResponse>, Integer, Hash)> select_connect_provider_with_http_info(session_id, select_connect_provider_request)

```ruby
begin
  # Bind a picker session to a provider
  data, status_code, headers = api_instance.select_connect_provider_with_http_info(session_id, select_connect_provider_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SelectProviderResponse>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->select_connect_provider_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | The picker session ID returned by &#x60;createConnectSession&#x60;. |  |
| **select_connect_provider_request** | [**SelectConnectProviderRequest**](SelectConnectProviderRequest.md) |  |  |

### Return type

[**SelectProviderResponse**](SelectProviderResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_beds24_credentials

> <SubmitBeds24Credentials200Response> submit_beds24_credentials(submit_beds24_credentials_request)

Submit Beds24 credentials for a Connect session

Completes a credentials-pattern connection for Beds24. API key + prop key from Beds24 → Settings → Apps & Integrations.  The credentials are validated against Beds24 before anything is persisted, so an invalid pair returns `invalid_credentials` rather than creating a dead connection. On success the `pms_connections` row is written and the Connect session moves to its terminal state.  No API key required when called with a `sessionId` — the session is the capability token.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
submit_beds24_credentials_request = Repull::SubmitBeds24CredentialsRequest.new({credentials: { key: 3.56}}) # SubmitBeds24CredentialsRequest | 

begin
  # Submit Beds24 credentials for a Connect session
  result = api_instance.submit_beds24_credentials(submit_beds24_credentials_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_beds24_credentials: #{e}"
end
```

#### Using the submit_beds24_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitBeds24Credentials200Response>, Integer, Hash)> submit_beds24_credentials_with_http_info(submit_beds24_credentials_request)

```ruby
begin
  # Submit Beds24 credentials for a Connect session
  data, status_code, headers = api_instance.submit_beds24_credentials_with_http_info(submit_beds24_credentials_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitBeds24Credentials200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_beds24_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_beds24_credentials_request** | [**SubmitBeds24CredentialsRequest**](SubmitBeds24CredentialsRequest.md) |  |  |

### Return type

[**SubmitBeds24Credentials200Response**](SubmitBeds24Credentials200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_bookingsync_credentials

> <SubmitBeds24Credentials200Response> submit_bookingsync_credentials(submit_bookingsync_credentials_request)

Submit BookingSync credentials for a Connect session

Completes a credentials-pattern connection for BookingSync. OAuth client credentials issued by BookingSync.  The credentials are validated against BookingSync before anything is persisted, so an invalid pair returns `invalid_credentials` rather than creating a dead connection. On success the `pms_connections` row is written and the Connect session moves to its terminal state.  No API key required when called with a `sessionId` — the session is the capability token.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
submit_bookingsync_credentials_request = Repull::SubmitBookingsyncCredentialsRequest.new({credentials: { key: 3.56}}) # SubmitBookingsyncCredentialsRequest | 

begin
  # Submit BookingSync credentials for a Connect session
  result = api_instance.submit_bookingsync_credentials(submit_bookingsync_credentials_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_bookingsync_credentials: #{e}"
end
```

#### Using the submit_bookingsync_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitBeds24Credentials200Response>, Integer, Hash)> submit_bookingsync_credentials_with_http_info(submit_bookingsync_credentials_request)

```ruby
begin
  # Submit BookingSync credentials for a Connect session
  data, status_code, headers = api_instance.submit_bookingsync_credentials_with_http_info(submit_bookingsync_credentials_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitBeds24Credentials200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_bookingsync_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_bookingsync_credentials_request** | [**SubmitBookingsyncCredentialsRequest**](SubmitBookingsyncCredentialsRequest.md) |  |  |

### Return type

[**SubmitBeds24Credentials200Response**](SubmitBeds24Credentials200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_guesty_credentials

> <SubmitBeds24Credentials200Response> submit_guesty_credentials(submit_guesty_credentials_request)

Submit Guesty credentials for a Connect session

Completes a credentials-pattern connection for Guesty. Client ID + secret from Guesty → Integrations → Open API.  The credentials are validated against Guesty before anything is persisted, so an invalid pair returns `invalid_credentials` rather than creating a dead connection. On success the `pms_connections` row is written and the Connect session moves to its terminal state.  No API key required when called with a `sessionId` — the session is the capability token.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
submit_guesty_credentials_request = Repull::SubmitGuestyCredentialsRequest.new({credentials: { key: 3.56}}) # SubmitGuestyCredentialsRequest | 

begin
  # Submit Guesty credentials for a Connect session
  result = api_instance.submit_guesty_credentials(submit_guesty_credentials_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_guesty_credentials: #{e}"
end
```

#### Using the submit_guesty_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitBeds24Credentials200Response>, Integer, Hash)> submit_guesty_credentials_with_http_info(submit_guesty_credentials_request)

```ruby
begin
  # Submit Guesty credentials for a Connect session
  data, status_code, headers = api_instance.submit_guesty_credentials_with_http_info(submit_guesty_credentials_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitBeds24Credentials200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_guesty_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_guesty_credentials_request** | [**SubmitGuestyCredentialsRequest**](SubmitGuestyCredentialsRequest.md) |  |  |

### Return type

[**SubmitBeds24Credentials200Response**](SubmitBeds24Credentials200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_hospitable_credentials

> <SubmitBeds24Credentials200Response> submit_hospitable_credentials(submit_hospitable_credentials_request)

Submit Hospitable credentials for a Connect session

Completes a credentials-pattern connection for Hospitable. Personal access token from Hospitable → Settings → API.  The credentials are validated against Hospitable before anything is persisted, so an invalid pair returns `invalid_credentials` rather than creating a dead connection. On success the `pms_connections` row is written and the Connect session moves to its terminal state.  No API key required when called with a `sessionId` — the session is the capability token.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
submit_hospitable_credentials_request = Repull::SubmitHospitableCredentialsRequest.new({credentials: { key: 3.56}}) # SubmitHospitableCredentialsRequest | 

begin
  # Submit Hospitable credentials for a Connect session
  result = api_instance.submit_hospitable_credentials(submit_hospitable_credentials_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_hospitable_credentials: #{e}"
end
```

#### Using the submit_hospitable_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitBeds24Credentials200Response>, Integer, Hash)> submit_hospitable_credentials_with_http_info(submit_hospitable_credentials_request)

```ruby
begin
  # Submit Hospitable credentials for a Connect session
  data, status_code, headers = api_instance.submit_hospitable_credentials_with_http_info(submit_hospitable_credentials_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitBeds24Credentials200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_hospitable_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_hospitable_credentials_request** | [**SubmitHospitableCredentialsRequest**](SubmitHospitableCredentialsRequest.md) |  |  |

### Return type

[**SubmitBeds24Credentials200Response**](SubmitBeds24Credentials200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_hostaway_credentials

> <SubmitBeds24Credentials200Response> submit_hostaway_credentials(submit_hostaway_credentials_request)

Submit Hostaway credentials for a Connect session

Completes a credentials-pattern connection for Hostaway. Account ID + API key from Hostaway → Settings → Public API.  The credentials are validated against Hostaway before anything is persisted, so an invalid pair returns `invalid_credentials` rather than creating a dead connection. On success the `pms_connections` row is written and the Connect session moves to its terminal state.  No API key required when called with a `sessionId` — the session is the capability token.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
submit_hostaway_credentials_request = Repull::SubmitHostawayCredentialsRequest.new({credentials: { key: 3.56}}) # SubmitHostawayCredentialsRequest | 

begin
  # Submit Hostaway credentials for a Connect session
  result = api_instance.submit_hostaway_credentials(submit_hostaway_credentials_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_hostaway_credentials: #{e}"
end
```

#### Using the submit_hostaway_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitBeds24Credentials200Response>, Integer, Hash)> submit_hostaway_credentials_with_http_info(submit_hostaway_credentials_request)

```ruby
begin
  # Submit Hostaway credentials for a Connect session
  data, status_code, headers = api_instance.submit_hostaway_credentials_with_http_info(submit_hostaway_credentials_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitBeds24Credentials200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_hostaway_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_hostaway_credentials_request** | [**SubmitHostawayCredentialsRequest**](SubmitHostawayCredentialsRequest.md) |  |  |

### Return type

[**SubmitBeds24Credentials200Response**](SubmitBeds24Credentials200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_igms_credentials

> <SubmitBeds24Credentials200Response> submit_igms_credentials(submit_igms_credentials_request)

Submit iGMS credentials for a Connect session

Completes a credentials-pattern connection for iGMS. API token from iGMS → Settings → Integrations.  The credentials are validated against iGMS before anything is persisted, so an invalid pair returns `invalid_credentials` rather than creating a dead connection. On success the `pms_connections` row is written and the Connect session moves to its terminal state.  No API key required when called with a `sessionId` — the session is the capability token.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
submit_igms_credentials_request = Repull::SubmitIgmsCredentialsRequest.new({credentials: { key: 3.56}}) # SubmitIgmsCredentialsRequest | 

begin
  # Submit iGMS credentials for a Connect session
  result = api_instance.submit_igms_credentials(submit_igms_credentials_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_igms_credentials: #{e}"
end
```

#### Using the submit_igms_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitBeds24Credentials200Response>, Integer, Hash)> submit_igms_credentials_with_http_info(submit_igms_credentials_request)

```ruby
begin
  # Submit iGMS credentials for a Connect session
  data, status_code, headers = api_instance.submit_igms_credentials_with_http_info(submit_igms_credentials_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitBeds24Credentials200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_igms_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_igms_credentials_request** | [**SubmitIgmsCredentialsRequest**](SubmitIgmsCredentialsRequest.md) |  |  |

### Return type

[**SubmitBeds24Credentials200Response**](SubmitBeds24Credentials200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_lodgify_credentials

> <SubmitBeds24Credentials200Response> submit_lodgify_credentials(submit_lodgify_credentials_request)

Submit Lodgify credentials for a Connect session

Completes a credentials-pattern connection for Lodgify. API key from Lodgify → Settings → Public API.  The credentials are validated against Lodgify before anything is persisted, so an invalid pair returns `invalid_credentials` rather than creating a dead connection. On success the `pms_connections` row is written and the Connect session moves to its terminal state.  No API key required when called with a `sessionId` — the session is the capability token.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
submit_lodgify_credentials_request = Repull::SubmitLodgifyCredentialsRequest.new({credentials: { key: 3.56}}) # SubmitLodgifyCredentialsRequest | 

begin
  # Submit Lodgify credentials for a Connect session
  result = api_instance.submit_lodgify_credentials(submit_lodgify_credentials_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_lodgify_credentials: #{e}"
end
```

#### Using the submit_lodgify_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitBeds24Credentials200Response>, Integer, Hash)> submit_lodgify_credentials_with_http_info(submit_lodgify_credentials_request)

```ruby
begin
  # Submit Lodgify credentials for a Connect session
  data, status_code, headers = api_instance.submit_lodgify_credentials_with_http_info(submit_lodgify_credentials_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitBeds24Credentials200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_lodgify_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_lodgify_credentials_request** | [**SubmitLodgifyCredentialsRequest**](SubmitLodgifyCredentialsRequest.md) |  |  |

### Return type

[**SubmitBeds24Credentials200Response**](SubmitBeds24Credentials200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_ownerrez_credentials

> <SubmitBeds24Credentials200Response> submit_ownerrez_credentials(submit_ownerrez_credentials_request)

Submit OwnerRez credentials for a Connect session

Completes a credentials-pattern connection for OwnerRez. Username + API token from OwnerRez → Settings → API.  The credentials are validated against OwnerRez before anything is persisted, so an invalid pair returns `invalid_credentials` rather than creating a dead connection. On success the `pms_connections` row is written and the Connect session moves to its terminal state.  No API key required when called with a `sessionId` — the session is the capability token.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
submit_ownerrez_credentials_request = Repull::SubmitOwnerrezCredentialsRequest.new({credentials: { key: 3.56}}) # SubmitOwnerrezCredentialsRequest | 

begin
  # Submit OwnerRez credentials for a Connect session
  result = api_instance.submit_ownerrez_credentials(submit_ownerrez_credentials_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_ownerrez_credentials: #{e}"
end
```

#### Using the submit_ownerrez_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitBeds24Credentials200Response>, Integer, Hash)> submit_ownerrez_credentials_with_http_info(submit_ownerrez_credentials_request)

```ruby
begin
  # Submit OwnerRez credentials for a Connect session
  data, status_code, headers = api_instance.submit_ownerrez_credentials_with_http_info(submit_ownerrez_credentials_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitBeds24Credentials200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_ownerrez_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_ownerrez_credentials_request** | [**SubmitOwnerrezCredentialsRequest**](SubmitOwnerrezCredentialsRequest.md) |  |  |

### Return type

[**SubmitBeds24Credentials200Response**](SubmitBeds24Credentials200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_smoobu_credentials

> <SubmitBeds24Credentials200Response> submit_smoobu_credentials(submit_smoobu_credentials_request)

Submit Smoobu credentials for a Connect session

Completes a credentials-pattern connection for Smoobu. API key from Smoobu → Settings → For developers.  The credentials are validated against Smoobu before anything is persisted, so an invalid pair returns `invalid_credentials` rather than creating a dead connection. On success the `pms_connections` row is written and the Connect session moves to its terminal state.  No API key required when called with a `sessionId` — the session is the capability token.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
submit_smoobu_credentials_request = Repull::SubmitSmoobuCredentialsRequest.new({credentials: { key: 3.56}}) # SubmitSmoobuCredentialsRequest | 

begin
  # Submit Smoobu credentials for a Connect session
  result = api_instance.submit_smoobu_credentials(submit_smoobu_credentials_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_smoobu_credentials: #{e}"
end
```

#### Using the submit_smoobu_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitBeds24Credentials200Response>, Integer, Hash)> submit_smoobu_credentials_with_http_info(submit_smoobu_credentials_request)

```ruby
begin
  # Submit Smoobu credentials for a Connect session
  data, status_code, headers = api_instance.submit_smoobu_credentials_with_http_info(submit_smoobu_credentials_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitBeds24Credentials200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_smoobu_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_smoobu_credentials_request** | [**SubmitSmoobuCredentialsRequest**](SubmitSmoobuCredentialsRequest.md) |  |  |

### Return type

[**SubmitBeds24Credentials200Response**](SubmitBeds24Credentials200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_vrbo_credentials

> <SubmitBeds24Credentials200Response> submit_vrbo_credentials(submit_vrbo_credentials_request)

Submit Vrbo credentials for a Connect session

Completes a credentials-pattern connection for Vrbo. Activation handshake — Repull mints the Basic-Auth pair the host pastes into Vrbo Partner Central.  The credentials are validated against Vrbo before anything is persisted, so an invalid pair returns `invalid_credentials` rather than creating a dead connection. On success the `pms_connections` row is written and the Connect session moves to its terminal state.  No API key required when called with a `sessionId` — the session is the capability token.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
submit_vrbo_credentials_request = Repull::SubmitVrboCredentialsRequest.new({credentials: { key: 3.56}}) # SubmitVrboCredentialsRequest | 

begin
  # Submit Vrbo credentials for a Connect session
  result = api_instance.submit_vrbo_credentials(submit_vrbo_credentials_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_vrbo_credentials: #{e}"
end
```

#### Using the submit_vrbo_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitBeds24Credentials200Response>, Integer, Hash)> submit_vrbo_credentials_with_http_info(submit_vrbo_credentials_request)

```ruby
begin
  # Submit Vrbo credentials for a Connect session
  data, status_code, headers = api_instance.submit_vrbo_credentials_with_http_info(submit_vrbo_credentials_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitBeds24Credentials200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->submit_vrbo_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_vrbo_credentials_request** | [**SubmitVrboCredentialsRequest**](SubmitVrboCredentialsRequest.md) |  |  |

### Return type

[**SubmitBeds24Credentials200Response**](SubmitBeds24Credentials200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## verify_booking_hotel

> <BookingVerifyHotelResponse> verify_booking_hotel(booking_verify_hotel_request)

Verify a Booking.com hotel ID for a Connect session

Manual-paste fallback that closes the Booking.com claim flow. Call this after the customer completes Stage 1 designation in their Booking Extranet (ticking FantasticStay/Repull as their connectivity provider) and pastes their Hotel ID into the hosted picker.  Validates the hotel against Booking's property API, persists the `pms_connections` row, kicks off the room import, and transitions the Connect session to `awaiting_room_mapping`.  No API key required — the `sessionId` is the capability token. Sessions in any terminal state are rejected.

### Examples

```ruby
require 'time'
require 'repull'

api_instance = Repull::ConnectApi.new
booking_verify_hotel_request = Repull::BookingVerifyHotelRequest.new({session_id: 'cs_8gQrT2v9k3M4nLp7wJxYzAbCdEfGhIjKlMnOp', hotel_id: '12345678'}) # BookingVerifyHotelRequest | 

begin
  # Verify a Booking.com hotel ID for a Connect session
  result = api_instance.verify_booking_hotel(booking_verify_hotel_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->verify_booking_hotel: #{e}"
end
```

#### Using the verify_booking_hotel_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BookingVerifyHotelResponse>, Integer, Hash)> verify_booking_hotel_with_http_info(booking_verify_hotel_request)

```ruby
begin
  # Verify a Booking.com hotel ID for a Connect session
  data, status_code, headers = api_instance.verify_booking_hotel_with_http_info(booking_verify_hotel_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BookingVerifyHotelResponse>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->verify_booking_hotel_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **booking_verify_hotel_request** | [**BookingVerifyHotelRequest**](BookingVerifyHotelRequest.md) |  |  |

### Return type

[**BookingVerifyHotelResponse**](BookingVerifyHotelResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

