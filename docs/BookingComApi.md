# Repull::BookingComApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_channels_booking_availability_put**](BookingComApi.md#v1_channels_booking_availability_put) | **PUT** /v1/channels/booking/availability | Update Booking.com rates/availability |
| [**v1_channels_booking_content_get**](BookingComApi.md#v1_channels_booking_content_get) | **GET** /v1/channels/booking/content | Get Booking.com content |
| [**v1_channels_booking_content_post**](BookingComApi.md#v1_channels_booking_content_post) | **POST** /v1/channels/booking/content | Update Booking.com content |
| [**v1_channels_booking_messaging_get**](BookingComApi.md#v1_channels_booking_messaging_get) | **GET** /v1/channels/booking/messaging | List Booking.com conversations |
| [**v1_channels_booking_messaging_post**](BookingComApi.md#v1_channels_booking_messaging_post) | **POST** /v1/channels/booking/messaging | Send Booking.com message |
| [**v1_channels_booking_properties_get**](BookingComApi.md#v1_channels_booking_properties_get) | **GET** /v1/channels/booking/properties | List Booking.com properties |
| [**v1_channels_booking_properties_post**](BookingComApi.md#v1_channels_booking_properties_post) | **POST** /v1/channels/booking/properties | Create Booking.com property |
| [**v1_channels_booking_sync_post**](BookingComApi.md#v1_channels_booking_sync_post) | **POST** /v1/channels/booking/sync | Bulk sync to Booking.com |


## v1_channels_booking_availability_put

> v1_channels_booking_availability_put

Update Booking.com rates/availability

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
  api_instance.v1_channels_booking_availability_put
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_availability_put: #{e}"
end
```

#### Using the v1_channels_booking_availability_put_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_booking_availability_put_with_http_info

```ruby
begin
  # Update Booking.com rates/availability
  data, status_code, headers = api_instance.v1_channels_booking_availability_put_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_availability_put_with_http_info: #{e}"
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


## v1_channels_booking_content_get

> v1_channels_booking_content_get

Get Booking.com content

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
  api_instance.v1_channels_booking_content_get
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_content_get: #{e}"
end
```

#### Using the v1_channels_booking_content_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_booking_content_get_with_http_info

```ruby
begin
  # Get Booking.com content
  data, status_code, headers = api_instance.v1_channels_booking_content_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_content_get_with_http_info: #{e}"
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


## v1_channels_booking_content_post

> v1_channels_booking_content_post

Update Booking.com content

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
  api_instance.v1_channels_booking_content_post
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_content_post: #{e}"
end
```

#### Using the v1_channels_booking_content_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_booking_content_post_with_http_info

```ruby
begin
  # Update Booking.com content
  data, status_code, headers = api_instance.v1_channels_booking_content_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_content_post_with_http_info: #{e}"
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


## v1_channels_booking_messaging_get

> v1_channels_booking_messaging_get

List Booking.com conversations

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
  api_instance.v1_channels_booking_messaging_get
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_messaging_get: #{e}"
end
```

#### Using the v1_channels_booking_messaging_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_booking_messaging_get_with_http_info

```ruby
begin
  # List Booking.com conversations
  data, status_code, headers = api_instance.v1_channels_booking_messaging_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_messaging_get_with_http_info: #{e}"
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


## v1_channels_booking_messaging_post

> v1_channels_booking_messaging_post

Send Booking.com message

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
  api_instance.v1_channels_booking_messaging_post
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_messaging_post: #{e}"
end
```

#### Using the v1_channels_booking_messaging_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_booking_messaging_post_with_http_info

```ruby
begin
  # Send Booking.com message
  data, status_code, headers = api_instance.v1_channels_booking_messaging_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_messaging_post_with_http_info: #{e}"
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


## v1_channels_booking_properties_get

> v1_channels_booking_properties_get

List Booking.com properties

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
  api_instance.v1_channels_booking_properties_get
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_properties_get: #{e}"
end
```

#### Using the v1_channels_booking_properties_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_booking_properties_get_with_http_info

```ruby
begin
  # List Booking.com properties
  data, status_code, headers = api_instance.v1_channels_booking_properties_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_properties_get_with_http_info: #{e}"
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


## v1_channels_booking_properties_post

> v1_channels_booking_properties_post

Create Booking.com property

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
  api_instance.v1_channels_booking_properties_post
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_properties_post: #{e}"
end
```

#### Using the v1_channels_booking_properties_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_booking_properties_post_with_http_info

```ruby
begin
  # Create Booking.com property
  data, status_code, headers = api_instance.v1_channels_booking_properties_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_properties_post_with_http_info: #{e}"
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


## v1_channels_booking_sync_post

> v1_channels_booking_sync_post

Bulk sync to Booking.com

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
  api_instance.v1_channels_booking_sync_post
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_sync_post: #{e}"
end
```

#### Using the v1_channels_booking_sync_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_booking_sync_post_with_http_info

```ruby
begin
  # Bulk sync to Booking.com
  data, status_code, headers = api_instance.v1_channels_booking_sync_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BookingComApi->v1_channels_booking_sync_post_with_http_info: #{e}"
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

