# Repull::AirbnbApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_channels_airbnb_listings_get**](AirbnbApi.md#v1_channels_airbnb_listings_get) | **GET** /v1/channels/airbnb/listings | List Airbnb listings |
| [**v1_channels_airbnb_listings_id_availability_get**](AirbnbApi.md#v1_channels_airbnb_listings_id_availability_get) | **GET** /v1/channels/airbnb/listings/{id}/availability | Get Airbnb availability |
| [**v1_channels_airbnb_listings_id_availability_put**](AirbnbApi.md#v1_channels_airbnb_listings_id_availability_put) | **PUT** /v1/channels/airbnb/listings/{id}/availability | Update Airbnb availability |
| [**v1_channels_airbnb_listings_id_get**](AirbnbApi.md#v1_channels_airbnb_listings_id_get) | **GET** /v1/channels/airbnb/listings/{id} | Get Airbnb listing |
| [**v1_channels_airbnb_listings_id_photos_get**](AirbnbApi.md#v1_channels_airbnb_listings_id_photos_get) | **GET** /v1/channels/airbnb/listings/{id}/photos | List Airbnb photos |
| [**v1_channels_airbnb_listings_id_photos_post**](AirbnbApi.md#v1_channels_airbnb_listings_id_photos_post) | **POST** /v1/channels/airbnb/listings/{id}/photos | Upload photos to Airbnb |
| [**v1_channels_airbnb_listings_id_post**](AirbnbApi.md#v1_channels_airbnb_listings_id_post) | **POST** /v1/channels/airbnb/listings/{id} | Listing action (push/publish/unlist/delete) |
| [**v1_channels_airbnb_listings_id_pricing_get**](AirbnbApi.md#v1_channels_airbnb_listings_id_pricing_get) | **GET** /v1/channels/airbnb/listings/{id}/pricing | Get Airbnb pricing |
| [**v1_channels_airbnb_listings_id_pricing_put**](AirbnbApi.md#v1_channels_airbnb_listings_id_pricing_put) | **PUT** /v1/channels/airbnb/listings/{id}/pricing | Update Airbnb pricing |
| [**v1_channels_airbnb_listings_post**](AirbnbApi.md#v1_channels_airbnb_listings_post) | **POST** /v1/channels/airbnb/listings | Create/push Airbnb listing |
| [**v1_channels_airbnb_messaging_get**](AirbnbApi.md#v1_channels_airbnb_messaging_get) | **GET** /v1/channels/airbnb/messaging | List Airbnb message threads |
| [**v1_channels_airbnb_messaging_thread_id_messages_get**](AirbnbApi.md#v1_channels_airbnb_messaging_thread_id_messages_get) | **GET** /v1/channels/airbnb/messaging/{threadId}/messages | Get Airbnb messages |
| [**v1_channels_airbnb_messaging_thread_id_messages_post**](AirbnbApi.md#v1_channels_airbnb_messaging_thread_id_messages_post) | **POST** /v1/channels/airbnb/messaging/{threadId}/messages | Send Airbnb message |
| [**v1_channels_airbnb_reservations_code_get**](AirbnbApi.md#v1_channels_airbnb_reservations_code_get) | **GET** /v1/channels/airbnb/reservations/{code} | Get Airbnb reservation |
| [**v1_channels_airbnb_reservations_code_post**](AirbnbApi.md#v1_channels_airbnb_reservations_code_post) | **POST** /v1/channels/airbnb/reservations/{code} | Accept/decline/cancel Airbnb reservation |
| [**v1_channels_airbnb_reservations_get**](AirbnbApi.md#v1_channels_airbnb_reservations_get) | **GET** /v1/channels/airbnb/reservations | List Airbnb reservations |
| [**v1_channels_airbnb_reviews_get**](AirbnbApi.md#v1_channels_airbnb_reviews_get) | **GET** /v1/channels/airbnb/reviews | List Airbnb reviews |
| [**v1_channels_airbnb_reviews_post**](AirbnbApi.md#v1_channels_airbnb_reviews_post) | **POST** /v1/channels/airbnb/reviews | Respond to Airbnb review |
| [**v1_channels_airbnb_sync_post**](AirbnbApi.md#v1_channels_airbnb_sync_post) | **POST** /v1/channels/airbnb/sync | Bulk sync to Airbnb |


## v1_channels_airbnb_listings_get

> v1_channels_airbnb_listings_get

List Airbnb listings

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
  # List Airbnb listings
  api_instance.v1_channels_airbnb_listings_get
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_get: #{e}"
end
```

#### Using the v1_channels_airbnb_listings_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_listings_get_with_http_info

```ruby
begin
  # List Airbnb listings
  data, status_code, headers = api_instance.v1_channels_airbnb_listings_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_get_with_http_info: #{e}"
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


## v1_channels_airbnb_listings_id_availability_get

> v1_channels_airbnb_listings_id_availability_get(id)

Get Airbnb availability

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
  api_instance.v1_channels_airbnb_listings_id_availability_get(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_availability_get: #{e}"
end
```

#### Using the v1_channels_airbnb_listings_id_availability_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_listings_id_availability_get_with_http_info(id)

```ruby
begin
  # Get Airbnb availability
  data, status_code, headers = api_instance.v1_channels_airbnb_listings_id_availability_get_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_availability_get_with_http_info: #{e}"
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


## v1_channels_airbnb_listings_id_availability_put

> v1_channels_airbnb_listings_id_availability_put(id)

Update Airbnb availability

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
  # Update Airbnb availability
  api_instance.v1_channels_airbnb_listings_id_availability_put(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_availability_put: #{e}"
end
```

#### Using the v1_channels_airbnb_listings_id_availability_put_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_listings_id_availability_put_with_http_info(id)

```ruby
begin
  # Update Airbnb availability
  data, status_code, headers = api_instance.v1_channels_airbnb_listings_id_availability_put_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_availability_put_with_http_info: #{e}"
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


## v1_channels_airbnb_listings_id_get

> v1_channels_airbnb_listings_id_get(id)

Get Airbnb listing

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
  # Get Airbnb listing
  api_instance.v1_channels_airbnb_listings_id_get(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_get: #{e}"
end
```

#### Using the v1_channels_airbnb_listings_id_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_listings_id_get_with_http_info(id)

```ruby
begin
  # Get Airbnb listing
  data, status_code, headers = api_instance.v1_channels_airbnb_listings_id_get_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_get_with_http_info: #{e}"
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


## v1_channels_airbnb_listings_id_photos_get

> v1_channels_airbnb_listings_id_photos_get(id)

List Airbnb photos

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
  api_instance.v1_channels_airbnb_listings_id_photos_get(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_photos_get: #{e}"
end
```

#### Using the v1_channels_airbnb_listings_id_photos_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_listings_id_photos_get_with_http_info(id)

```ruby
begin
  # List Airbnb photos
  data, status_code, headers = api_instance.v1_channels_airbnb_listings_id_photos_get_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_photos_get_with_http_info: #{e}"
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


## v1_channels_airbnb_listings_id_photos_post

> v1_channels_airbnb_listings_id_photos_post(id)

Upload photos to Airbnb

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
  api_instance.v1_channels_airbnb_listings_id_photos_post(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_photos_post: #{e}"
end
```

#### Using the v1_channels_airbnb_listings_id_photos_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_listings_id_photos_post_with_http_info(id)

```ruby
begin
  # Upload photos to Airbnb
  data, status_code, headers = api_instance.v1_channels_airbnb_listings_id_photos_post_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_photos_post_with_http_info: #{e}"
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


## v1_channels_airbnb_listings_id_post

> v1_channels_airbnb_listings_id_post(id)

Listing action (push/publish/unlist/delete)

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
  # Listing action (push/publish/unlist/delete)
  api_instance.v1_channels_airbnb_listings_id_post(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_post: #{e}"
end
```

#### Using the v1_channels_airbnb_listings_id_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_listings_id_post_with_http_info(id)

```ruby
begin
  # Listing action (push/publish/unlist/delete)
  data, status_code, headers = api_instance.v1_channels_airbnb_listings_id_post_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_post_with_http_info: #{e}"
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


## v1_channels_airbnb_listings_id_pricing_get

> v1_channels_airbnb_listings_id_pricing_get(id)

Get Airbnb pricing

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
  api_instance.v1_channels_airbnb_listings_id_pricing_get(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_pricing_get: #{e}"
end
```

#### Using the v1_channels_airbnb_listings_id_pricing_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_listings_id_pricing_get_with_http_info(id)

```ruby
begin
  # Get Airbnb pricing
  data, status_code, headers = api_instance.v1_channels_airbnb_listings_id_pricing_get_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_pricing_get_with_http_info: #{e}"
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


## v1_channels_airbnb_listings_id_pricing_put

> v1_channels_airbnb_listings_id_pricing_put(id)

Update Airbnb pricing

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
  # Update Airbnb pricing
  api_instance.v1_channels_airbnb_listings_id_pricing_put(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_pricing_put: #{e}"
end
```

#### Using the v1_channels_airbnb_listings_id_pricing_put_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_listings_id_pricing_put_with_http_info(id)

```ruby
begin
  # Update Airbnb pricing
  data, status_code, headers = api_instance.v1_channels_airbnb_listings_id_pricing_put_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_id_pricing_put_with_http_info: #{e}"
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


## v1_channels_airbnb_listings_post

> v1_channels_airbnb_listings_post

Create/push Airbnb listing

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
  # Create/push Airbnb listing
  api_instance.v1_channels_airbnb_listings_post
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_post: #{e}"
end
```

#### Using the v1_channels_airbnb_listings_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_listings_post_with_http_info

```ruby
begin
  # Create/push Airbnb listing
  data, status_code, headers = api_instance.v1_channels_airbnb_listings_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_listings_post_with_http_info: #{e}"
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


## v1_channels_airbnb_messaging_get

> v1_channels_airbnb_messaging_get

List Airbnb message threads

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
  api_instance.v1_channels_airbnb_messaging_get
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_messaging_get: #{e}"
end
```

#### Using the v1_channels_airbnb_messaging_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_messaging_get_with_http_info

```ruby
begin
  # List Airbnb message threads
  data, status_code, headers = api_instance.v1_channels_airbnb_messaging_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_messaging_get_with_http_info: #{e}"
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


## v1_channels_airbnb_messaging_thread_id_messages_get

> v1_channels_airbnb_messaging_thread_id_messages_get(thread_id)

Get Airbnb messages

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
  api_instance.v1_channels_airbnb_messaging_thread_id_messages_get(thread_id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_messaging_thread_id_messages_get: #{e}"
end
```

#### Using the v1_channels_airbnb_messaging_thread_id_messages_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_messaging_thread_id_messages_get_with_http_info(thread_id)

```ruby
begin
  # Get Airbnb messages
  data, status_code, headers = api_instance.v1_channels_airbnb_messaging_thread_id_messages_get_with_http_info(thread_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_messaging_thread_id_messages_get_with_http_info: #{e}"
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


## v1_channels_airbnb_messaging_thread_id_messages_post

> v1_channels_airbnb_messaging_thread_id_messages_post(thread_id)

Send Airbnb message

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
  api_instance.v1_channels_airbnb_messaging_thread_id_messages_post(thread_id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_messaging_thread_id_messages_post: #{e}"
end
```

#### Using the v1_channels_airbnb_messaging_thread_id_messages_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_messaging_thread_id_messages_post_with_http_info(thread_id)

```ruby
begin
  # Send Airbnb message
  data, status_code, headers = api_instance.v1_channels_airbnb_messaging_thread_id_messages_post_with_http_info(thread_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_messaging_thread_id_messages_post_with_http_info: #{e}"
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


## v1_channels_airbnb_reservations_code_get

> v1_channels_airbnb_reservations_code_get(code)

Get Airbnb reservation

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
  api_instance.v1_channels_airbnb_reservations_code_get(code)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_reservations_code_get: #{e}"
end
```

#### Using the v1_channels_airbnb_reservations_code_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_reservations_code_get_with_http_info(code)

```ruby
begin
  # Get Airbnb reservation
  data, status_code, headers = api_instance.v1_channels_airbnb_reservations_code_get_with_http_info(code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_reservations_code_get_with_http_info: #{e}"
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


## v1_channels_airbnb_reservations_code_post

> v1_channels_airbnb_reservations_code_post(code)

Accept/decline/cancel Airbnb reservation

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
  api_instance.v1_channels_airbnb_reservations_code_post(code)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_reservations_code_post: #{e}"
end
```

#### Using the v1_channels_airbnb_reservations_code_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_reservations_code_post_with_http_info(code)

```ruby
begin
  # Accept/decline/cancel Airbnb reservation
  data, status_code, headers = api_instance.v1_channels_airbnb_reservations_code_post_with_http_info(code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_reservations_code_post_with_http_info: #{e}"
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


## v1_channels_airbnb_reservations_get

> v1_channels_airbnb_reservations_get

List Airbnb reservations

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
  # List Airbnb reservations
  api_instance.v1_channels_airbnb_reservations_get
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_reservations_get: #{e}"
end
```

#### Using the v1_channels_airbnb_reservations_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_reservations_get_with_http_info

```ruby
begin
  # List Airbnb reservations
  data, status_code, headers = api_instance.v1_channels_airbnb_reservations_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_reservations_get_with_http_info: #{e}"
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


## v1_channels_airbnb_reviews_get

> v1_channels_airbnb_reviews_get

List Airbnb reviews

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
  api_instance.v1_channels_airbnb_reviews_get
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_reviews_get: #{e}"
end
```

#### Using the v1_channels_airbnb_reviews_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_reviews_get_with_http_info

```ruby
begin
  # List Airbnb reviews
  data, status_code, headers = api_instance.v1_channels_airbnb_reviews_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_reviews_get_with_http_info: #{e}"
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


## v1_channels_airbnb_reviews_post

> v1_channels_airbnb_reviews_post

Respond to Airbnb review

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
  # Respond to Airbnb review
  api_instance.v1_channels_airbnb_reviews_post
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_reviews_post: #{e}"
end
```

#### Using the v1_channels_airbnb_reviews_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_reviews_post_with_http_info

```ruby
begin
  # Respond to Airbnb review
  data, status_code, headers = api_instance.v1_channels_airbnb_reviews_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_reviews_post_with_http_info: #{e}"
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


## v1_channels_airbnb_sync_post

> v1_channels_airbnb_sync_post

Bulk sync to Airbnb

Push all property data to Airbnb in one call.

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
  # Bulk sync to Airbnb
  api_instance.v1_channels_airbnb_sync_post
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_sync_post: #{e}"
end
```

#### Using the v1_channels_airbnb_sync_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_airbnb_sync_post_with_http_info

```ruby
begin
  # Bulk sync to Airbnb
  data, status_code, headers = api_instance.v1_channels_airbnb_sync_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->v1_channels_airbnb_sync_post_with_http_info: #{e}"
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

