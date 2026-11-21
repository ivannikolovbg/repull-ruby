# Repull::VRBOApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**add_vrbo_listing_video**](VRBOApi.md#add_vrbo_listing_video) | **POST** /v1/channels/vrbo/listings/{id}/videos | Add a video to the Vrbo listing |
| [**delete_vrbo_listing_videos**](VRBOApi.md#delete_vrbo_listing_videos) | **DELETE** /v1/channels/vrbo/listings/{id}/videos | Remove videos from the Vrbo listing |
| [**get_vrbo_listing_additional_info**](VRBOApi.md#get_vrbo_listing_additional_info) | **GET** /v1/channels/vrbo/listings/{id}/additional-info | Get the Vrbo additional details |
| [**get_vrbo_listing_amenities**](VRBOApi.md#get_vrbo_listing_amenities) | **GET** /v1/channels/vrbo/listings/{id}/amenities | Get the Vrbo amenities |
| [**get_vrbo_listing_booking_settings**](VRBOApi.md#get_vrbo_listing_booking_settings) | **GET** /v1/channels/vrbo/listings/{id}/booking-settings | Get the Vrbo booking settings |
| [**get_vrbo_listing_cancellation**](VRBOApi.md#get_vrbo_listing_cancellation) | **GET** /v1/channels/vrbo/listings/{id}/cancellation | Get the Vrbo cancellation policy |
| [**get_vrbo_listing_content**](VRBOApi.md#get_vrbo_listing_content) | **GET** /v1/channels/vrbo/listings/{id}/content | Get several Vrbo listing sections |
| [**get_vrbo_listing_description**](VRBOApi.md#get_vrbo_listing_description) | **GET** /v1/channels/vrbo/listings/{id}/description | Get the Vrbo headline and description |
| [**get_vrbo_listing_fees**](VRBOApi.md#get_vrbo_listing_fees) | **GET** /v1/channels/vrbo/listings/{id}/fees | Get the Vrbo fees |
| [**get_vrbo_listing_house_rules**](VRBOApi.md#get_vrbo_listing_house_rules) | **GET** /v1/channels/vrbo/listings/{id}/house-rules | Get the Vrbo house rules |
| [**get_vrbo_listing_location**](VRBOApi.md#get_vrbo_listing_location) | **GET** /v1/channels/vrbo/listings/{id}/location | Get the Vrbo map setting |
| [**get_vrbo_listing_payment_terms**](VRBOApi.md#get_vrbo_listing_payment_terms) | **GET** /v1/channels/vrbo/listings/{id}/payment-terms | Get the Vrbo payment terms |
| [**get_vrbo_listing_photos**](VRBOApi.md#get_vrbo_listing_photos) | **GET** /v1/channels/vrbo/listings/{id}/photos | Get the Vrbo photos |
| [**get_vrbo_listing_pricing**](VRBOApi.md#get_vrbo_listing_pricing) | **GET** /v1/channels/vrbo/listings/{id}/pricing | Get the Vrbo base pricing |
| [**get_vrbo_listing_property**](VRBOApi.md#get_vrbo_listing_property) | **GET** /v1/channels/vrbo/listings/{id}/property | Get the Vrbo property details |
| [**get_vrbo_listing_protection**](VRBOApi.md#get_vrbo_listing_protection) | **GET** /v1/channels/vrbo/listings/{id}/protection | Get the Vrbo damage protection |
| [**get_vrbo_listing_rates**](VRBOApi.md#get_vrbo_listing_rates) | **GET** /v1/channels/vrbo/listings/{id}/rates | Get the Vrbo rates and stay discounts |
| [**get_vrbo_listing_registration**](VRBOApi.md#get_vrbo_listing_registration) | **GET** /v1/channels/vrbo/listings/{id}/registration | Get the Vrbo registration / licence |
| [**get_vrbo_listing_rooms**](VRBOApi.md#get_vrbo_listing_rooms) | **GET** /v1/channels/vrbo/listings/{id}/rooms | Get the Vrbo rooms and spaces |
| [**get_vrbo_listing_story**](VRBOApi.md#get_vrbo_listing_story) | **GET** /v1/channels/vrbo/listings/{id}/story | Get the Vrbo host story |
| [**get_vrbo_listing_taxes**](VRBOApi.md#get_vrbo_listing_taxes) | **GET** /v1/channels/vrbo/listings/{id}/taxes | Get the Vrbo taxes |
| [**get_vrbo_listing_translations**](VRBOApi.md#get_vrbo_listing_translations) | **GET** /v1/channels/vrbo/listings/{id}/translations | Get the Vrbo manual translations |
| [**get_vrbo_listing_videos**](VRBOApi.md#get_vrbo_listing_videos) | **GET** /v1/channels/vrbo/listings/{id}/videos | Get the Vrbo videos |
| [**get_vrbo_listing_welcome_guide**](VRBOApi.md#get_vrbo_listing_welcome_guide) | **GET** /v1/channels/vrbo/listings/{id}/welcome-guide | Get the Vrbo welcome guide |
| [**list_vrbo_listings**](VRBOApi.md#list_vrbo_listings) | **GET** /v1/channels/vrbo/listings | List VRBO listings |
| [**list_vrbo_reservations**](VRBOApi.md#list_vrbo_reservations) | **GET** /v1/channels/vrbo/reservations | List VRBO reservations |
| [**update_vrbo_listing_additional_info**](VRBOApi.md#update_vrbo_listing_additional_info) | **PUT** /v1/channels/vrbo/listings/{id}/additional-info | Update the Vrbo additional details |
| [**update_vrbo_listing_amenities**](VRBOApi.md#update_vrbo_listing_amenities) | **PUT** /v1/channels/vrbo/listings/{id}/amenities | Update the Vrbo amenities |
| [**update_vrbo_listing_booking_settings**](VRBOApi.md#update_vrbo_listing_booking_settings) | **PUT** /v1/channels/vrbo/listings/{id}/booking-settings | Update the Vrbo booking settings |
| [**update_vrbo_listing_cancellation**](VRBOApi.md#update_vrbo_listing_cancellation) | **PUT** /v1/channels/vrbo/listings/{id}/cancellation | Update the Vrbo cancellation policy |
| [**update_vrbo_listing_description**](VRBOApi.md#update_vrbo_listing_description) | **PUT** /v1/channels/vrbo/listings/{id}/description | Update the Vrbo headline and description |
| [**update_vrbo_listing_fees**](VRBOApi.md#update_vrbo_listing_fees) | **PUT** /v1/channels/vrbo/listings/{id}/fees | Update the Vrbo fees |
| [**update_vrbo_listing_house_rules**](VRBOApi.md#update_vrbo_listing_house_rules) | **PUT** /v1/channels/vrbo/listings/{id}/house-rules | Update the Vrbo house rules |
| [**update_vrbo_listing_location**](VRBOApi.md#update_vrbo_listing_location) | **PUT** /v1/channels/vrbo/listings/{id}/location | Update the Vrbo map setting |
| [**update_vrbo_listing_payment_terms**](VRBOApi.md#update_vrbo_listing_payment_terms) | **PUT** /v1/channels/vrbo/listings/{id}/payment-terms | Update the Vrbo payment terms |
| [**update_vrbo_listing_photos**](VRBOApi.md#update_vrbo_listing_photos) | **PUT** /v1/channels/vrbo/listings/{id}/photos | Update the Vrbo photos |
| [**update_vrbo_listing_pricing**](VRBOApi.md#update_vrbo_listing_pricing) | **PUT** /v1/channels/vrbo/listings/{id}/pricing | Update the Vrbo base pricing |
| [**update_vrbo_listing_property**](VRBOApi.md#update_vrbo_listing_property) | **PUT** /v1/channels/vrbo/listings/{id}/property | Update the Vrbo property details |
| [**update_vrbo_listing_protection**](VRBOApi.md#update_vrbo_listing_protection) | **PUT** /v1/channels/vrbo/listings/{id}/protection | Update the Vrbo damage protection |
| [**update_vrbo_listing_rates**](VRBOApi.md#update_vrbo_listing_rates) | **PUT** /v1/channels/vrbo/listings/{id}/rates | Update the Vrbo rates and stay discounts |
| [**update_vrbo_listing_registration**](VRBOApi.md#update_vrbo_listing_registration) | **PUT** /v1/channels/vrbo/listings/{id}/registration | Update the Vrbo registration / licence |
| [**update_vrbo_listing_rooms**](VRBOApi.md#update_vrbo_listing_rooms) | **PUT** /v1/channels/vrbo/listings/{id}/rooms | Update the Vrbo rooms and spaces |
| [**update_vrbo_listing_story**](VRBOApi.md#update_vrbo_listing_story) | **PUT** /v1/channels/vrbo/listings/{id}/story | Update the Vrbo host story |
| [**update_vrbo_listing_taxes**](VRBOApi.md#update_vrbo_listing_taxes) | **PUT** /v1/channels/vrbo/listings/{id}/taxes | Update the Vrbo taxes |
| [**update_vrbo_listing_translations**](VRBOApi.md#update_vrbo_listing_translations) | **PUT** /v1/channels/vrbo/listings/{id}/translations | Update the Vrbo manual translations |
| [**update_vrbo_listing_welcome_guide**](VRBOApi.md#update_vrbo_listing_welcome_guide) | **PUT** /v1/channels/vrbo/listings/{id}/welcome-guide | Update the Vrbo welcome guide |


## add_vrbo_listing_video

> <AddVrboListingVideo200Response> add_vrbo_listing_video(id, add_vrbo_listing_video_request, opts)

Add a video to the Vrbo listing

Add one video to the listing's existing Vrbo listing from an https URL. POST `{url}`: an https URL of an MP4, MOV, WEBM, AVI or QT file (Vrbo takes up to 5 GB; we take up to 2 GB). The file is downloaded and uploaded to Vrbo, which then processes and reviews it. DELETE `?videoId=` removes videos.  **Cost:** the file is downloaded and uploaded to Vrbo inside the request — allow several minutes for a large file. The answer lists the videos as Vrbo has them; a new one shows Vrbo's processing status, and `rejectedReasons` once its review refuses it. Each call adds a video, so a retry after a timeout should read the videos first.  Needs full access (`403 vrbo_messaging_access` otherwise).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
add_vrbo_listing_video_request = Repull::AddVrboListingVideoRequest.new({url: 'url_example'}) # AddVrboListingVideoRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Add a video to the Vrbo listing
  result = api_instance.add_vrbo_listing_video(id, add_vrbo_listing_video_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->add_vrbo_listing_video: #{e}"
end
```

#### Using the add_vrbo_listing_video_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AddVrboListingVideo200Response>, Integer, Hash)> add_vrbo_listing_video_with_http_info(id, add_vrbo_listing_video_request, opts)

```ruby
begin
  # Add a video to the Vrbo listing
  data, status_code, headers = api_instance.add_vrbo_listing_video_with_http_info(id, add_vrbo_listing_video_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AddVrboListingVideo200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->add_vrbo_listing_video_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **add_vrbo_listing_video_request** | [**AddVrboListingVideoRequest**](AddVrboListingVideoRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**AddVrboListingVideo200Response**](AddVrboListingVideo200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_vrbo_listing_videos

> <AddVrboListingVideo200Response> delete_vrbo_listing_videos(id, video_id, opts)

Remove videos from the Vrbo listing

Remove videos from the listing's existing Vrbo listing by their `id` (from `GET …/videos`). The answer lists the videos Vrbo has left.  Needs full access (`403 vrbo_messaging_access` otherwise).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
video_id = '8a1f2c3d' # String | The `id` of the video to remove (comma-separated for several).
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Remove videos from the Vrbo listing
  result = api_instance.delete_vrbo_listing_videos(id, video_id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->delete_vrbo_listing_videos: #{e}"
end
```

#### Using the delete_vrbo_listing_videos_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AddVrboListingVideo200Response>, Integer, Hash)> delete_vrbo_listing_videos_with_http_info(id, video_id, opts)

```ruby
begin
  # Remove videos from the Vrbo listing
  data, status_code, headers = api_instance.delete_vrbo_listing_videos_with_http_info(id, video_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AddVrboListingVideo200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->delete_vrbo_listing_videos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **video_id** | **String** | The &#x60;id&#x60; of the video to remove (comma-separated for several). |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**AddVrboListingVideo200Response**](AddVrboListingVideo200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_additional_info

> <GetVrboListingAdditionalInfo200Response> get_vrbo_listing_additional_info(id, opts)

Get the Vrbo additional details

The free-text additional details for the property, its bedrooms and its bathrooms.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo additional details
  result = api_instance.get_vrbo_listing_additional_info(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_additional_info: #{e}"
end
```

#### Using the get_vrbo_listing_additional_info_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingAdditionalInfo200Response>, Integer, Hash)> get_vrbo_listing_additional_info_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo additional details
  data, status_code, headers = api_instance.get_vrbo_listing_additional_info_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingAdditionalInfo200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_additional_info_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingAdditionalInfo200Response**](GetVrboListingAdditionalInfo200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_amenities

> <GetVrboListingAmenities200Response> get_vrbo_listing_amenities(id, opts)

Get the Vrbo amenities

Vrbo's 19 amenity groups (~440 fields) — each field with its id, type (checkbox, choice, text, number, measurement, checkboxGroup), current value, options and the parent it is shown under (`shownWhen`). Includes location & view, nearby attractions and check-out instructions.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call per group (19 in all; narrow with `?groups=`) on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example', # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
  groups: 'essentials,internet' # String | Amenity groups to read, comma-separated (default: all 19 — one Vrbo call each): essentials, internet, climateControl, general, office, kitchenAndDining, parking, poolAndSpa, sustainability, entertainment, outdoor, onsiteService, accessibility, homeSafety, safetyDevices, enhancedCleaning, locationAndView, localAttractionsAndActivities, checkoutInstructions.
}

begin
  # Get the Vrbo amenities
  result = api_instance.get_vrbo_listing_amenities(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_amenities: #{e}"
end
```

#### Using the get_vrbo_listing_amenities_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingAmenities200Response>, Integer, Hash)> get_vrbo_listing_amenities_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo amenities
  data, status_code, headers = api_instance.get_vrbo_listing_amenities_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingAmenities200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_amenities_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |
| **groups** | **String** | Amenity groups to read, comma-separated (default: all 19 — one Vrbo call each): essentials, internet, climateControl, general, office, kitchenAndDining, parking, poolAndSpa, sustainability, entertainment, outdoor, onsiteService, accessibility, homeSafety, safetyDevices, enhancedCleaning, locationAndView, localAttractionsAndActivities, checkoutInstructions. | [optional] |

### Return type

[**GetVrboListingAmenities200Response**](GetVrboListingAmenities200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_booking_settings

> <GetVrboListingBookingSettings200Response> get_vrbo_listing_booking_settings(id, opts)

Get the Vrbo booking settings

Instant book or quote-and-hold, minimum nights, notice before arrival, how far ahead guests can book, maximum stay, access type.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo booking settings
  result = api_instance.get_vrbo_listing_booking_settings(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_booking_settings: #{e}"
end
```

#### Using the get_vrbo_listing_booking_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingBookingSettings200Response>, Integer, Hash)> get_vrbo_listing_booking_settings_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo booking settings
  data, status_code, headers = api_instance.get_vrbo_listing_booking_settings_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingBookingSettings200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_booking_settings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingBookingSettings200Response**](GetVrboListingBookingSettings200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_cancellation

> <GetVrboListingCancellation200Response> get_vrbo_listing_cancellation(id, opts)

Get the Vrbo cancellation policy

The policy (Vrbo's named ones or custom refund windows), seasonal overrides, and the named policies Vrbo offers.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo cancellation policy
  result = api_instance.get_vrbo_listing_cancellation(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_cancellation: #{e}"
end
```

#### Using the get_vrbo_listing_cancellation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingCancellation200Response>, Integer, Hash)> get_vrbo_listing_cancellation_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo cancellation policy
  data, status_code, headers = api_instance.get_vrbo_listing_cancellation_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingCancellation200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_cancellation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingCancellation200Response**](GetVrboListingCancellation200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_content

> <GetVrboListingContent200Response> get_vrbo_listing_content(id, sections, opts)

Get several Vrbo listing sections

Read several sections of the listing's Vrbo listing in one call. `sections` is required: name them (`?sections=description,house-rules,fees`) or ask for `all`.  **Cost:** each section is read live on Vrbo, with calls spaced ~3 s apart per account — `all` is about 45 Vrbo calls, **around 2.5 minutes**. Prefer the one-section endpoints (`GET /v1/channels/vrbo/listings/{id}/{section}`) and never poll this one. A section that fails carries `{ error: { code, message } }`; the others still answer.  Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
sections = 'description,house-rules,fees' # String | Comma-separated sections, or `all`: description, property, story, additional-info, translations, photos, amenities, rooms, location, house-rules, booking-settings, cancellation, fees, pricing, rates, payment-terms, protection, taxes, registration, welcome-guide, videos.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get several Vrbo listing sections
  result = api_instance.get_vrbo_listing_content(id, sections, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_content: #{e}"
end
```

#### Using the get_vrbo_listing_content_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingContent200Response>, Integer, Hash)> get_vrbo_listing_content_with_http_info(id, sections, opts)

```ruby
begin
  # Get several Vrbo listing sections
  data, status_code, headers = api_instance.get_vrbo_listing_content_with_http_info(id, sections, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingContent200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_content_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **sections** | **String** | Comma-separated sections, or &#x60;all&#x60;: description, property, story, additional-info, translations, photos, amenities, rooms, location, house-rules, booking-settings, cancellation, fees, pricing, rates, payment-terms, protection, taxes, registration, welcome-guide, videos. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingContent200Response**](GetVrboListingContent200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_description

> <GetVrboListingDescription200Response> get_vrbo_listing_description(id, opts)

Get the Vrbo headline and description

The headline (10–80 characters) and the description guests read.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo headline and description
  result = api_instance.get_vrbo_listing_description(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_description: #{e}"
end
```

#### Using the get_vrbo_listing_description_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingDescription200Response>, Integer, Hash)> get_vrbo_listing_description_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo headline and description
  data, status_code, headers = api_instance.get_vrbo_listing_description_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingDescription200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_description_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingDescription200Response**](GetVrboListingDescription200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_fees

> <GetVrboListingFees200Response> get_vrbo_listing_fees(id, opts)

Get the Vrbo fees

Cleaning, pet and extra-guest fees and custom fees, with their type (per stay / per night) and whether they are taxable.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo fees
  result = api_instance.get_vrbo_listing_fees(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_fees: #{e}"
end
```

#### Using the get_vrbo_listing_fees_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingFees200Response>, Integer, Hash)> get_vrbo_listing_fees_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo fees
  data, status_code, headers = api_instance.get_vrbo_listing_fees_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingFees200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_fees_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingFees200Response**](GetVrboListingFees200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_house_rules

> <GetVrboListingHouseRules200Response> get_vrbo_listing_house_rules(id, opts)

Get the Vrbo house rules

Check-in/out times, maximum guests and adults, minimum age, children (with age bands), pets (count, weight), smoking (inside/outside), events (attendee cap), up to 3 custom rules, the rental agreement.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo house rules
  result = api_instance.get_vrbo_listing_house_rules(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_house_rules: #{e}"
end
```

#### Using the get_vrbo_listing_house_rules_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingHouseRules200Response>, Integer, Hash)> get_vrbo_listing_house_rules_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo house rules
  data, status_code, headers = api_instance.get_vrbo_listing_house_rules_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingHouseRules200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_house_rules_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingHouseRules200Response**](GetVrboListingHouseRules200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_location

> <GetVrboListingLocation200Response> get_vrbo_listing_location(id, opts)

Get the Vrbo map setting

The address (read-only: Vrbo changes it only through its support) and whether guests see the exact location or an area.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo map setting
  result = api_instance.get_vrbo_listing_location(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_location: #{e}"
end
```

#### Using the get_vrbo_listing_location_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingLocation200Response>, Integer, Hash)> get_vrbo_listing_location_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo map setting
  data, status_code, headers = api_instance.get_vrbo_listing_location_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingLocation200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_location_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingLocation200Response**](GetVrboListingLocation200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_payment_terms

> <GetVrboListingPaymentTerms200Response> get_vrbo_listing_payment_terms(id, opts)

Get the Vrbo payment terms

How much the guest pays at booking and when the rest is due.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo payment terms
  result = api_instance.get_vrbo_listing_payment_terms(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_payment_terms: #{e}"
end
```

#### Using the get_vrbo_listing_payment_terms_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingPaymentTerms200Response>, Integer, Hash)> get_vrbo_listing_payment_terms_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo payment terms
  data, status_code, headers = api_instance.get_vrbo_listing_payment_terms_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingPaymentTerms200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_payment_terms_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingPaymentTerms200Response**](GetVrboListingPaymentTerms200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_photos

> <GetVrboListingPhotos200Response> get_vrbo_listing_photos(id, opts)

Get the Vrbo photos

Photos in order (id, url, caption, Vrbo's own tags, rank, rooms), plus any Vrbo moderation rejected and why.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo photos
  result = api_instance.get_vrbo_listing_photos(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_photos: #{e}"
end
```

#### Using the get_vrbo_listing_photos_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingPhotos200Response>, Integer, Hash)> get_vrbo_listing_photos_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo photos
  data, status_code, headers = api_instance.get_vrbo_listing_photos_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingPhotos200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_photos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingPhotos200Response**](GetVrboListingPhotos200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_pricing

> <GetVrboListingPricing200Response> get_vrbo_listing_pricing(id, opts)

Get the Vrbo base pricing

Base nightly rate per weekday, weekly and monthly discounts, default minimum stay, rate limits.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo base pricing
  result = api_instance.get_vrbo_listing_pricing(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_pricing: #{e}"
end
```

#### Using the get_vrbo_listing_pricing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingPricing200Response>, Integer, Hash)> get_vrbo_listing_pricing_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo base pricing
  data, status_code, headers = api_instance.get_vrbo_listing_pricing_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingPricing200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingPricing200Response**](GetVrboListingPricing200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_property

> <GetVrboListingProperty200Response> get_vrbo_listing_property(id, opts)

Get the Vrbo property details

Property type (and the types Vrbo offers), internal name, interior size, seniors-only and long-term-renter flags.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo property details
  result = api_instance.get_vrbo_listing_property(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_property: #{e}"
end
```

#### Using the get_vrbo_listing_property_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingProperty200Response>, Integer, Hash)> get_vrbo_listing_property_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo property details
  data, status_code, headers = api_instance.get_vrbo_listing_property_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingProperty200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_property_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingProperty200Response**](GetVrboListingProperty200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_protection

> <GetVrboListingProtection200Response> get_vrbo_listing_protection(id, opts)

Get the Vrbo damage protection

Refundable damage deposit and damage protection.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo damage protection
  result = api_instance.get_vrbo_listing_protection(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_protection: #{e}"
end
```

#### Using the get_vrbo_listing_protection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingProtection200Response>, Integer, Hash)> get_vrbo_listing_protection_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo damage protection
  data, status_code, headers = api_instance.get_vrbo_listing_protection_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingProtection200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_protection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingProtection200Response**](GetVrboListingProtection200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_rates

> <GetVrboListingRates200Response> get_vrbo_listing_rates(id, opts)

Get the Vrbo rates and stay discounts

Per night over a date range: the nightly rate, its weekday, the weekly (7–27 nights) and monthly (28+ nights) discounts and the minimum stay. Vrbo offers only these two stay discounts, saved per night with the weekday prices.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo calendar call (`?start=&end=`, default today + 13 days) on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example', # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
  start: Date.parse('2013-10-20'), # Date | First night to read (default today).
  _end: Date.parse('2013-10-20') # Date | Last night to read (default start + 13 days; at most 3 years).
}

begin
  # Get the Vrbo rates and stay discounts
  result = api_instance.get_vrbo_listing_rates(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_rates: #{e}"
end
```

#### Using the get_vrbo_listing_rates_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingRates200Response>, Integer, Hash)> get_vrbo_listing_rates_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo rates and stay discounts
  data, status_code, headers = api_instance.get_vrbo_listing_rates_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingRates200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_rates_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |
| **start** | **Date** | First night to read (default today). | [optional] |
| **_end** | **Date** | Last night to read (default start + 13 days; at most 3 years). | [optional] |

### Return type

[**GetVrboListingRates200Response**](GetVrboListingRates200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_registration

> <GetVrboListingRegistration200Response> get_vrbo_listing_registration(id, opts)

Get the Vrbo registration / licence

The local registration or licence fields Vrbo asks for in the listing's jurisdiction, and their status.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo registration / licence
  result = api_instance.get_vrbo_listing_registration(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_registration: #{e}"
end
```

#### Using the get_vrbo_listing_registration_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingRegistration200Response>, Integer, Hash)> get_vrbo_listing_registration_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo registration / licence
  data, status_code, headers = api_instance.get_vrbo_listing_registration_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingRegistration200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_registration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingRegistration200Response**](GetVrboListingRegistration200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_rooms

> <GetVrboListingRooms200Response> get_vrbo_listing_rooms(id, opts)

Get the Vrbo rooms and spaces

Bedrooms, bathrooms, living rooms and other spaces with their beds and room amenities; the space, bed and bathroom types Vrbo offers.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call + 1 per room on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo rooms and spaces
  result = api_instance.get_vrbo_listing_rooms(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_rooms: #{e}"
end
```

#### Using the get_vrbo_listing_rooms_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingRooms200Response>, Integer, Hash)> get_vrbo_listing_rooms_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo rooms and spaces
  data, status_code, headers = api_instance.get_vrbo_listing_rooms_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingRooms200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_rooms_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingRooms200Response**](GetVrboListingRooms200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_story

> <GetVrboListingStory200Response> get_vrbo_listing_story(id, opts)

Get the Vrbo host story

\"Your story\" on the listing: about you, why this property, what makes it unique.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo host story
  result = api_instance.get_vrbo_listing_story(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_story: #{e}"
end
```

#### Using the get_vrbo_listing_story_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingStory200Response>, Integer, Hash)> get_vrbo_listing_story_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo host story
  data, status_code, headers = api_instance.get_vrbo_listing_story_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingStory200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_story_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingStory200Response**](GetVrboListingStory200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_taxes

> <GetVrboListingTaxes200Response> get_vrbo_listing_taxes(id, opts)

Get the Vrbo taxes

Who collects tax and the rules that apply. Where Vrbo collects (e.g. British Columbia) the rules are read-only.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo taxes
  result = api_instance.get_vrbo_listing_taxes(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_taxes: #{e}"
end
```

#### Using the get_vrbo_listing_taxes_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingTaxes200Response>, Integer, Hash)> get_vrbo_listing_taxes_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo taxes
  data, status_code, headers = api_instance.get_vrbo_listing_taxes_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingTaxes200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_taxes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingTaxes200Response**](GetVrboListingTaxes200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_translations

> <GetVrboListingTranslations200Response> get_vrbo_listing_translations(id, opts)

Get the Vrbo manual translations

Headline and description written per language (they replace Vrbo's automatic translation), and the languages Vrbo offers.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call + 1 per language on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo manual translations
  result = api_instance.get_vrbo_listing_translations(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_translations: #{e}"
end
```

#### Using the get_vrbo_listing_translations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingTranslations200Response>, Integer, Hash)> get_vrbo_listing_translations_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo manual translations
  data, status_code, headers = api_instance.get_vrbo_listing_translations_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingTranslations200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_translations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingTranslations200Response**](GetVrboListingTranslations200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_videos

> <GetVrboListingVideos200Response> get_vrbo_listing_videos(id, opts)

Get the Vrbo videos

The listing's videos with their file name, Vrbo's processing and review status, player and thumbnail URLs, upload time and any reasons Vrbo rejected them.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo videos
  result = api_instance.get_vrbo_listing_videos(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_videos: #{e}"
end
```

#### Using the get_vrbo_listing_videos_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingVideos200Response>, Integer, Hash)> get_vrbo_listing_videos_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo videos
  data, status_code, headers = api_instance.get_vrbo_listing_videos_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingVideos200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_videos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingVideos200Response**](GetVrboListingVideos200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_welcome_guide

> <GetVrboListingWelcomeGuide200Response> get_vrbo_listing_welcome_guide(id, opts)

Get the Vrbo welcome guide

What guests receive before arrival: check-in and check-out instructions, driving and parking directions, access (type, code), wifi, per-amenity instructions, contacts.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo welcome guide
  result = api_instance.get_vrbo_listing_welcome_guide(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_welcome_guide: #{e}"
end
```

#### Using the get_vrbo_listing_welcome_guide_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingWelcomeGuide200Response>, Integer, Hash)> get_vrbo_listing_welcome_guide_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo welcome guide
  data, status_code, headers = api_instance.get_vrbo_listing_welcome_guide_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingWelcomeGuide200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_welcome_guide_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingWelcomeGuide200Response**](GetVrboListingWelcomeGuide200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_vrbo_listings

> <Array<VrboListing>> list_vrbo_listings(opts)

List VRBO listings

List the Vrbo units linked to this workspace's listings, from the host's connected Vrbo account (host sign-in, beta).  Inactive listings are left out unless `?status=inactive|all` asks for them; they then come back with identity fields only (ids, `listingName`, `listingCity`, `status`, `inactiveReason`). They keep syncing and are complete again once activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
opts = {
  status: 'active' # String | `active` (default) leaves inactive listings out. `inactive` returns only them and `all` returns both. An inactive listing comes back with identity fields only (ids, `name`, `city`, `status`, `inactiveReason`, its account), which is enough to show what can be activated. Every row carries `status`.
}

begin
  # List VRBO listings
  result = api_instance.list_vrbo_listings(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->list_vrbo_listings: #{e}"
end
```

#### Using the list_vrbo_listings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<VrboListing>>, Integer, Hash)> list_vrbo_listings_with_http_info(opts)

```ruby
begin
  # List VRBO listings
  data, status_code, headers = api_instance.list_vrbo_listings_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<VrboListing>>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->list_vrbo_listings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | &#x60;active&#x60; (default) leaves inactive listings out. &#x60;inactive&#x60; returns only them and &#x60;all&#x60; returns both. An inactive listing comes back with identity fields only (ids, &#x60;name&#x60;, &#x60;city&#x60;, &#x60;status&#x60;, &#x60;inactiveReason&#x60;, its account), which is enough to show what can be activated. Every row carries &#x60;status&#x60;. | [optional][default to &#39;active&#39;] |

### Return type

[**Array&lt;VrboListing&gt;**](VrboListing.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_vrbo_reservations

> <VrboReservationListResponse> list_vrbo_reservations(opts)

List VRBO reservations

Cursor-paginated list of Vrbo reservations imported from the host's connected Vrbo account (host sign-in, beta). The full normalised record — guest, price breakdown, policy — is on `GET /v1/reservations?platform=vrbo`. `?offset=` is accepted as a first-class alias for `?cursor=` (mutually exclusive; offset capped at 10000).  Reservations on inactive listings are left out (counts and cursors included); they keep syncing and reappear once the listing is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
opts = {
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.nextCursor`.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.nextCursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  limit: 56, # Integer | 
  include_total: true # Boolean | When `true` (default), the response's `pagination.total` carries the count of rows matching the current filter, across all pages. Pass `false` to skip the count for very large workspaces where the per-page COUNT(*) cost matters.
}

begin
  # List VRBO reservations
  result = api_instance.list_vrbo_reservations(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->list_vrbo_reservations: #{e}"
end
```

#### Using the list_vrbo_reservations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<VrboReservationListResponse>, Integer, Hash)> list_vrbo_reservations_with_http_info(opts)

```ruby
begin
  # List VRBO reservations
  data, status_code, headers = api_instance.list_vrbo_reservations_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <VrboReservationListResponse>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->list_vrbo_reservations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **limit** | **Integer** |  | [optional][default to 50] |
| **include_total** | **Boolean** | When &#x60;true&#x60; (default), the response&#39;s &#x60;pagination.total&#x60; carries the count of rows matching the current filter, across all pages. Pass &#x60;false&#x60; to skip the count for very large workspaces where the per-page COUNT(*) cost matters. | [optional][default to true] |

### Return type

[**VrboReservationListResponse**](VrboReservationListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_vrbo_listing_additional_info

> <UpdateVrboListingAdditionalInfo200Response> update_vrbo_listing_additional_info(id, update_vrbo_listing_additional_info_request, opts)

Update the Vrbo additional details

Change the additional details of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `property`, `bedrooms`, `bathrooms`.  **Cost:** 1 call + 2 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_additional_info_request = Repull::UpdateVrboListingAdditionalInfoRequest.new # UpdateVrboListingAdditionalInfoRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo additional details
  result = api_instance.update_vrbo_listing_additional_info(id, update_vrbo_listing_additional_info_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_additional_info: #{e}"
end
```

#### Using the update_vrbo_listing_additional_info_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingAdditionalInfo200Response>, Integer, Hash)> update_vrbo_listing_additional_info_with_http_info(id, update_vrbo_listing_additional_info_request, opts)

```ruby
begin
  # Update the Vrbo additional details
  data, status_code, headers = api_instance.update_vrbo_listing_additional_info_with_http_info(id, update_vrbo_listing_additional_info_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingAdditionalInfo200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_additional_info_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_additional_info_request** | [**UpdateVrboListingAdditionalInfoRequest**](UpdateVrboListingAdditionalInfoRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingAdditionalInfo200Response**](UpdateVrboListingAdditionalInfo200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_amenities

> <UpdateVrboListingAmenities200Response> update_vrbo_listing_amenities(id, update_vrbo_listing_amenities_request, opts)

Update the Vrbo amenities

Change the amenities of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `groups: {<group>: {values: {<field id>: value}}}`. Checkbox `true`/`false`; choice one of the field's `options`; text and numbers as such. Setting a parent to \"no\" clears its children, as Vrbo's own form does.  **Cost:** 1 call per group written + the read back of those groups on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_amenities_request = Repull::UpdateVrboListingAmenitiesRequest.new({groups: Repull::UpdateVrboListingAmenitiesRequestGroups.new}) # UpdateVrboListingAmenitiesRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo amenities
  result = api_instance.update_vrbo_listing_amenities(id, update_vrbo_listing_amenities_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_amenities: #{e}"
end
```

#### Using the update_vrbo_listing_amenities_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingAmenities200Response>, Integer, Hash)> update_vrbo_listing_amenities_with_http_info(id, update_vrbo_listing_amenities_request, opts)

```ruby
begin
  # Update the Vrbo amenities
  data, status_code, headers = api_instance.update_vrbo_listing_amenities_with_http_info(id, update_vrbo_listing_amenities_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingAmenities200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_amenities_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_amenities_request** | [**UpdateVrboListingAmenitiesRequest**](UpdateVrboListingAmenitiesRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingAmenities200Response**](UpdateVrboListingAmenities200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_booking_settings

> <UpdateVrboListingBookingSettings200Response> update_vrbo_listing_booking_settings(id, update_vrbo_listing_booking_settings_request, opts)

Update the Vrbo booking settings

Change the booking settings of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `bookingType` (`INSTANT`|`QUOTEHOLD`), `minNights`, `minDaysBeforeBooking`, `maxMonthsBeforeBooking` (6, 9, 12, 18 or 24), `maxLengthOfStay`, `accessType`. Values must be ones the read lists. None of these can be cleared once set — **including `accessType`**: Vrbo keeps the last access type, so it can be changed to another but not removed.  **Cost:** 1–3 calls + 2 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_booking_settings_request = Repull::UpdateVrboListingBookingSettingsRequest.new # UpdateVrboListingBookingSettingsRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo booking settings
  result = api_instance.update_vrbo_listing_booking_settings(id, update_vrbo_listing_booking_settings_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_booking_settings: #{e}"
end
```

#### Using the update_vrbo_listing_booking_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingBookingSettings200Response>, Integer, Hash)> update_vrbo_listing_booking_settings_with_http_info(id, update_vrbo_listing_booking_settings_request, opts)

```ruby
begin
  # Update the Vrbo booking settings
  data, status_code, headers = api_instance.update_vrbo_listing_booking_settings_with_http_info(id, update_vrbo_listing_booking_settings_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingBookingSettings200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_booking_settings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_booking_settings_request** | [**UpdateVrboListingBookingSettingsRequest**](UpdateVrboListingBookingSettingsRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingBookingSettings200Response**](UpdateVrboListingBookingSettings200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_cancellation

> <UpdateVrboListingCancellation200Response> update_vrbo_listing_cancellation(id, update_vrbo_listing_cancellation_request, opts)

Update the Vrbo cancellation policy

Change the cancellation policy of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `policyType` (e.g. `POLICY_TYPE_VR_RELAXED`, `_MODERATE`, `_FIRM`, `_STRICT`, or `POLICY_TYPE_CUSTOM` with `tiers: [{daysBefore, refundPercent}]`). Seasonal overrides are kept.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_cancellation_request = Repull::UpdateVrboListingCancellationRequest.new({policy_type: 'POLICY_TYPE_VR_MODERATE'}) # UpdateVrboListingCancellationRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo cancellation policy
  result = api_instance.update_vrbo_listing_cancellation(id, update_vrbo_listing_cancellation_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_cancellation: #{e}"
end
```

#### Using the update_vrbo_listing_cancellation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingCancellation200Response>, Integer, Hash)> update_vrbo_listing_cancellation_with_http_info(id, update_vrbo_listing_cancellation_request, opts)

```ruby
begin
  # Update the Vrbo cancellation policy
  data, status_code, headers = api_instance.update_vrbo_listing_cancellation_with_http_info(id, update_vrbo_listing_cancellation_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingCancellation200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_cancellation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_cancellation_request** | [**UpdateVrboListingCancellationRequest**](UpdateVrboListingCancellationRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingCancellation200Response**](UpdateVrboListingCancellation200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_description

> <UpdateVrboListingDescription200Response> update_vrbo_listing_description(id, update_vrbo_listing_description_request, opts)

Update the Vrbo headline and description

Change the headline and description of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `headline` and/or `description`. Vrbo refuses some characters and words (`( ) * $ €`, other platforms' names, \"covid\") and says which.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_description_request = Repull::UpdateVrboListingDescriptionRequest.new # UpdateVrboListingDescriptionRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo headline and description
  result = api_instance.update_vrbo_listing_description(id, update_vrbo_listing_description_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_description: #{e}"
end
```

#### Using the update_vrbo_listing_description_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingDescription200Response>, Integer, Hash)> update_vrbo_listing_description_with_http_info(id, update_vrbo_listing_description_request, opts)

```ruby
begin
  # Update the Vrbo headline and description
  data, status_code, headers = api_instance.update_vrbo_listing_description_with_http_info(id, update_vrbo_listing_description_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingDescription200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_description_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_description_request** | [**UpdateVrboListingDescriptionRequest**](UpdateVrboListingDescriptionRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingDescription200Response**](UpdateVrboListingDescription200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_fees

> <UpdateVrboListingFees200Response> update_vrbo_listing_fees(id, update_vrbo_listing_fees_request, opts)

Update the Vrbo fees

Change the fees of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `cleaning`, `pets`, `extraGuests`, `custom`. `null` clears a fee; `custom` replaces the custom-fee list (`[]` removes them all), each `{productCode, amount, type?, taxable?, taxRate?}` with `productCode` one of the read's `customFeeCodes`.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_fees_request = Repull::UpdateVrboListingFeesRequest.new # UpdateVrboListingFeesRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo fees
  result = api_instance.update_vrbo_listing_fees(id, update_vrbo_listing_fees_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_fees: #{e}"
end
```

#### Using the update_vrbo_listing_fees_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingFees200Response>, Integer, Hash)> update_vrbo_listing_fees_with_http_info(id, update_vrbo_listing_fees_request, opts)

```ruby
begin
  # Update the Vrbo fees
  data, status_code, headers = api_instance.update_vrbo_listing_fees_with_http_info(id, update_vrbo_listing_fees_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingFees200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_fees_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_fees_request** | [**UpdateVrboListingFeesRequest**](UpdateVrboListingFeesRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingFees200Response**](UpdateVrboListingFees200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_house_rules

> <UpdateVrboListingHouseRules200Response> update_vrbo_listing_house_rules(id, update_vrbo_listing_house_rules_request, opts)

Update the Vrbo house rules

Change the house rules of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `checkInTime`/`checkOutTime` (`Flexible` or `HH:MM` on the half hour), `maxGuests`, `maxAdults`, `occupancyNote`, `minimumAge`, `minimumAgeNote`, `children`, `pets`, `smoking`, `events`, `customRules` (at most 3). `maxAdults` may not exceed `maxGuests`: when lowering `maxGuests`, send `maxAdults` with it. `maxGuests` cannot be cleared; `minimumAge: null` removes the minimum age.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_house_rules_request = Repull::UpdateVrboListingHouseRulesRequest.new # UpdateVrboListingHouseRulesRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo house rules
  result = api_instance.update_vrbo_listing_house_rules(id, update_vrbo_listing_house_rules_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_house_rules: #{e}"
end
```

#### Using the update_vrbo_listing_house_rules_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingHouseRules200Response>, Integer, Hash)> update_vrbo_listing_house_rules_with_http_info(id, update_vrbo_listing_house_rules_request, opts)

```ruby
begin
  # Update the Vrbo house rules
  data, status_code, headers = api_instance.update_vrbo_listing_house_rules_with_http_info(id, update_vrbo_listing_house_rules_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingHouseRules200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_house_rules_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_house_rules_request** | [**UpdateVrboListingHouseRulesRequest**](UpdateVrboListingHouseRulesRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingHouseRules200Response**](UpdateVrboListingHouseRules200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_location

> <UpdateVrboListingLocation200Response> update_vrbo_listing_location(id, update_vrbo_listing_location_request, opts)

Update the Vrbo map setting

Change the map setting of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `showExactLocation: true|false`.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_location_request = Repull::UpdateVrboListingLocationRequest.new({show_exact_location: false}) # UpdateVrboListingLocationRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo map setting
  result = api_instance.update_vrbo_listing_location(id, update_vrbo_listing_location_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_location: #{e}"
end
```

#### Using the update_vrbo_listing_location_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingLocation200Response>, Integer, Hash)> update_vrbo_listing_location_with_http_info(id, update_vrbo_listing_location_request, opts)

```ruby
begin
  # Update the Vrbo map setting
  data, status_code, headers = api_instance.update_vrbo_listing_location_with_http_info(id, update_vrbo_listing_location_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingLocation200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_location_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_location_request** | [**UpdateVrboListingLocationRequest**](UpdateVrboListingLocationRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingLocation200Response**](UpdateVrboListingLocation200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_payment_terms

> <UpdateVrboListingPaymentTerms200Response> update_vrbo_listing_payment_terms(id, update_vrbo_listing_payment_terms_request, opts)

Update the Vrbo payment terms

Change the payment terms of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `percentDueNow` and `payments: [{percent, daysBeforeArrival}]`, adding up to 100.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_payment_terms_request = Repull::UpdateVrboListingPaymentTermsRequest.new({percent_due_now: 3.56}) # UpdateVrboListingPaymentTermsRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo payment terms
  result = api_instance.update_vrbo_listing_payment_terms(id, update_vrbo_listing_payment_terms_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_payment_terms: #{e}"
end
```

#### Using the update_vrbo_listing_payment_terms_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingPaymentTerms200Response>, Integer, Hash)> update_vrbo_listing_payment_terms_with_http_info(id, update_vrbo_listing_payment_terms_request, opts)

```ruby
begin
  # Update the Vrbo payment terms
  data, status_code, headers = api_instance.update_vrbo_listing_payment_terms_with_http_info(id, update_vrbo_listing_payment_terms_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingPaymentTerms200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_payment_terms_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_payment_terms_request** | [**UpdateVrboListingPaymentTermsRequest**](UpdateVrboListingPaymentTermsRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingPaymentTerms200Response**](UpdateVrboListingPaymentTerms200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_photos

> <UpdateVrboListingPhotos200Response> update_vrbo_listing_photos(id, update_vrbo_listing_photos_request, opts)

Update the Vrbo photos

Change the photos of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `add: [{url, caption?}]` (https URLs Vrbo downloads), `delete: [id]`, `captions: {id: caption}`, `order: [id…]`, `cover: id`. Applied in that order. `order` may list only the first photos; the rest keep their order, and every photo is sent with its new position (as Vrbo's own page does). **Captions are one-way:** Vrbo has not been shown to clear a caption once set, so an empty caption is refused. Each `add` uploads a photo again — it is the one write that is not idempotent.  **Cost:** about 2 calls per photo added, 1 per delete/caption/reorder, plus reads on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_photos_request = Repull::UpdateVrboListingPhotosRequest.new # UpdateVrboListingPhotosRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo photos
  result = api_instance.update_vrbo_listing_photos(id, update_vrbo_listing_photos_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_photos: #{e}"
end
```

#### Using the update_vrbo_listing_photos_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingPhotos200Response>, Integer, Hash)> update_vrbo_listing_photos_with_http_info(id, update_vrbo_listing_photos_request, opts)

```ruby
begin
  # Update the Vrbo photos
  data, status_code, headers = api_instance.update_vrbo_listing_photos_with_http_info(id, update_vrbo_listing_photos_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingPhotos200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_photos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_photos_request** | [**UpdateVrboListingPhotosRequest**](UpdateVrboListingPhotosRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingPhotos200Response**](UpdateVrboListingPhotos200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_pricing

> <UpdateVrboListingPricing200Response> update_vrbo_listing_pricing(id, update_vrbo_listing_pricing_request, opts)

Update the Vrbo base pricing

Change the base pricing of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `baseRate`. The answer comes once Vrbo shows the new rate. Nightly prices per date come from the listing calendar (`PUT /v1/availability/{propertyId}`), which Vrbo shows over the base rate. Uses Vrbo's calendar quota: while the listing's calendar push is writing, the answer is `409 vrbo_calendar_busy` with `retry_after` and nothing is changed.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_pricing_request = Repull::UpdateVrboListingPricingRequest.new({base_rate: 3.56}) # UpdateVrboListingPricingRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo base pricing
  result = api_instance.update_vrbo_listing_pricing(id, update_vrbo_listing_pricing_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_pricing: #{e}"
end
```

#### Using the update_vrbo_listing_pricing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingPricing200Response>, Integer, Hash)> update_vrbo_listing_pricing_with_http_info(id, update_vrbo_listing_pricing_request, opts)

```ruby
begin
  # Update the Vrbo base pricing
  data, status_code, headers = api_instance.update_vrbo_listing_pricing_with_http_info(id, update_vrbo_listing_pricing_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingPricing200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_pricing_request** | [**UpdateVrboListingPricingRequest**](UpdateVrboListingPricingRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingPricing200Response**](UpdateVrboListingPricing200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_property

> <UpdateVrboListingProperty200Response> update_vrbo_listing_property(id, update_vrbo_listing_property_request, opts)

Update the Vrbo property details

Change the property details of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `propertyType` (one of `propertyTypeOptions`), `propertyName`, `interiorSize` `{value, unit: sqft|sqm}`, `seniorsOnly`, `longTermRentersWelcome`. `propertyType` and `propertyName` can be changed but not cleared.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_property_request = Repull::UpdateVrboListingPropertyRequest.new # UpdateVrboListingPropertyRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo property details
  result = api_instance.update_vrbo_listing_property(id, update_vrbo_listing_property_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_property: #{e}"
end
```

#### Using the update_vrbo_listing_property_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingProperty200Response>, Integer, Hash)> update_vrbo_listing_property_with_http_info(id, update_vrbo_listing_property_request, opts)

```ruby
begin
  # Update the Vrbo property details
  data, status_code, headers = api_instance.update_vrbo_listing_property_with_http_info(id, update_vrbo_listing_property_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingProperty200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_property_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_property_request** | [**UpdateVrboListingPropertyRequest**](UpdateVrboListingPropertyRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingProperty200Response**](UpdateVrboListingProperty200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_protection

> <UpdateVrboListingProtection200Response> update_vrbo_listing_protection(id, update_vrbo_listing_protection_request, opts)

Update the Vrbo damage protection

Change the damage protection of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `damageDeposit` (`{amount}` or `null`), `damageProtection`.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_protection_request = Repull::UpdateVrboListingProtectionRequest.new # UpdateVrboListingProtectionRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo damage protection
  result = api_instance.update_vrbo_listing_protection(id, update_vrbo_listing_protection_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_protection: #{e}"
end
```

#### Using the update_vrbo_listing_protection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingProtection200Response>, Integer, Hash)> update_vrbo_listing_protection_with_http_info(id, update_vrbo_listing_protection_request, opts)

```ruby
begin
  # Update the Vrbo damage protection
  data, status_code, headers = api_instance.update_vrbo_listing_protection_with_http_info(id, update_vrbo_listing_protection_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingProtection200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_protection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_protection_request** | [**UpdateVrboListingProtectionRequest**](UpdateVrboListingProtectionRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingProtection200Response**](UpdateVrboListingProtection200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_rates

> <UpdateVrboListingRates200Response> update_vrbo_listing_rates(id, update_vrbo_listing_rates_request, opts)

Update the Vrbo rates and stay discounts

Change the rates and stay discounts of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `startDate`, `endDate` (at most 3 years) and any of `nightlyRate` (one price), `nightlyRates` (`{sunday…saturday}`), `weeklyDiscountPercent`, `monthlyDiscountPercent` (0–99). A discount-only write keeps the current prices when each weekday has one price in the range; otherwise send `nightlyRates`. Nightly prices belong to the listing calendar (`PUT /v1/availability/{propertyId}`), whose push to Vrbo may put back a price set here; use this for the discounts and for prices on nights the calendar does not manage. While the listing's calendar push is writing, the answer is `409 vrbo_calendar_busy` with `retry_after` and nothing is changed.  **Cost:** 1–2 calendar calls + 1 to read back (Vrbo's calendar quota, the one price pushes use) on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_rates_request = Repull::UpdateVrboListingRatesRequest.new({start_date: Date.today, end_date: Date.today}) # UpdateVrboListingRatesRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo rates and stay discounts
  result = api_instance.update_vrbo_listing_rates(id, update_vrbo_listing_rates_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_rates: #{e}"
end
```

#### Using the update_vrbo_listing_rates_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingRates200Response>, Integer, Hash)> update_vrbo_listing_rates_with_http_info(id, update_vrbo_listing_rates_request, opts)

```ruby
begin
  # Update the Vrbo rates and stay discounts
  data, status_code, headers = api_instance.update_vrbo_listing_rates_with_http_info(id, update_vrbo_listing_rates_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingRates200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_rates_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_rates_request** | [**UpdateVrboListingRatesRequest**](UpdateVrboListingRatesRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingRates200Response**](UpdateVrboListingRates200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_registration

> <UpdateVrboListingRegistration200Response> update_vrbo_listing_registration(id, update_vrbo_listing_registration_request, opts)

Update the Vrbo registration / licence

Change the registration / licence of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `settings: [{name, value}]` with the `name`s the read lists (they differ per city). Vrbo checks them against the registry.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_registration_request = Repull::UpdateVrboListingRegistrationRequest.new({settings: [Repull::UpdateVrboListingRegistrationRequestSettingsInner.new({name: 'name_example', value: nil})]}) # UpdateVrboListingRegistrationRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo registration / licence
  result = api_instance.update_vrbo_listing_registration(id, update_vrbo_listing_registration_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_registration: #{e}"
end
```

#### Using the update_vrbo_listing_registration_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingRegistration200Response>, Integer, Hash)> update_vrbo_listing_registration_with_http_info(id, update_vrbo_listing_registration_request, opts)

```ruby
begin
  # Update the Vrbo registration / licence
  data, status_code, headers = api_instance.update_vrbo_listing_registration_with_http_info(id, update_vrbo_listing_registration_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingRegistration200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_registration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_registration_request** | [**UpdateVrboListingRegistrationRequest**](UpdateVrboListingRegistrationRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingRegistration200Response**](UpdateVrboListingRegistration200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_rooms

> <UpdateVrboListingRooms200Response> update_vrbo_listing_rooms(id, update_vrbo_listing_rooms_request, opts)

Update the Vrbo rooms and spaces

Change the rooms and spaces of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `add: [{type, name?, subType?, description?, beds?, amenities?}]`, `update: [{spaceId, …}]`, `delete: [spaceId]`. Beds `{type, size?, quantity 1–99}`: `type` one of the read's `bedTypes`, and `size` is required where that bed type lists `sizes` (bunk, sofa…). **A room description can be replaced but not cleared** (Vrbo never saves an empty one), so an empty `description` is refused.  **Cost:** 1 call per room changed + the read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_rooms_request = Repull::UpdateVrboListingRoomsRequest.new # UpdateVrboListingRoomsRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo rooms and spaces
  result = api_instance.update_vrbo_listing_rooms(id, update_vrbo_listing_rooms_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_rooms: #{e}"
end
```

#### Using the update_vrbo_listing_rooms_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingRooms200Response>, Integer, Hash)> update_vrbo_listing_rooms_with_http_info(id, update_vrbo_listing_rooms_request, opts)

```ruby
begin
  # Update the Vrbo rooms and spaces
  data, status_code, headers = api_instance.update_vrbo_listing_rooms_with_http_info(id, update_vrbo_listing_rooms_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingRooms200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_rooms_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_rooms_request** | [**UpdateVrboListingRoomsRequest**](UpdateVrboListingRoomsRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingRooms200Response**](UpdateVrboListingRooms200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_story

> <UpdateVrboListingStory200Response> update_vrbo_listing_story(id, update_vrbo_listing_story_request, opts)

Update the Vrbo host story

Change the host story of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `aboutYou`, `whyThisProperty`, `uniqueBenefits`.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_story_request = Repull::UpdateVrboListingStoryRequest.new # UpdateVrboListingStoryRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo host story
  result = api_instance.update_vrbo_listing_story(id, update_vrbo_listing_story_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_story: #{e}"
end
```

#### Using the update_vrbo_listing_story_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingStory200Response>, Integer, Hash)> update_vrbo_listing_story_with_http_info(id, update_vrbo_listing_story_request, opts)

```ruby
begin
  # Update the Vrbo host story
  data, status_code, headers = api_instance.update_vrbo_listing_story_with_http_info(id, update_vrbo_listing_story_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingStory200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_story_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_story_request** | [**UpdateVrboListingStoryRequest**](UpdateVrboListingStoryRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingStory200Response**](UpdateVrboListingStory200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_taxes

> <UpdateVrboListingTaxes200Response> update_vrbo_listing_taxes(id, update_vrbo_listing_taxes_request, opts)

Update the Vrbo taxes

Change the taxes of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `tax`, `stayTax` or `partnerTaxSettings`, in Vrbo's shape (see the read's `raw`).  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_taxes_request = Repull::UpdateVrboListingTaxesRequest.new # UpdateVrboListingTaxesRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo taxes
  result = api_instance.update_vrbo_listing_taxes(id, update_vrbo_listing_taxes_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_taxes: #{e}"
end
```

#### Using the update_vrbo_listing_taxes_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingTaxes200Response>, Integer, Hash)> update_vrbo_listing_taxes_with_http_info(id, update_vrbo_listing_taxes_request, opts)

```ruby
begin
  # Update the Vrbo taxes
  data, status_code, headers = api_instance.update_vrbo_listing_taxes_with_http_info(id, update_vrbo_listing_taxes_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingTaxes200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_taxes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_taxes_request** | [**UpdateVrboListingTaxesRequest**](UpdateVrboListingTaxesRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingTaxes200Response**](UpdateVrboListingTaxes200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_translations

> <UpdateVrboListingTranslations200Response> update_vrbo_listing_translations(id, update_vrbo_listing_translations_request, opts)

Update the Vrbo manual translations

Change the manual translations of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `set: [{locale, headline, description}]` and/or `delete: [locale]`.  **Cost:** 1 call per language + the read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_translations_request = Repull::UpdateVrboListingTranslationsRequest.new # UpdateVrboListingTranslationsRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo manual translations
  result = api_instance.update_vrbo_listing_translations(id, update_vrbo_listing_translations_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_translations: #{e}"
end
```

#### Using the update_vrbo_listing_translations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingTranslations200Response>, Integer, Hash)> update_vrbo_listing_translations_with_http_info(id, update_vrbo_listing_translations_request, opts)

```ruby
begin
  # Update the Vrbo manual translations
  data, status_code, headers = api_instance.update_vrbo_listing_translations_with_http_info(id, update_vrbo_listing_translations_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingTranslations200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_translations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_translations_request** | [**UpdateVrboListingTranslationsRequest**](UpdateVrboListingTranslationsRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingTranslations200Response**](UpdateVrboListingTranslations200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_welcome_guide

> <UpdateVrboListingWelcomeGuide200Response> update_vrbo_listing_welcome_guide(id, update_vrbo_listing_welcome_guide_request, opts)

Update the Vrbo welcome guide

Change the welcome guide of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `checkIn`, `checkOut`, `drivingDirections`, `parkingDirections` (`{instructions}`), `wifi`, `access`, `amenities` (`{AMENITY_ID: {instructions}}`). **The notes are one-way:** Vrbo has not been shown to remove a note once added, so `null` and empty text are refused — change a note to other text instead.  **Cost:** 1–2 calls per item + the read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
id = 'id_example' # String | Repull listing id (numeric string) of a listing linked to Vrbo.
update_vrbo_listing_welcome_guide_request = Repull::UpdateVrboListingWelcomeGuideRequest.new # UpdateVrboListingWelcomeGuideRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo welcome guide
  result = api_instance.update_vrbo_listing_welcome_guide(id, update_vrbo_listing_welcome_guide_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_welcome_guide: #{e}"
end
```

#### Using the update_vrbo_listing_welcome_guide_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingWelcomeGuide200Response>, Integer, Hash)> update_vrbo_listing_welcome_guide_with_http_info(id, update_vrbo_listing_welcome_guide_request, opts)

```ruby
begin
  # Update the Vrbo welcome guide
  data, status_code, headers = api_instance.update_vrbo_listing_welcome_guide_with_http_info(id, update_vrbo_listing_welcome_guide_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingWelcomeGuide200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_welcome_guide_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_welcome_guide_request** | [**UpdateVrboListingWelcomeGuideRequest**](UpdateVrboListingWelcomeGuideRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingWelcomeGuide200Response**](UpdateVrboListingWelcomeGuide200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

