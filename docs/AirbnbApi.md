# Repull::AirbnbApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**airbnb_listing_action**](AirbnbApi.md#airbnb_listing_action) | **POST** /v1/channels/airbnb/listings/{id} | Listing action (push/publish/unlist/delete) |
| [**airbnb_reservation_action**](AirbnbApi.md#airbnb_reservation_action) | **POST** /v1/channels/airbnb/reservations/{code} | Accept/decline/cancel Airbnb reservation |
| [**create_airbnb_listing**](AirbnbApi.md#create_airbnb_listing) | **POST** /v1/channels/airbnb/listings | Create/push Airbnb listing |
| [**get_airbnb_listing**](AirbnbApi.md#get_airbnb_listing) | **GET** /v1/channels/airbnb/listings/{id} | Get Airbnb listing |
| [**get_airbnb_listing_availability**](AirbnbApi.md#get_airbnb_listing_availability) | **GET** /v1/channels/airbnb/listings/{id}/availability | Get Airbnb availability |
| [**get_airbnb_listing_pricing**](AirbnbApi.md#get_airbnb_listing_pricing) | **GET** /v1/channels/airbnb/listings/{id}/pricing | Get Airbnb pricing |
| [**get_airbnb_reservation**](AirbnbApi.md#get_airbnb_reservation) | **GET** /v1/channels/airbnb/reservations/{code} | Get Airbnb reservation |
| [**list_airbnb_listing_photos**](AirbnbApi.md#list_airbnb_listing_photos) | **GET** /v1/channels/airbnb/listings/{id}/photos | List Airbnb photos |
| [**list_airbnb_listings**](AirbnbApi.md#list_airbnb_listings) | **GET** /v1/channels/airbnb/listings | List Airbnb listings |
| [**list_airbnb_reservations**](AirbnbApi.md#list_airbnb_reservations) | **GET** /v1/channels/airbnb/reservations | List Airbnb reservations |
| [**list_airbnb_reviews**](AirbnbApi.md#list_airbnb_reviews) | **GET** /v1/channels/airbnb/reviews | List Airbnb reviews |
| [**list_airbnb_thread_messages**](AirbnbApi.md#list_airbnb_thread_messages) | **GET** /v1/channels/airbnb/messaging/{threadId}/messages | Get Airbnb messages |
| [**list_airbnb_threads**](AirbnbApi.md#list_airbnb_threads) | **GET** /v1/channels/airbnb/messaging | List Airbnb message threads |
| [**respond_airbnb_review**](AirbnbApi.md#respond_airbnb_review) | **POST** /v1/channels/airbnb/reviews | Respond to Airbnb review |
| [**send_airbnb_message**](AirbnbApi.md#send_airbnb_message) | **POST** /v1/channels/airbnb/messaging/{threadId}/messages | Send Airbnb message |
| [**sync_airbnb**](AirbnbApi.md#sync_airbnb) | **POST** /v1/channels/airbnb/sync | Bulk sync to Airbnb |
| [**update_airbnb_listing_availability**](AirbnbApi.md#update_airbnb_listing_availability) | **PUT** /v1/channels/airbnb/listings/{id}/availability | Update Airbnb availability |
| [**update_airbnb_listing_pricing**](AirbnbApi.md#update_airbnb_listing_pricing) | **PUT** /v1/channels/airbnb/listings/{id}/pricing | Update Airbnb pricing |
| [**upload_airbnb_listing_photos**](AirbnbApi.md#upload_airbnb_listing_photos) | **POST** /v1/channels/airbnb/listings/{id}/photos | Upload photos to Airbnb |


## airbnb_listing_action

> airbnb_listing_action(id)

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
  api_instance.airbnb_listing_action(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_listing_action: #{e}"
end
```

#### Using the airbnb_listing_action_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> airbnb_listing_action_with_http_info(id)

```ruby
begin
  # Listing action (push/publish/unlist/delete)
  data, status_code, headers = api_instance.airbnb_listing_action_with_http_info(id)
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

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## airbnb_reservation_action

> airbnb_reservation_action(code)

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


## create_airbnb_listing

> <AirbnbListing> create_airbnb_listing

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
  result = api_instance.create_airbnb_listing
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_listing: #{e}"
end
```

#### Using the create_airbnb_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbListing>, Integer, Hash)> create_airbnb_listing_with_http_info

```ruby
begin
  # Create/push Airbnb listing
  data, status_code, headers = api_instance.create_airbnb_listing_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbListing>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_listing_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AirbnbListing**](AirbnbListing.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_listing

> <AirbnbListing> get_airbnb_listing(id)

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
  result = api_instance.get_airbnb_listing(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing: #{e}"
end
```

#### Using the get_airbnb_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbListing>, Integer, Hash)> get_airbnb_listing_with_http_info(id)

```ruby
begin
  # Get Airbnb listing
  data, status_code, headers = api_instance.get_airbnb_listing_with_http_info(id)
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


## get_airbnb_reservation

> <AirbnbReservation> get_airbnb_reservation(code)

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


## list_airbnb_listing_photos

> list_airbnb_listing_photos(id)

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


## list_airbnb_listings

> <AirbnbListingListResponse> list_airbnb_listings

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
  result = api_instance.list_airbnb_listings
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listings: #{e}"
end
```

#### Using the list_airbnb_listings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbListingListResponse>, Integer, Hash)> list_airbnb_listings_with_http_info

```ruby
begin
  # List Airbnb listings
  data, status_code, headers = api_instance.list_airbnb_listings_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbListingListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listings_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AirbnbListingListResponse**](AirbnbListingListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_reservations

> <AirbnbReservationListResponse> list_airbnb_reservations

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
  result = api_instance.list_airbnb_reservations
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_reservations: #{e}"
end
```

#### Using the list_airbnb_reservations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReservationListResponse>, Integer, Hash)> list_airbnb_reservations_with_http_info

```ruby
begin
  # List Airbnb reservations
  data, status_code, headers = api_instance.list_airbnb_reservations_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReservationListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_reservations_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

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


## respond_airbnb_review

> respond_airbnb_review

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
  api_instance.respond_airbnb_review
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->respond_airbnb_review: #{e}"
end
```

#### Using the respond_airbnb_review_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> respond_airbnb_review_with_http_info

```ruby
begin
  # Respond to Airbnb review
  data, status_code, headers = api_instance.respond_airbnb_review_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->respond_airbnb_review_with_http_info: #{e}"
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


## sync_airbnb

> sync_airbnb

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
  api_instance.sync_airbnb
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->sync_airbnb: #{e}"
end
```

#### Using the sync_airbnb_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> sync_airbnb_with_http_info

```ruby
begin
  # Bulk sync to Airbnb
  data, status_code, headers = api_instance.sync_airbnb_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->sync_airbnb_with_http_info: #{e}"
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


## update_airbnb_listing_availability

> update_airbnb_listing_availability(id)

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
  api_instance.update_airbnb_listing_availability(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_availability: #{e}"
end
```

#### Using the update_airbnb_listing_availability_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_airbnb_listing_availability_with_http_info(id)

```ruby
begin
  # Update Airbnb availability
  data, status_code, headers = api_instance.update_airbnb_listing_availability_with_http_info(id)
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

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## update_airbnb_listing_pricing

> update_airbnb_listing_pricing(id)

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
  api_instance.update_airbnb_listing_pricing(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_pricing: #{e}"
end
```

#### Using the update_airbnb_listing_pricing_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_airbnb_listing_pricing_with_http_info(id)

```ruby
begin
  # Update Airbnb pricing
  data, status_code, headers = api_instance.update_airbnb_listing_pricing_with_http_info(id)
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

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## upload_airbnb_listing_photos

> upload_airbnb_listing_photos(id)

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

