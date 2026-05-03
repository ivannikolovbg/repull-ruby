# Repull::ConnectApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_connect_session**](ConnectApi.md#create_connect_session) | **POST** /v1/connect | Create a multi-channel Connect picker session |
| [**create_connection**](ConnectApi.md#create_connection) | **POST** /v1/connect/{provider} | Connect to PMS/OTA provider |
| [**delete_connection**](ConnectApi.md#delete_connection) | **DELETE** /v1/connect/{provider} | Disconnect provider |
| [**get_connect_status**](ConnectApi.md#get_connect_status) | **GET** /v1/connect/{provider} | Get connection status |
| [**list_connect_booking_rooms**](ConnectApi.md#list_connect_booking_rooms) | **GET** /v1/connect/booking/rooms | List Booking.com rooms imported for a Connect session |
| [**list_connect_providers**](ConnectApi.md#list_connect_providers) | **GET** /v1/connect/providers | List Connect channels |
| [**list_connections**](ConnectApi.md#list_connections) | **GET** /v1/connect | List PMS/OTA connections |
| [**map_connect_booking_rooms**](ConnectApi.md#map_connect_booking_rooms) | **POST** /v1/connect/booking/map-rooms | Submit room→listing mappings for a Booking.com Connect session |
| [**select_connect_provider**](ConnectApi.md#select_connect_provider) | **POST** /v1/connect/sessions/{sessionId}/select-provider | Bind a picker session to a provider |
| [**verify_booking_hotel**](ConnectApi.md#verify_booking_hotel) | **POST** /v1/connect/booking/verify | Verify a Booking.com hotel ID for a Connect session |


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

Establish a connection to a PMS or OTA platform. Credentials vary by provider — see docs for each provider.  Airbnb-specific: pass `redirectUrl` (where to send the user after consent) and optionally `accessType` (`read_only` for calendar-only OAuth scopes, or `full_access` — the default — for full host scopes). The response returns a hosted `oauthUrl` to redirect the user to.

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

Disconnect a PMS or OTA from this workspace. Revokes the OAuth token (where applicable), purges credentials, and stops all sync jobs. Resources synced from the provider remain queryable but become read-only and stop receiving updates.

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
- **Accept**: Not defined


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

