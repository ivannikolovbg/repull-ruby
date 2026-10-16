# Repull::PromotionsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**bulk_listing_promotions**](PromotionsApi.md#bulk_listing_promotions) | **POST** /v1/listings/promotions/bulk | Add or remove a promotion on many listings |
| [**create_listing_promotion**](PromotionsApi.md#create_listing_promotion) | **POST** /v1/listings/{id}/promotions | Add a promotion to a listing |
| [**delete_listing_promotion**](PromotionsApi.md#delete_listing_promotion) | **DELETE** /v1/listings/{id}/promotions/{promotionId} | Remove a promotion from a listing |
| [**get_listing_promotion**](PromotionsApi.md#get_listing_promotion) | **GET** /v1/listings/{id}/promotions/{promotionId} | Get one promotion |
| [**get_listing_promotion_catalog**](PromotionsApi.md#get_listing_promotion_catalog) | **GET** /v1/listings/{id}/promotions/catalog | Promotion types a listing can use |
| [**list_listing_promotions**](PromotionsApi.md#list_listing_promotions) | **GET** /v1/listings/{id}/promotions | List a listing&#39;s promotions |
| [**refresh_listing_promotions**](PromotionsApi.md#refresh_listing_promotions) | **POST** /v1/listings/{id}/promotions/refresh | Re-read a listing&#39;s promotions now |
| [**update_listing_promotion**](PromotionsApi.md#update_listing_promotion) | **PATCH** /v1/listings/{id}/promotions/{promotionId} | Change a promotion |


## bulk_listing_promotions

> <PromotionBulkResponse> bulk_listing_promotions(promotion_bulk_request)

Add or remove a promotion on many listings

Applies one promotion to up to 100 listings — `add` it, or `remove` the listing's running promotion of that channel and type. Each listing gets its own result with the channel's reason when refused, so one refusal doesn't stop the rest. Returns `403 listing_inactive` before doing anything when any listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PromotionsApi.new
promotion_bulk_request = Repull::PromotionBulkRequest.new({listing_ids: [37], action: 'action_example', promotion: Repull::PromotionInput.new({channel: 'channel_example', type: Repull::PromotionType::NEW_LISTING})}) # PromotionBulkRequest | 

begin
  # Add or remove a promotion on many listings
  result = api_instance.bulk_listing_promotions(promotion_bulk_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->bulk_listing_promotions: #{e}"
end
```

#### Using the bulk_listing_promotions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PromotionBulkResponse>, Integer, Hash)> bulk_listing_promotions_with_http_info(promotion_bulk_request)

```ruby
begin
  # Add or remove a promotion on many listings
  data, status_code, headers = api_instance.bulk_listing_promotions_with_http_info(promotion_bulk_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PromotionBulkResponse>
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->bulk_listing_promotions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **promotion_bulk_request** | [**PromotionBulkRequest**](PromotionBulkRequest.md) |  |  |

### Return type

[**PromotionBulkResponse**](PromotionBulkResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_listing_promotion

> <PromotionResponse> create_listing_promotion(id, promotion_create_request)

Add a promotion to a listing

Adds an Airbnb or Booking.com promotion. Read `GET /v1/listings/{id}/promotions/catalog` first for the types and fields the listing's channels accept.  **Airbnb:** send `channel` and `type` only (`top_rated_guests`, `mobile`, `new_listing`) — Airbnb sets the discount. **Booking.com:** a listing's promotion covers that listing's room; send `discountPercent` and the rules the type takes, and `hotelId` when the listing is on several properties.  A request a channel can't take is refused with `422` and a `promotion_*` code; the message names the channel and the field and says what to do, and `channel` / `field` are set. Booking.com writes return once Booking.com shows the change (it lags its own writes by a few seconds).  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PromotionsApi.new
id = 56 # Integer | Listing ID
promotion_create_request = Repull::PromotionCreateRequest.new({channel: 'channel_example', type: Repull::PromotionType::NEW_LISTING}) # PromotionCreateRequest | 

begin
  # Add a promotion to a listing
  result = api_instance.create_listing_promotion(id, promotion_create_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->create_listing_promotion: #{e}"
end
```

#### Using the create_listing_promotion_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PromotionResponse>, Integer, Hash)> create_listing_promotion_with_http_info(id, promotion_create_request)

```ruby
begin
  # Add a promotion to a listing
  data, status_code, headers = api_instance.create_listing_promotion_with_http_info(id, promotion_create_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PromotionResponse>
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->create_listing_promotion_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Listing ID |  |
| **promotion_create_request** | [**PromotionCreateRequest**](PromotionCreateRequest.md) |  |  |

### Return type

[**PromotionResponse**](PromotionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_listing_promotion

> <PromotionDeleteResponse> delete_listing_promotion(id, promotion_id)

Remove a promotion from a listing

Airbnb: ends the listing's enrolment. Booking.com: takes the listing's room off the promotion — it keeps running for any other rooms it covers, and is deactivated when none are left. Airbnb Custom promotions can only be ended in Airbnb.  A request a channel can't take is refused with `422` and a `promotion_*` code; the message names the channel and the field and says what to do, and `channel` / `field` are set. Booking.com writes return once Booking.com shows the change (it lags its own writes by a few seconds).  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PromotionsApi.new
id = 56 # Integer | Listing ID
promotion_id = 56 # Integer | Promotion ID (from the list)

begin
  # Remove a promotion from a listing
  result = api_instance.delete_listing_promotion(id, promotion_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->delete_listing_promotion: #{e}"
end
```

#### Using the delete_listing_promotion_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PromotionDeleteResponse>, Integer, Hash)> delete_listing_promotion_with_http_info(id, promotion_id)

```ruby
begin
  # Remove a promotion from a listing
  data, status_code, headers = api_instance.delete_listing_promotion_with_http_info(id, promotion_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PromotionDeleteResponse>
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->delete_listing_promotion_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Listing ID |  |
| **promotion_id** | **Integer** | Promotion ID (from the list) |  |

### Return type

[**PromotionDeleteResponse**](PromotionDeleteResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_listing_promotion

> <PromotionResponse> get_listing_promotion(id, promotion_id)

Get one promotion

One promotion on the listing.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PromotionsApi.new
id = 56 # Integer | Listing ID
promotion_id = 56 # Integer | Promotion ID (from the list)

begin
  # Get one promotion
  result = api_instance.get_listing_promotion(id, promotion_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->get_listing_promotion: #{e}"
end
```

#### Using the get_listing_promotion_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PromotionResponse>, Integer, Hash)> get_listing_promotion_with_http_info(id, promotion_id)

```ruby
begin
  # Get one promotion
  data, status_code, headers = api_instance.get_listing_promotion_with_http_info(id, promotion_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PromotionResponse>
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->get_listing_promotion_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Listing ID |  |
| **promotion_id** | **Integer** | Promotion ID (from the list) |  |

### Return type

[**PromotionResponse**](PromotionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_listing_promotion_catalog

> <PromotionCatalogResponse> get_listing_promotion_catalog(id)

Promotion types a listing can use

Per channel: whether the listing is connected, and each promotion type with a short description for hosts, whether it is new, whether it is available to this listing (and why not), and every field — supported or not — with its limits and any value the channel fixes. Booking.com's types and limits come from the property itself; seasonal campaigns appear while Booking.com runs them.  Airbnb asks partners to show newly available discounts with a “New” badge and to grey out fields a discount does not support rather than hide them; `isNew` and `fields` carry what that needs.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PromotionsApi.new
id = 56 # Integer | Listing ID

begin
  # Promotion types a listing can use
  result = api_instance.get_listing_promotion_catalog(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->get_listing_promotion_catalog: #{e}"
end
```

#### Using the get_listing_promotion_catalog_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PromotionCatalogResponse>, Integer, Hash)> get_listing_promotion_catalog_with_http_info(id)

```ruby
begin
  # Promotion types a listing can use
  data, status_code, headers = api_instance.get_listing_promotion_catalog_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PromotionCatalogResponse>
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->get_listing_promotion_catalog_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Listing ID |  |

### Return type

[**PromotionCatalogResponse**](PromotionCatalogResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_listing_promotions

> <PromotionListResponse> list_listing_promotions(id, opts)

List a listing's promotions

Airbnb and Booking.com promotions on the listing, in one model. Includes Airbnb promotions running or available (the new listing promotion shows as `eligible` when the listing qualifies), Airbnb Custom promotions seen on bookings (read-only — they override your prices on Airbnb), and Booking.com promotions covering the listing's room, including deactivated ones.  Pass `refresh=true` to re-read the channels first; otherwise the stored copy is returned (kept current by Airbnb's notifications and a sync every 30 minutes).  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PromotionsApi.new
id = 56 # Integer | Listing ID
opts = {
  refresh: true # Boolean | Re-read Airbnb and Booking.com before answering.
}

begin
  # List a listing's promotions
  result = api_instance.list_listing_promotions(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->list_listing_promotions: #{e}"
end
```

#### Using the list_listing_promotions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PromotionListResponse>, Integer, Hash)> list_listing_promotions_with_http_info(id, opts)

```ruby
begin
  # List a listing's promotions
  data, status_code, headers = api_instance.list_listing_promotions_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PromotionListResponse>
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->list_listing_promotions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Listing ID |  |
| **refresh** | **Boolean** | Re-read Airbnb and Booking.com before answering. | [optional] |

### Return type

[**PromotionListResponse**](PromotionListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## refresh_listing_promotions

> <PromotionRefreshResponse> refresh_listing_promotions(id)

Re-read a listing's promotions now

Reads the listing's promotions from Airbnb and Booking.com and returns them. Booking.com promotions belong to the property, so the property's other listings are refreshed too. `errors` lists any channel that could not be read.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PromotionsApi.new
id = 56 # Integer | Listing ID

begin
  # Re-read a listing's promotions now
  result = api_instance.refresh_listing_promotions(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->refresh_listing_promotions: #{e}"
end
```

#### Using the refresh_listing_promotions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PromotionRefreshResponse>, Integer, Hash)> refresh_listing_promotions_with_http_info(id)

```ruby
begin
  # Re-read a listing's promotions now
  data, status_code, headers = api_instance.refresh_listing_promotions_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PromotionRefreshResponse>
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->refresh_listing_promotions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Listing ID |  |

### Return type

[**PromotionRefreshResponse**](PromotionRefreshResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_listing_promotion

> <PromotionResponse> update_listing_promotion(id, promotion_id, promotion_update_request)

Change a promotion

Booking.com promotions only — Airbnb's have nothing to change. `rules`, when sent, replaces the promotion's rules whole. A promotion that also covers other listings' rooms changes for them too, so it needs `confirmShared: true` (otherwise `409 promotion_shared_promotion`). Promotions that come from the listing's weekly or monthly discount are changed in its pricing settings.  A request a channel can't take is refused with `422` and a `promotion_*` code; the message names the channel and the field and says what to do, and `channel` / `field` are set. Booking.com writes return once Booking.com shows the change (it lags its own writes by a few seconds).  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PromotionsApi.new
id = 56 # Integer | Listing ID
promotion_id = 56 # Integer | Promotion ID (from the list)
promotion_update_request = Repull::PromotionUpdateRequest.new # PromotionUpdateRequest | 

begin
  # Change a promotion
  result = api_instance.update_listing_promotion(id, promotion_id, promotion_update_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->update_listing_promotion: #{e}"
end
```

#### Using the update_listing_promotion_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PromotionResponse>, Integer, Hash)> update_listing_promotion_with_http_info(id, promotion_id, promotion_update_request)

```ruby
begin
  # Change a promotion
  data, status_code, headers = api_instance.update_listing_promotion_with_http_info(id, promotion_id, promotion_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PromotionResponse>
rescue Repull::ApiError => e
  puts "Error when calling PromotionsApi->update_listing_promotion_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Listing ID |  |
| **promotion_id** | **Integer** | Promotion ID (from the list) |  |
| **promotion_update_request** | [**PromotionUpdateRequest**](PromotionUpdateRequest.md) |  |  |

### Return type

[**PromotionResponse**](PromotionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

