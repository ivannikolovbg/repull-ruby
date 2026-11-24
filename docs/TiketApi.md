# Repull::TiketApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_tiket_availability**](TiketApi.md#get_tiket_availability) | **GET** /v1/channels/tiket/availability | Read tiket.com rates, availability and restrictions |
| [**get_tiket_content**](TiketApi.md#get_tiket_content) | **GET** /v1/channels/tiket/content | Read the content Repull sent tiket.com |
| [**get_tiket_listing_pricing**](TiketApi.md#get_tiket_listing_pricing) | **GET** /v1/channels/tiket/listings/{id}/pricing | Read tiket.com rates, availability and restrictions for a listing |
| [**get_tiket_property**](TiketApi.md#get_tiket_property) | **GET** /v1/channels/tiket/properties/{id} | Get a tiket.com property |
| [**list_tiket_properties**](TiketApi.md#list_tiket_properties) | **GET** /v1/channels/tiket/properties | List tiket.com properties |
| [**list_tiket_property_rooms**](TiketApi.md#list_tiket_property_rooms) | **GET** /v1/channels/tiket/properties/{id}/rooms | List a tiket.com property&#39;s room types |
| [**list_tiket_reservations**](TiketApi.md#list_tiket_reservations) | **GET** /v1/channels/tiket/reservations | List tiket.com reservations as tiket.com sent them |
| [**map_tiket_listings**](TiketApi.md#map_tiket_listings) | **POST** /v1/channels/tiket/listings/map | Map tiket.com room types to listings |
| [**sync_tiket**](TiketApi.md#sync_tiket) | **POST** /v1/channels/tiket/sync | Send every mapped listing&#39;s calendar to tiket.com |
| [**tiket_setup**](TiketApi.md#tiket_setup) | **POST** /v1/channels/tiket/setup | Set up a tiket.com property |
| [**update_tiket_availability**](TiketApi.md#update_tiket_availability) | **PUT** /v1/channels/tiket/availability | Write tiket.com rates, availability or restrictions |
| [**update_tiket_listing_pricing**](TiketApi.md#update_tiket_listing_pricing) | **PUT** /v1/channels/tiket/listings/{id}/pricing | Write tiket.com rates, availability or restrictions for a listing |


## get_tiket_availability

> <TiketAvailabilityResponse> get_tiket_availability(property_id, opts)

Read tiket.com rates, availability and restrictions

What tiket.com holds for a property over a date window, read live from tiket.com: rooms to sell and booked per room type, prices (Room Based, or per number of guests on an Occupancy Based property, and children prices) and restrictions per rate plan. One row per night, room type and rate plan.  `property_id` must be a tiket.com property connected to this workspace (`GET /v1/channels/tiket/properties`).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TiketApi.new
property_id = 'property_id_example' # String | tiket.com Hotel ID (shown next to the property name in the tiket.com extranet; `propertyId` on `GET /v1/channels/tiket/properties`).
opts = {
  start_date: Date.parse('2013-10-20'), # Date | First night, YYYY-MM-DD. Default today.
  end_date: Date.parse('2013-10-20'), # Date | Last night, YYYY-MM-DD, inclusive. Default `start_date` + `number_of_days` - 1.
  number_of_days: 56, # Integer | Window length when `end_date` is omitted.
  room_type_code: 'room_type_code_example', # String | Only this tiket.com room type.
  rate_plan_code: 'rate_plan_code_example' # String | Only this tiket.com rate plan.
}

begin
  # Read tiket.com rates, availability and restrictions
  result = api_instance.get_tiket_availability(property_id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->get_tiket_availability: #{e}"
end
```

#### Using the get_tiket_availability_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TiketAvailabilityResponse>, Integer, Hash)> get_tiket_availability_with_http_info(property_id, opts)

```ruby
begin
  # Read tiket.com rates, availability and restrictions
  data, status_code, headers = api_instance.get_tiket_availability_with_http_info(property_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TiketAvailabilityResponse>
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->get_tiket_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** | tiket.com Hotel ID (shown next to the property name in the tiket.com extranet; &#x60;propertyId&#x60; on &#x60;GET /v1/channels/tiket/properties&#x60;). |  |
| **start_date** | **Date** | First night, YYYY-MM-DD. Default today. | [optional] |
| **end_date** | **Date** | Last night, YYYY-MM-DD, inclusive. Default &#x60;start_date&#x60; + &#x60;number_of_days&#x60; - 1. | [optional] |
| **number_of_days** | **Integer** | Window length when &#x60;end_date&#x60; is omitted. | [optional][default to 31] |
| **room_type_code** | **String** | Only this tiket.com room type. | [optional] |
| **rate_plan_code** | **String** | Only this tiket.com rate plan. | [optional] |

### Return type

[**TiketAvailabilityResponse**](TiketAvailabilityResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_tiket_content

> <TiketContentResponse> get_tiket_content(opts)

Read the content Repull sent tiket.com

tiket.com has no API to read content back, so this is the record of what Repull sent for a property — the property, its room types and rate plans — with when each was sent and tiket.com's reference for it. Send changes with `POST /v1/listings/{id}/publish/tiket`.  Name the property with `property_id`, or with `partner_hotel_code` for a property Repull created that tiket.com has not assigned an id to yet.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TiketApi.new
opts = {
  property_id: 'property_id_example', # String | tiket.com Hotel ID (shown next to the property name in the tiket.com extranet; `propertyId` on `GET /v1/channels/tiket/properties`). Required unless `partner_hotel_code` is sent.
  partner_hotel_code: 'partner_hotel_code_example' # String | Repull's code for a property Repull created (`partnerHotelCode`).
}

begin
  # Read the content Repull sent tiket.com
  result = api_instance.get_tiket_content(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->get_tiket_content: #{e}"
end
```

#### Using the get_tiket_content_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TiketContentResponse>, Integer, Hash)> get_tiket_content_with_http_info(opts)

```ruby
begin
  # Read the content Repull sent tiket.com
  data, status_code, headers = api_instance.get_tiket_content_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TiketContentResponse>
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->get_tiket_content_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** | tiket.com Hotel ID (shown next to the property name in the tiket.com extranet; &#x60;propertyId&#x60; on &#x60;GET /v1/channels/tiket/properties&#x60;). Required unless &#x60;partner_hotel_code&#x60; is sent. | [optional] |
| **partner_hotel_code** | **String** | Repull&#39;s code for a property Repull created (&#x60;partnerHotelCode&#x60;). | [optional] |

### Return type

[**TiketContentResponse**](TiketContentResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_tiket_listing_pricing

> <TiketListingPricingResponse> get_tiket_listing_pricing(id, opts)

Read tiket.com rates, availability and restrictions for a listing

Same as `GET /v1/channels/tiket/availability`, addressed by listing: the listing's tiket.com room type and every active rate plan of that room, read live from tiket.com.  A listing mapped on more than one tiket.com property needs `hotel_id`; without it the call returns `409 ambiguous_tiket_mapping` listing the ids.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TiketApi.new
id = 56 # Integer | Repull listing id.
opts = {
  hotel_id: 'hotel_id_example', # String | tiket.com Hotel ID — only needed when the listing is mapped on more than one tiket.com property.
  start_date: Date.parse('2013-10-20'), # Date | First night, YYYY-MM-DD. Default today.
  end_date: Date.parse('2013-10-20'), # Date | Last night, YYYY-MM-DD, inclusive.
  number_of_days: 56 # Integer | Window length when `end_date` is omitted.
}

begin
  # Read tiket.com rates, availability and restrictions for a listing
  result = api_instance.get_tiket_listing_pricing(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->get_tiket_listing_pricing: #{e}"
end
```

#### Using the get_tiket_listing_pricing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TiketListingPricingResponse>, Integer, Hash)> get_tiket_listing_pricing_with_http_info(id, opts)

```ruby
begin
  # Read tiket.com rates, availability and restrictions for a listing
  data, status_code, headers = api_instance.get_tiket_listing_pricing_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TiketListingPricingResponse>
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->get_tiket_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id. |  |
| **hotel_id** | **String** | tiket.com Hotel ID — only needed when the listing is mapped on more than one tiket.com property. | [optional] |
| **start_date** | **Date** | First night, YYYY-MM-DD. Default today. | [optional] |
| **end_date** | **Date** | Last night, YYYY-MM-DD, inclusive. | [optional] |
| **number_of_days** | **Integer** | Window length when &#x60;end_date&#x60; is omitted. | [optional][default to 31] |

### Return type

[**TiketListingPricingResponse**](TiketListingPricingResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_tiket_property

> <TiketProperty> get_tiket_property(id, opts)

Get a tiket.com property

One tiket.com property connected to this workspace, by Hotel ID — same shape as an entry of `GET /v1/channels/tiket/properties`. A property connected to another workspace returns the same `404` as one that does not exist.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TiketApi.new
id = 'id_example' # String | tiket.com Hotel ID.
opts = {
  status: 'active' # String | `active` (default) hides inactive listings: they are left out of `listings`, and a room mapped to one comes back with `listingId: null` and `listingHidden: true`. `inactive` shows only inactive listings and `all` shows both. `mappingStatus` always counts every mapped room.
}

begin
  # Get a tiket.com property
  result = api_instance.get_tiket_property(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->get_tiket_property: #{e}"
end
```

#### Using the get_tiket_property_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TiketProperty>, Integer, Hash)> get_tiket_property_with_http_info(id, opts)

```ruby
begin
  # Get a tiket.com property
  data, status_code, headers = api_instance.get_tiket_property_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TiketProperty>
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->get_tiket_property_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | tiket.com Hotel ID. |  |
| **status** | **String** | &#x60;active&#x60; (default) hides inactive listings: they are left out of &#x60;listings&#x60;, and a room mapped to one comes back with &#x60;listingId: null&#x60; and &#x60;listingHidden: true&#x60;. &#x60;inactive&#x60; shows only inactive listings and &#x60;all&#x60; shows both. &#x60;mappingStatus&#x60; always counts every mapped room. | [optional][default to &#39;active&#39;] |

### Return type

[**TiketProperty**](TiketProperty.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_tiket_properties

> <TiketPropertyListResponse> list_tiket_properties(opts)

List tiket.com properties

Every tiket.com property connected to this workspace, each returned once with its room types, rate plans and the listing each room type is mapped to.  A tiket.com property is a hotel or building; its room types are what guests book, and each room type maps to one Repull listing. A property whose rooms are not mapped yet is still listed, with `mappingStatus: \"unmapped\"`. Properties waiting for tiket.com to activate Repull are listed with their `activationStatus`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TiketApi.new
opts = {
  status: 'active' # String | `active` (default) hides inactive listings: they are left out of `listings`, and a room mapped to one comes back with `listingId: null` and `listingHidden: true`. `inactive` shows only inactive listings and `all` shows both. `mappingStatus` always counts every mapped room.
}

begin
  # List tiket.com properties
  result = api_instance.list_tiket_properties(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->list_tiket_properties: #{e}"
end
```

#### Using the list_tiket_properties_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TiketPropertyListResponse>, Integer, Hash)> list_tiket_properties_with_http_info(opts)

```ruby
begin
  # List tiket.com properties
  data, status_code, headers = api_instance.list_tiket_properties_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TiketPropertyListResponse>
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->list_tiket_properties_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | &#x60;active&#x60; (default) hides inactive listings: they are left out of &#x60;listings&#x60;, and a room mapped to one comes back with &#x60;listingId: null&#x60; and &#x60;listingHidden: true&#x60;. &#x60;inactive&#x60; shows only inactive listings and &#x60;all&#x60; shows both. &#x60;mappingStatus&#x60; always counts every mapped room. | [optional][default to &#39;active&#39;] |

### Return type

[**TiketPropertyListResponse**](TiketPropertyListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_tiket_property_rooms

> <TiketPropertyRoomsResponse> list_tiket_property_rooms(id)

List a tiket.com property's room types

The room types of a tiket.com property, each with its rate plans and the listing it is mapped to. `roomTypeCode` is what `POST /v1/channels/tiket/listings/map` and the rates writes take.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TiketApi.new
id = 'id_example' # String | tiket.com Hotel ID.

begin
  # List a tiket.com property's room types
  result = api_instance.list_tiket_property_rooms(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->list_tiket_property_rooms: #{e}"
end
```

#### Using the list_tiket_property_rooms_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TiketPropertyRoomsResponse>, Integer, Hash)> list_tiket_property_rooms_with_http_info(id)

```ruby
begin
  # List a tiket.com property's room types
  data, status_code, headers = api_instance.list_tiket_property_rooms_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TiketPropertyRoomsResponse>
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->list_tiket_property_rooms_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | tiket.com Hotel ID. |  |

### Return type

[**TiketPropertyRoomsResponse**](TiketPropertyRoomsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_tiket_reservations

> <TiketReservationListResponse> list_tiket_reservations(opts)

List tiket.com reservations as tiket.com sent them

tiket.com's own record of the bookings it delivered, newest first: one row per booked room (`<id>`, `<id>-2`, …) with tiket.com's ids, rate plan, meal plan, cancellation policy, what the guest paid, the net amount tiket.com pays the property, how tiket.com pays (`paymentMethod`: `Virtual Credit Card` or `Bank Transfer`), and the Repull reservation the room became.  **Cards.** Card details are never returned by the API, on this route or on `/v1/reservations`.  **Date changes.** tiket.com sends a date change as a cancellation plus a new booking. Repull applies it as a change to the original reservation, so the Repull reservation keeps its id; the new tiket.com booking carries `previousTiketReservationId`.  The same bookings, normalized like every other channel's (`source: tiket`), are on `GET /v1/reservations`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TiketApi.new
opts = {
  property_id: 'property_id_example', # String | tiket.com Hotel ID (shown next to the property name in the tiket.com extranet; `propertyId` on `GET /v1/channels/tiket/properties`).
  status: 'confirmed', # String | Only `confirmed` or only `cancelled` bookings.
  check_in_from: Date.parse('2013-10-20'), # Date | Check-in on or after, YYYY-MM-DD.
  check_in_to: Date.parse('2013-10-20'), # Date | Check-in on or before, YYYY-MM-DD.
  limit: 56, # Integer | Page size.
  offset: 56 # Integer | Rows to skip.
}

begin
  # List tiket.com reservations as tiket.com sent them
  result = api_instance.list_tiket_reservations(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->list_tiket_reservations: #{e}"
end
```

#### Using the list_tiket_reservations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TiketReservationListResponse>, Integer, Hash)> list_tiket_reservations_with_http_info(opts)

```ruby
begin
  # List tiket.com reservations as tiket.com sent them
  data, status_code, headers = api_instance.list_tiket_reservations_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TiketReservationListResponse>
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->list_tiket_reservations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** | tiket.com Hotel ID (shown next to the property name in the tiket.com extranet; &#x60;propertyId&#x60; on &#x60;GET /v1/channels/tiket/properties&#x60;). | [optional] |
| **status** | **String** | Only &#x60;confirmed&#x60; or only &#x60;cancelled&#x60; bookings. | [optional] |
| **check_in_from** | **Date** | Check-in on or after, YYYY-MM-DD. | [optional] |
| **check_in_to** | **Date** | Check-in on or before, YYYY-MM-DD. | [optional] |
| **limit** | **Integer** | Page size. | [optional][default to 50] |
| **offset** | **Integer** | Rows to skip. | [optional][default to 0] |

### Return type

[**TiketReservationListResponse**](TiketReservationListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## map_tiket_listings

> <TiketMapListingsResponse> map_tiket_listings(tiket_map_listings_request)

Map tiket.com room types to listings

Map each room type of a tiket.com property to a Repull listing — the API-key equivalent of the mapping step of the hosted Connect flow, and the counterpart of `POST /v1/channels/booking/listings/map`.  Each mapping is `{ roomTypeCode, listingId }` (`listingId: null` unmaps the room) or `{ roomTypeCode, create: true }`, which creates a new listing from the room with tiket.com's calendar.  Mapping a room to an existing listing sends that listing's calendar to tiket.com, and records any bookings tiket.com delivered while the room was unmapped (`replayedReservations`).  Returns `403 listing_inactive` when a target listing is inactive; nothing is changed.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TiketApi.new
tiket_map_listings_request = Repull::TiketMapListingsRequest.new({property_id: 'property_id_example', mappings: [Repull::TiketMapListingsRequestMappingsInner.new({room_type_code: 'room_type_code_example'})]}) # TiketMapListingsRequest | 

begin
  # Map tiket.com room types to listings
  result = api_instance.map_tiket_listings(tiket_map_listings_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->map_tiket_listings: #{e}"
end
```

#### Using the map_tiket_listings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TiketMapListingsResponse>, Integer, Hash)> map_tiket_listings_with_http_info(tiket_map_listings_request)

```ruby
begin
  # Map tiket.com room types to listings
  data, status_code, headers = api_instance.map_tiket_listings_with_http_info(tiket_map_listings_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TiketMapListingsResponse>
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->map_tiket_listings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tiket_map_listings_request** | [**TiketMapListingsRequest**](TiketMapListingsRequest.md) |  |  |

### Return type

[**TiketMapListingsResponse**](TiketMapListingsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## sync_tiket

> <TiketSyncResponse> sync_tiket(opts)

Send every mapped listing's calendar to tiket.com

Send the full calendar (today to 500 days ahead: rooms to sell, prices, restrictions) of every mapped listing of one tiket.com property, or of every active property when `property_id` is omitted. `refresh_products: true` re-reads room types and rate plans from tiket.com first. Use it after a bulk edit or to re-baseline a property; day-to-day changes are sent automatically.  Inactive listings are not sold, so they are skipped (`skipped: listing_inactive`).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TiketApi.new
opts = {
  sync_tiket_request: Repull::SyncTiketRequest.new # SyncTiketRequest | 
}

begin
  # Send every mapped listing's calendar to tiket.com
  result = api_instance.sync_tiket(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->sync_tiket: #{e}"
end
```

#### Using the sync_tiket_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TiketSyncResponse>, Integer, Hash)> sync_tiket_with_http_info(opts)

```ruby
begin
  # Send every mapped listing's calendar to tiket.com
  data, status_code, headers = api_instance.sync_tiket_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TiketSyncResponse>
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->sync_tiket_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sync_tiket_request** | [**SyncTiketRequest**](SyncTiketRequest.md) |  | [optional] |

### Return type

[**TiketSyncResponse**](TiketSyncResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## tiket_setup

> <TiketSetupResponse> tiket_setup(tiket_setup_request)

Set up a tiket.com property

Onboarding and maintenance actions for tiket.com properties (counterpart of `POST /v1/channels/booking/setup`). `action`:  - `request-activation` — ask tiket.com to activate Repull as channel manager for one or more existing properties (`properties[]`). The usual path for a group; a single host activates Repull in the tiket.com extranet and connects through Connect instead. - `check-activation` — whether tiket.com has activated Repull for `hotel_id` yet. - `create-property` — create a new property on tiket.com from a listing (`listing_id` plus the property and company details). Then `request-registration` asks tiket.com for its ids and `set-tiket-hotel-id` records the Hotel ID tiket.com replies with. - `add-room`, `add-rate-plan` — add a room type or rate plan to a property Repull created. - `request-content-mapping` / `confirm-content-mapping` — for an existing property, ask tiket.com to link Repull's codes to it so `POST /v1/listings/{id}/publish/tiket` can send content. - `refresh` — re-read room types and rate plans from tiket.com. - `set-push-rate-plans` — choose the rate plans (`rate_plan_ids`) that receive prices and restrictions. - `set-sync` — turn automatic calendar sending on or off (`enabled`). - `disconnect` — stop syncing the property. Always available, even when its listings are inactive.  tiket.com accepts incomplete content and rejects it later, so content is checked against tiket.com's requirements before it is sent; problems come back as `422 invalid_params` with each field in `value_received`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TiketApi.new
tiket_setup_request = Repull::TiketSetupRequest.new({action: 'action_example'}) # TiketSetupRequest | 

begin
  # Set up a tiket.com property
  result = api_instance.tiket_setup(tiket_setup_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->tiket_setup: #{e}"
end
```

#### Using the tiket_setup_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TiketSetupResponse>, Integer, Hash)> tiket_setup_with_http_info(tiket_setup_request)

```ruby
begin
  # Set up a tiket.com property
  data, status_code, headers = api_instance.tiket_setup_with_http_info(tiket_setup_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TiketSetupResponse>
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->tiket_setup_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tiket_setup_request** | [**TiketSetupRequest**](TiketSetupRequest.md) |  |  |

### Return type

[**TiketSetupResponse**](TiketSetupResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_tiket_availability

> <TiketAriWriteResponse> update_tiket_availability(tiket_availability_update_request)

Write tiket.com rates, availability or restrictions

`type` selects the write:  - `availability` — rooms to sell per room type (`availableRooms`). `stopSell` with a `ratePlanCode` also closes that rate plan. - `rates` — `price` on a Room Based property or `occupancyPrices` on an Occupancy Based one, per room type and rate plan. `currency` defaults to the property currency. - `restrictions` — `minStay`, `maxStay`, `stopSell`, `closedToArrival`, `closedToDeparture`, `minAdvanceDays`, `maxAdvanceDays`.  Dates are inclusive and must fall between today and 500 days ahead. Every update is checked before anything is sent; a problem returns `422 invalid_params` naming each field, and nothing is written.  **Children rates are paused.** tiket.com has asked every channel manager not to send children rates until it fixes an issue on its side, so a write that includes `childPrices` is refused with `422 invalid_params` and nothing is sent. Children rates set in the tiket.com extranet still apply. Send `price` or `occupancyPrices` without `childPrices`.  **Every write is read back.** `applied` is `verified` when tiket.com holds what was sent, `mismatch` when it holds something else (see `mismatches`), or `unverified` with `verify: false`. tiket.com's own warnings come back verbatim in `warnings`. A write tiket.com refuses returns `tiket_rejected` with tiket.com's reason and its reference (`echoToken`) in `value_received`.  To write by listing instead of by room type, use `PUT /v1/channels/tiket/listings/{id}/pricing`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TiketApi.new
tiket_availability_update_request = Repull::TiketAvailabilityUpdateRequest.new({property_id: 'property_id_example', type: 'type_example', updates: [Repull::TiketAriUpdate.new({start: Date.today, _end: Date.today})]}) # TiketAvailabilityUpdateRequest | 

begin
  # Write tiket.com rates, availability or restrictions
  result = api_instance.update_tiket_availability(tiket_availability_update_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->update_tiket_availability: #{e}"
end
```

#### Using the update_tiket_availability_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TiketAriWriteResponse>, Integer, Hash)> update_tiket_availability_with_http_info(tiket_availability_update_request)

```ruby
begin
  # Write tiket.com rates, availability or restrictions
  data, status_code, headers = api_instance.update_tiket_availability_with_http_info(tiket_availability_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TiketAriWriteResponse>
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->update_tiket_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tiket_availability_update_request** | [**TiketAvailabilityUpdateRequest**](TiketAvailabilityUpdateRequest.md) |  |  |

### Return type

[**TiketAriWriteResponse**](TiketAriWriteResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_tiket_listing_pricing

> <TiketAriWriteResponse> update_tiket_listing_pricing(id, tiket_listing_pricing_update_request)

Write tiket.com rates, availability or restrictions for a listing

Same contract as `PUT /v1/channels/tiket/availability`, addressed by listing. `roomTypeCode` is always the listing's room; `ratePlanCode` defaults to every rate plan of the room selected for pushes (`pushTarget`), so one update row is sent to each. `type` defaults to `rates`.  **Children rates are paused.** tiket.com has asked every channel manager not to send children rates until it fixes an issue on its side, so a write that includes `childPrices` is refused with `422 invalid_params` and nothing is sent. Children rates set in the tiket.com extranet still apply. Send `price` or `occupancyPrices` without `childPrices`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TiketApi.new
id = 56 # Integer | Repull listing id.
tiket_listing_pricing_update_request = Repull::TiketListingPricingUpdateRequest.new({updates: [Repull::TiketAriUpdate.new({start: Date.today, _end: Date.today})]}) # TiketListingPricingUpdateRequest | 

begin
  # Write tiket.com rates, availability or restrictions for a listing
  result = api_instance.update_tiket_listing_pricing(id, tiket_listing_pricing_update_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->update_tiket_listing_pricing: #{e}"
end
```

#### Using the update_tiket_listing_pricing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TiketAriWriteResponse>, Integer, Hash)> update_tiket_listing_pricing_with_http_info(id, tiket_listing_pricing_update_request)

```ruby
begin
  # Write tiket.com rates, availability or restrictions for a listing
  data, status_code, headers = api_instance.update_tiket_listing_pricing_with_http_info(id, tiket_listing_pricing_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TiketAriWriteResponse>
rescue Repull::ApiError => e
  puts "Error when calling TiketApi->update_tiket_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id. |  |
| **tiket_listing_pricing_update_request** | [**TiketListingPricingUpdateRequest**](TiketListingPricingUpdateRequest.md) |  |  |

### Return type

[**TiketAriWriteResponse**](TiketAriWriteResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

