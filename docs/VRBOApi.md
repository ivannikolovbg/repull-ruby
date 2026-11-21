# Repull::VRBOApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**add_vrbo_listing_photos**](VRBOApi.md#add_vrbo_listing_photos) | **POST** /v1/channels/vrbo/listings/{id}/photos | Add photos to the Vrbo listing |
| [**add_vrbo_listing_room**](VRBOApi.md#add_vrbo_listing_room) | **POST** /v1/channels/vrbo/listings/{id}/rooms | Add a room to the Vrbo listing |
| [**add_vrbo_listing_video**](VRBOApi.md#add_vrbo_listing_video) | **POST** /v1/channels/vrbo/listings/{id}/videos | Add a video to the Vrbo listing |
| [**delete_vrbo_listing_description**](VRBOApi.md#delete_vrbo_listing_description) | **DELETE** /v1/channels/vrbo/listings/{id}/descriptions | Remove a Vrbo translation |
| [**delete_vrbo_listing_photos**](VRBOApi.md#delete_vrbo_listing_photos) | **DELETE** /v1/channels/vrbo/listings/{id}/photos | Remove Vrbo photos |
| [**delete_vrbo_listing_room**](VRBOApi.md#delete_vrbo_listing_room) | **DELETE** /v1/channels/vrbo/listings/{id}/rooms | Remove a Vrbo room |
| [**delete_vrbo_listing_videos**](VRBOApi.md#delete_vrbo_listing_videos) | **DELETE** /v1/channels/vrbo/listings/{id}/videos | Remove videos from the Vrbo listing |
| [**get_vrbo_connection**](VRBOApi.md#get_vrbo_connection) | **GET** /v1/channels/vrbo/connection | Get the Vrbo connection state |
| [**get_vrbo_listing**](VRBOApi.md#get_vrbo_listing) | **GET** /v1/channels/vrbo/listings/{id} | Get the Vrbo listing |
| [**get_vrbo_listing_additional_info**](VRBOApi.md#get_vrbo_listing_additional_info) | **GET** /v1/channels/vrbo/listings/{id}/additional-info | Get the Vrbo additional details |
| [**get_vrbo_listing_amenities**](VRBOApi.md#get_vrbo_listing_amenities) | **GET** /v1/channels/vrbo/listings/{id}/amenities | Get the Vrbo amenities |
| [**get_vrbo_listing_availability**](VRBOApi.md#get_vrbo_listing_availability) | **GET** /v1/channels/vrbo/listings/{id}/availability | Get the Vrbo calendar |
| [**get_vrbo_listing_booking_settings**](VRBOApi.md#get_vrbo_listing_booking_settings) | **GET** /v1/channels/vrbo/listings/{id}/booking-settings | Get the Vrbo booking settings |
| [**get_vrbo_listing_cancellation**](VRBOApi.md#get_vrbo_listing_cancellation) | **GET** /v1/channels/vrbo/listings/{id}/cancellation | Get the Vrbo cancellation policy |
| [**get_vrbo_listing_checkin_guide**](VRBOApi.md#get_vrbo_listing_checkin_guide) | **GET** /v1/channels/vrbo/listings/{id}/checkin-guide | Get the Vrbo welcome guide |
| [**get_vrbo_listing_checkout_guide**](VRBOApi.md#get_vrbo_listing_checkout_guide) | **GET** /v1/channels/vrbo/listings/{id}/checkout-guide | Get the Vrbo checkout guide |
| [**get_vrbo_listing_content**](VRBOApi.md#get_vrbo_listing_content) | **GET** /v1/channels/vrbo/listings/{id}/content | Get several Vrbo listing sections |
| [**get_vrbo_listing_descriptions**](VRBOApi.md#get_vrbo_listing_descriptions) | **GET** /v1/channels/vrbo/listings/{id}/descriptions | Get the Vrbo headline and description |
| [**get_vrbo_listing_details**](VRBOApi.md#get_vrbo_listing_details) | **GET** /v1/channels/vrbo/listings/{id}/details | Get the Vrbo property details |
| [**get_vrbo_listing_fees**](VRBOApi.md#get_vrbo_listing_fees) | **GET** /v1/channels/vrbo/listings/{id}/fees | Get the Vrbo fees |
| [**get_vrbo_listing_house_rules**](VRBOApi.md#get_vrbo_listing_house_rules) | **GET** /v1/channels/vrbo/listings/{id}/house-rules | Get the Vrbo house rules |
| [**get_vrbo_listing_location**](VRBOApi.md#get_vrbo_listing_location) | **GET** /v1/channels/vrbo/listings/{id}/location | Get the Vrbo map setting |
| [**get_vrbo_listing_payment_terms**](VRBOApi.md#get_vrbo_listing_payment_terms) | **GET** /v1/channels/vrbo/listings/{id}/payment-terms | Get the Vrbo payment terms |
| [**get_vrbo_listing_permits**](VRBOApi.md#get_vrbo_listing_permits) | **GET** /v1/channels/vrbo/listings/{id}/permits | Get the Vrbo registration / licence |
| [**get_vrbo_listing_photos**](VRBOApi.md#get_vrbo_listing_photos) | **GET** /v1/channels/vrbo/listings/{id}/photos | Get the Vrbo photos |
| [**get_vrbo_listing_pricing**](VRBOApi.md#get_vrbo_listing_pricing) | **GET** /v1/channels/vrbo/listings/{id}/pricing | Get the Vrbo base pricing |
| [**get_vrbo_listing_protection**](VRBOApi.md#get_vrbo_listing_protection) | **GET** /v1/channels/vrbo/listings/{id}/protection | Get the Vrbo damage protection |
| [**get_vrbo_listing_rates**](VRBOApi.md#get_vrbo_listing_rates) | **GET** /v1/channels/vrbo/listings/{id}/rates | Get the Vrbo rates and stay discounts |
| [**get_vrbo_listing_rooms**](VRBOApi.md#get_vrbo_listing_rooms) | **GET** /v1/channels/vrbo/listings/{id}/rooms | Get the Vrbo rooms |
| [**get_vrbo_listing_safety_disclosures**](VRBOApi.md#get_vrbo_listing_safety_disclosures) | **GET** /v1/channels/vrbo/listings/{id}/safety-disclosures | Get the Vrbo safety disclosures |
| [**get_vrbo_listing_story**](VRBOApi.md#get_vrbo_listing_story) | **GET** /v1/channels/vrbo/listings/{id}/story | Get the Vrbo host story |
| [**get_vrbo_listing_taxes**](VRBOApi.md#get_vrbo_listing_taxes) | **GET** /v1/channels/vrbo/listings/{id}/taxes | Get the Vrbo taxes |
| [**get_vrbo_listing_videos**](VRBOApi.md#get_vrbo_listing_videos) | **GET** /v1/channels/vrbo/listings/{id}/videos | Get the Vrbo videos |
| [**list_vrbo_listings**](VRBOApi.md#list_vrbo_listings) | **GET** /v1/channels/vrbo/listings | List VRBO listings |
| [**list_vrbo_reservations**](VRBOApi.md#list_vrbo_reservations) | **GET** /v1/channels/vrbo/reservations | List VRBO reservations |
| [**map_vrbo_listing**](VRBOApi.md#map_vrbo_listing) | **POST** /v1/channels/vrbo/listings/map | Link a Vrbo listing to a Repull listing |
| [**reorder_vrbo_listing_photos**](VRBOApi.md#reorder_vrbo_listing_photos) | **PUT** /v1/channels/vrbo/listings/{id}/photos/order | Reorder the Vrbo photos |
| [**set_vrbo_listing_cover_photo**](VRBOApi.md#set_vrbo_listing_cover_photo) | **PUT** /v1/channels/vrbo/listings/{id}/photos/cover | Set the Vrbo cover photo |
| [**update_vrbo_listing_additional_info**](VRBOApi.md#update_vrbo_listing_additional_info) | **PUT** /v1/channels/vrbo/listings/{id}/additional-info | Update the Vrbo additional details |
| [**update_vrbo_listing_amenities**](VRBOApi.md#update_vrbo_listing_amenities) | **PUT** /v1/channels/vrbo/listings/{id}/amenities | Update the Vrbo amenities |
| [**update_vrbo_listing_availability**](VRBOApi.md#update_vrbo_listing_availability) | **PUT** /v1/channels/vrbo/listings/{id}/availability | Update the Vrbo calendar |
| [**update_vrbo_listing_booking_settings**](VRBOApi.md#update_vrbo_listing_booking_settings) | **PUT** /v1/channels/vrbo/listings/{id}/booking-settings | Update the Vrbo booking settings |
| [**update_vrbo_listing_cancellation**](VRBOApi.md#update_vrbo_listing_cancellation) | **PUT** /v1/channels/vrbo/listings/{id}/cancellation | Update the Vrbo cancellation policy |
| [**update_vrbo_listing_checkin_guide**](VRBOApi.md#update_vrbo_listing_checkin_guide) | **PUT** /v1/channels/vrbo/listings/{id}/checkin-guide | Update the Vrbo welcome guide |
| [**update_vrbo_listing_descriptions**](VRBOApi.md#update_vrbo_listing_descriptions) | **PUT** /v1/channels/vrbo/listings/{id}/descriptions | Update the Vrbo headline and description |
| [**update_vrbo_listing_details**](VRBOApi.md#update_vrbo_listing_details) | **PUT** /v1/channels/vrbo/listings/{id}/details | Update the Vrbo property details |
| [**update_vrbo_listing_fees**](VRBOApi.md#update_vrbo_listing_fees) | **PUT** /v1/channels/vrbo/listings/{id}/fees | Update the Vrbo fees |
| [**update_vrbo_listing_house_rules**](VRBOApi.md#update_vrbo_listing_house_rules) | **PUT** /v1/channels/vrbo/listings/{id}/house-rules | Update the Vrbo house rules |
| [**update_vrbo_listing_location**](VRBOApi.md#update_vrbo_listing_location) | **PUT** /v1/channels/vrbo/listings/{id}/location | Update the Vrbo map setting |
| [**update_vrbo_listing_payment_terms**](VRBOApi.md#update_vrbo_listing_payment_terms) | **PUT** /v1/channels/vrbo/listings/{id}/payment-terms | Update the Vrbo payment terms |
| [**update_vrbo_listing_permits**](VRBOApi.md#update_vrbo_listing_permits) | **PUT** /v1/channels/vrbo/listings/{id}/permits | Update the Vrbo registration / licence |
| [**update_vrbo_listing_photo**](VRBOApi.md#update_vrbo_listing_photo) | **PATCH** /v1/channels/vrbo/listings/{id}/photos | Update a Vrbo photo |
| [**update_vrbo_listing_pricing**](VRBOApi.md#update_vrbo_listing_pricing) | **PUT** /v1/channels/vrbo/listings/{id}/pricing | Update the Vrbo base pricing |
| [**update_vrbo_listing_protection**](VRBOApi.md#update_vrbo_listing_protection) | **PUT** /v1/channels/vrbo/listings/{id}/protection | Update the Vrbo damage protection |
| [**update_vrbo_listing_rates**](VRBOApi.md#update_vrbo_listing_rates) | **PUT** /v1/channels/vrbo/listings/{id}/rates | Update the Vrbo rates and stay discounts |
| [**update_vrbo_listing_room**](VRBOApi.md#update_vrbo_listing_room) | **PUT** /v1/channels/vrbo/listings/{id}/rooms | Update a Vrbo room |
| [**update_vrbo_listing_safety_disclosures**](VRBOApi.md#update_vrbo_listing_safety_disclosures) | **PUT** /v1/channels/vrbo/listings/{id}/safety-disclosures | Update the Vrbo safety disclosures |
| [**update_vrbo_listing_story**](VRBOApi.md#update_vrbo_listing_story) | **PUT** /v1/channels/vrbo/listings/{id}/story | Update the Vrbo host story |
| [**update_vrbo_listing_taxes**](VRBOApi.md#update_vrbo_listing_taxes) | **PUT** /v1/channels/vrbo/listings/{id}/taxes | Update the Vrbo taxes |
| [**vrbo_listing_action**](VRBOApi.md#vrbo_listing_action) | **POST** /v1/channels/vrbo/listings/{id} | Act on the Vrbo listing |


## add_vrbo_listing_photos

> <AddVrboListingPhotos200Response> add_vrbo_listing_photos(id, add_vrbo_listing_photos_request, opts)

Add photos to the Vrbo listing

Add 1–20 photos, each from an https `url` Vrbo downloads or as base64 `image` data (like Airbnb's upload), with an optional `caption`. New photos go to the end; move them with PATCH or PUT …/photos/order.  **Cost:** about 2 Vrbo calls per photo, then the photos are read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
add_vrbo_listing_photos_request = Repull::AddVrboListingPhotosRequest.new({photos: [Repull::AddVrboListingPhotosRequestPhotosInner.new]}) # AddVrboListingPhotosRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Add photos to the Vrbo listing
  result = api_instance.add_vrbo_listing_photos(id, add_vrbo_listing_photos_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->add_vrbo_listing_photos: #{e}"
end
```

#### Using the add_vrbo_listing_photos_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AddVrboListingPhotos200Response>, Integer, Hash)> add_vrbo_listing_photos_with_http_info(id, add_vrbo_listing_photos_request, opts)

```ruby
begin
  # Add photos to the Vrbo listing
  data, status_code, headers = api_instance.add_vrbo_listing_photos_with_http_info(id, add_vrbo_listing_photos_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AddVrboListingPhotos200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->add_vrbo_listing_photos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **add_vrbo_listing_photos_request** | [**AddVrboListingPhotosRequest**](AddVrboListingPhotosRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**AddVrboListingPhotos200Response**](AddVrboListingPhotos200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## add_vrbo_listing_room

> <UpdateVrboListingRoom200Response> add_vrbo_listing_room(id, add_vrbo_listing_room_request, opts)

Add a room to the Vrbo listing

Add one room with its beds. Room types: Airbnb's words (`bedroom`, `bathroom`, `living_room`, `office`) or Vrbo's (BEDROOM, BATHROOM, LIVING_ROOM, OFFICE) — Vrbo has no other room types; describe a kitchen or outdoor space with the amenities.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
add_vrbo_listing_room_request = Repull::AddVrboListingRoomRequest.new({room_type: 'bedroom'}) # AddVrboListingRoomRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Add a room to the Vrbo listing
  result = api_instance.add_vrbo_listing_room(id, add_vrbo_listing_room_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->add_vrbo_listing_room: #{e}"
end
```

#### Using the add_vrbo_listing_room_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingRoom200Response>, Integer, Hash)> add_vrbo_listing_room_with_http_info(id, add_vrbo_listing_room_request, opts)

```ruby
begin
  # Add a room to the Vrbo listing
  data, status_code, headers = api_instance.add_vrbo_listing_room_with_http_info(id, add_vrbo_listing_room_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingRoom200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->add_vrbo_listing_room_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **add_vrbo_listing_room_request** | [**AddVrboListingRoomRequest**](AddVrboListingRoomRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingRoom200Response**](UpdateVrboListingRoom200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


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


## delete_vrbo_listing_description

> <UpdateVrboListingDescriptions200Response> delete_vrbo_listing_description(id, locale, opts)

Remove a Vrbo translation

Remove the hand-written translation for `locale`; Vrbo goes back to translating that language automatically. The listing's own description cannot be removed, only changed. The answer is every language left.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
locale = 'fr-FR' # String | The language to remove.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Remove a Vrbo translation
  result = api_instance.delete_vrbo_listing_description(id, locale, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->delete_vrbo_listing_description: #{e}"
end
```

#### Using the delete_vrbo_listing_description_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingDescriptions200Response>, Integer, Hash)> delete_vrbo_listing_description_with_http_info(id, locale, opts)

```ruby
begin
  # Remove a Vrbo translation
  data, status_code, headers = api_instance.delete_vrbo_listing_description_with_http_info(id, locale, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingDescriptions200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->delete_vrbo_listing_description_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **locale** | **String** | The language to remove. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingDescriptions200Response**](UpdateVrboListingDescriptions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_vrbo_listing_photos

> <AddVrboListingPhotos200Response> delete_vrbo_listing_photos(id, photo_id, opts)

Remove Vrbo photos

Remove photos by `photoId` (comma-separated for several). Photo ids are the `id`s of GET …/photos.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
photo_id = '1234567' # String | The `id` of the photo to remove (comma-separated for several).
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Remove Vrbo photos
  result = api_instance.delete_vrbo_listing_photos(id, photo_id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->delete_vrbo_listing_photos: #{e}"
end
```

#### Using the delete_vrbo_listing_photos_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AddVrboListingPhotos200Response>, Integer, Hash)> delete_vrbo_listing_photos_with_http_info(id, photo_id, opts)

```ruby
begin
  # Remove Vrbo photos
  data, status_code, headers = api_instance.delete_vrbo_listing_photos_with_http_info(id, photo_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AddVrboListingPhotos200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->delete_vrbo_listing_photos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **photo_id** | **String** | The &#x60;id&#x60; of the photo to remove (comma-separated for several). |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**AddVrboListingPhotos200Response**](AddVrboListingPhotos200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_vrbo_listing_room

> <UpdateVrboListingRoom200Response> delete_vrbo_listing_room(id, room_id, opts)

Remove a Vrbo room

Remove the room `roomId`.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
room_id = 'd342a2ab-0cf2-4032-a962-bb1c0e35648c' # String | The room's `spaceId` from GET …/rooms.
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Remove a Vrbo room
  result = api_instance.delete_vrbo_listing_room(id, room_id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->delete_vrbo_listing_room: #{e}"
end
```

#### Using the delete_vrbo_listing_room_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingRoom200Response>, Integer, Hash)> delete_vrbo_listing_room_with_http_info(id, room_id, opts)

```ruby
begin
  # Remove a Vrbo room
  data, status_code, headers = api_instance.delete_vrbo_listing_room_with_http_info(id, room_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingRoom200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->delete_vrbo_listing_room_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **room_id** | **String** | The room&#39;s &#x60;spaceId&#x60; from GET …/rooms. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingRoom200Response**](UpdateVrboListingRoom200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
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


## get_vrbo_connection

> <GetVrboConnection200Response> get_vrbo_connection

Get the Vrbo connection state

Whether the workspace's Vrbo accounts are still signed in — the Vrbo counterpart of `GET /v1/channels/airbnb/connection`, with the same `status` values: `connected` (every account), `reconnect_required` (some), `disconnected` (none), `never_connected` (no Vrbo account). `fixUrl` is set whenever an account needs to be reconnected.  Per account: its `account_id`, name, sign-in state, access (`full_access` or `messaging`), the Vrbo units linked through it, when it last synced and its import progress.

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

begin
  # Get the Vrbo connection state
  result = api_instance.get_vrbo_connection
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_connection: #{e}"
end
```

#### Using the get_vrbo_connection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboConnection200Response>, Integer, Hash)> get_vrbo_connection_with_http_info

```ruby
begin
  # Get the Vrbo connection state
  data, status_code, headers = api_instance.get_vrbo_connection_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboConnection200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_connection_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetVrboConnection200Response**](GetVrboConnection200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing

> <GetVrboListing200Response> get_vrbo_listing(id, opts)

Get the Vrbo listing

Every Vrbo unit linked to the listing (usually one; live ones first), from Repull's own data — no Vrbo call: the Vrbo listing number and URL, Vrbo's status, headline, capacity, rooms, check-in/out, minimum stay, address, rating, the Vrbo account it is on and that account's access.  `?include=content` adds the listing-content sections Repull holds for each unit (descriptions, amenities, house rules, fees, …), so one call returns everything stored.  Returns `404` when the listing is not linked to Vrbo and `403 listing_inactive` when the listing is inactive.

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
id = 'id_example' # String | Repull listing id (numeric string).
opts = {
  include: 'content' # String | `content`: add the stored listing-content sections.
}

begin
  # Get the Vrbo listing
  result = api_instance.get_vrbo_listing(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing: #{e}"
end
```

#### Using the get_vrbo_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListing200Response>, Integer, Hash)> get_vrbo_listing_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo listing
  data, status_code, headers = api_instance.get_vrbo_listing_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListing200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **include** | **String** | &#x60;content&#x60;: add the stored listing-content sections. | [optional] |

### Return type

[**GetVrboListing200Response**](GetVrboListing200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_additional_info

> <GetVrboListingAdditionalInfo200Response> get_vrbo_listing_additional_info(id, opts)

Get the Vrbo additional details

The free-text additional details for the property, its bedrooms and its bathrooms.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

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

Vrbo's 19 amenity groups (~440 fields) — each field with its id, type (checkbox, choice, text, number, measurement, checkboxGroup), current value, options and the parent it is shown under (`shownWhen`). Includes location & view, nearby attractions and check-out instructions.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call per group (19 in all; narrow with `?groups=`) on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored', # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
  groups: 'essentials,internet' # String | Amenity groups to read, comma-separated (default: all 19): essentials, internet, climateControl, general, office, kitchenAndDining, parking, poolAndSpa, sustainability, entertainment, outdoor, onsiteService, accessibility, homeSafety, safetyDevices, enhancedCleaning, locationAndView, localAttractionsAndActivities, checkoutInstructions.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |
| **groups** | **String** | Amenity groups to read, comma-separated (default: all 19): essentials, internet, climateControl, general, office, kitchenAndDining, parking, poolAndSpa, sustainability, entertainment, outdoor, onsiteService, accessibility, homeSafety, safetyDevices, enhancedCleaning, locationAndView, localAttractionsAndActivities, checkoutInstructions. | [optional] |

### Return type

[**GetVrboListingAmenities200Response**](GetVrboListingAmenities200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_availability

> <GetVrboListingAvailability200Response> get_vrbo_listing_availability(id, opts)

Get the Vrbo calendar

The listing's calendar as Vrbo shows it, night by night — the counterpart of `GET /v1/channels/airbnb/listings/{id}/availability`: whether each night is `available`, what holds it (`blockedBy`: a `reservation`, a `block` or an imported `ical` calendar, with the booking's `reservationRef`), the nightly price, minimum stay and whether guests can arrive or leave that day.  Read from Vrbo for each request (one Vrbo read for the range): `start_date`..`end_date`, at most 366 nights, default the next 30. `?jobId=` reads the status of a write instead.

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
  start_date: Date.parse('2013-10-20'), # Date | First night (default today).
  end_date: Date.parse('2013-10-20'), # Date | Last night (default start + 29 days).
  job_id: 'job_id_example', # String | The `jobId` a PUT returned: read that write's status.
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo calendar
  result = api_instance.get_vrbo_listing_availability(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_availability: #{e}"
end
```

#### Using the get_vrbo_listing_availability_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingAvailability200Response>, Integer, Hash)> get_vrbo_listing_availability_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo calendar
  data, status_code, headers = api_instance.get_vrbo_listing_availability_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingAvailability200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **start_date** | **Date** | First night (default today). | [optional] |
| **end_date** | **Date** | Last night (default start + 29 days). | [optional] |
| **job_id** | **String** | The &#x60;jobId&#x60; a PUT returned: read that write&#39;s status. | [optional] |
| **vrbo_listing_number** | **String** | The Vrbo listing number, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingAvailability200Response**](GetVrboListingAvailability200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_booking_settings

> <GetVrboListingBookingSettings200Response> get_vrbo_listing_booking_settings(id, opts)

Get the Vrbo booking settings

Instant book or quote-and-hold, minimum nights, notice before arrival, how far ahead guests can book, maximum stay, access type.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

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

The policy (Vrbo's named ones or custom refund windows), seasonal overrides, and the named policies Vrbo offers.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

### Return type

[**GetVrboListingCancellation200Response**](GetVrboListingCancellation200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_checkin_guide

> <GetVrboListingCheckinGuide200Response> get_vrbo_listing_checkin_guide(id, opts)

Get the Vrbo welcome guide

What guests receive before arrival: check-in and check-out instructions, driving and parking directions, access (type, code), wifi, per-amenity instructions, contacts.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
}

begin
  # Get the Vrbo welcome guide
  result = api_instance.get_vrbo_listing_checkin_guide(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_checkin_guide: #{e}"
end
```

#### Using the get_vrbo_listing_checkin_guide_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingCheckinGuide200Response>, Integer, Hash)> get_vrbo_listing_checkin_guide_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo welcome guide
  data, status_code, headers = api_instance.get_vrbo_listing_checkin_guide_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingCheckinGuide200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_checkin_guide_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

### Return type

[**GetVrboListingCheckinGuide200Response**](GetVrboListingCheckinGuide200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_checkout_guide

> <GetVrboListingCheckoutGuide200Response> get_vrbo_listing_checkout_guide(id, opts)

Get the Vrbo checkout guide

The checkout instructions guests get in Vrbo's welcome guide (`instructions`, `photos`). Written with PUT …/checkin-guide (`checkOut`), which holds the whole guide.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now.

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
  source: 'stored', # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo checkout guide
  result = api_instance.get_vrbo_listing_checkout_guide(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_checkout_guide: #{e}"
end
```

#### Using the get_vrbo_listing_checkout_guide_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingCheckoutGuide200Response>, Integer, Hash)> get_vrbo_listing_checkout_guide_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo checkout guide
  data, status_code, headers = api_instance.get_vrbo_listing_checkout_guide_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingCheckoutGuide200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_checkout_guide_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingCheckoutGuide200Response**](GetVrboListingCheckoutGuide200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_content

> <GetVrboListingContent200Response> get_vrbo_listing_content(id, sections, opts)

Get several Vrbo listing sections

Read several sections of the listing's Vrbo listing in one call. `sections` is required: name them (`?sections=descriptions,house-rules,fees`) or ask for `all`. Each section is the `data` of its own endpoint.  Sections Repull holds answer from its copy; only the others are read on Vrbo, in one pass (`?source=live` reads them all on Vrbo: about 45 calls, **around 2.5 minutes** for `all`). A section Vrbo fails to return carries `{ error: { code, message } }`; the others still answer. `dataFreshness.lastSyncedAt` is the oldest section's.  Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
sections = 'descriptions,house-rules,fees' # String | Comma-separated sections, or `all`: descriptions, details, story, additional-info, photos, amenities, rooms, location, house-rules, booking-settings, cancellation, fees, pricing, payment-terms, protection, taxes, permits, checkin-guide, videos.
opts = {
  source: 'stored', # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **sections** | **String** | Comma-separated sections, or &#x60;all&#x60;: descriptions, details, story, additional-info, photos, amenities, rooms, location, house-rules, booking-settings, cancellation, fees, pricing, payment-terms, protection, taxes, permits, checkin-guide, videos. |  |
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingContent200Response**](GetVrboListingContent200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_descriptions

> <GetVrboListingDescriptions200Response> get_vrbo_listing_descriptions(id, opts)

Get the Vrbo headline and description

The headline and description guests read: the listing's own language (`primary: true`, `locale: null`) and every language written for it by hand, which replaces Vrbo's automatic translation. `?locale=` returns one language.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds; a live read is 2 Vrbo calls plus 1 per language.

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
  locale: 'fr-FR', # String | Only this language (a code from `languages`).
  source: 'stored', # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo headline and description
  result = api_instance.get_vrbo_listing_descriptions(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_descriptions: #{e}"
end
```

#### Using the get_vrbo_listing_descriptions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingDescriptions200Response>, Integer, Hash)> get_vrbo_listing_descriptions_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo headline and description
  data, status_code, headers = api_instance.get_vrbo_listing_descriptions_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingDescriptions200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_descriptions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **locale** | **String** | Only this language (a code from &#x60;languages&#x60;). | [optional] |
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingDescriptions200Response**](GetVrboListingDescriptions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_details

> <GetVrboListingDetails200Response> get_vrbo_listing_details(id, opts)

Get the Vrbo property details

Property type (and the types Vrbo offers), internal name, interior size, seniors-only and long-term-renter flags.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
}

begin
  # Get the Vrbo property details
  result = api_instance.get_vrbo_listing_details(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_details: #{e}"
end
```

#### Using the get_vrbo_listing_details_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingDetails200Response>, Integer, Hash)> get_vrbo_listing_details_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo property details
  data, status_code, headers = api_instance.get_vrbo_listing_details_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingDetails200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_details_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

### Return type

[**GetVrboListingDetails200Response**](GetVrboListingDetails200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_fees

> <GetVrboListingFees200Response> get_vrbo_listing_fees(id, opts)

Get the Vrbo fees

Cleaning, pet and extra-guest fees and custom fees, with their type (per stay / per night) and whether they are taxable.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

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

Check-in/out times, maximum guests and adults, minimum age, children (with age bands), pets (count, weight), smoking (inside/outside), events (attendee cap), up to 3 custom rules, the rental agreement.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

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

The address (read-only: Vrbo changes it only through its support) and whether guests see the exact location or an area.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

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

How much the guest pays at booking and when the rest is due.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

### Return type

[**GetVrboListingPaymentTerms200Response**](GetVrboListingPaymentTerms200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_permits

> <GetVrboListingPermits200Response> get_vrbo_listing_permits(id, opts)

Get the Vrbo registration / licence

The local registration or licence fields Vrbo asks for in the listing's jurisdiction, and their status.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
}

begin
  # Get the Vrbo registration / licence
  result = api_instance.get_vrbo_listing_permits(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_permits: #{e}"
end
```

#### Using the get_vrbo_listing_permits_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingPermits200Response>, Integer, Hash)> get_vrbo_listing_permits_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo registration / licence
  data, status_code, headers = api_instance.get_vrbo_listing_permits_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingPermits200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_permits_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

### Return type

[**GetVrboListingPermits200Response**](GetVrboListingPermits200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_photos

> <GetVrboListingPhotos200Response> get_vrbo_listing_photos(id, opts)

Get the Vrbo photos

Photos in order (id, url, caption, Vrbo's own tags, rank, rooms), plus any Vrbo moderation rejected and why.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds.

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
  source: 'stored', # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |
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

Base nightly rate per weekday, weekly and monthly discounts, default minimum stay, rate limits.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

### Return type

[**GetVrboListingPricing200Response**](GetVrboListingPricing200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_protection

> <GetVrboListingProtection200Response> get_vrbo_listing_protection(id, opts)

Get the Vrbo damage protection

Refundable damage deposit and damage protection.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

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

Per night over a date range: the nightly rate, its weekday, the weekly (7–27 nights) and monthly (28+ nights) discounts and the minimum stay. Vrbo offers only these two stay discounts, saved per night with the weekday prices.  Read live from Vrbo on every request (a date range). **Cost:** 1 Vrbo calendar call (`?start=&end=`, default today + 13 days) on Vrbo, spaced ~3 s apart per account.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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


## get_vrbo_listing_rooms

> <GetVrboListingRooms200Response> get_vrbo_listing_rooms(id, opts)

Get the Vrbo rooms

Bedrooms, bathrooms, living rooms and other spaces with their beds and room amenities; the space, bed and bathroom types Vrbo offers.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call + 1 per room on Vrbo, spaced ~3 s apart per account — a few seconds.

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
  source: 'stored', # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo rooms
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
  # Get the Vrbo rooms
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingRooms200Response**](GetVrboListingRooms200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_safety_disclosures

> <GetVrboListingSafetyDisclosures200Response> get_vrbo_listing_safety_disclosures(id, opts)

Get the Vrbo safety disclosures

What the listing tells guests about safety — the same path as Airbnb's safety disclosures. On Vrbo these are two amenity groups, field by field like GET …/amenities: `homeSafety` (smoke and carbon-monoxide detectors, fire extinguisher, deadbolt lock, exterior lighting, first-aid kit and where it is, emergency exit instructions, hospital and police contacts) and `safetyDevices` (smoke and carbon-monoxide detectors, gas-powered appliances). The detector questions are choices (`yes` / `no`, see each field's `options`).  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds; a live read is 2 Vrbo calls.

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
  source: 'stored', # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Get the Vrbo safety disclosures
  result = api_instance.get_vrbo_listing_safety_disclosures(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_safety_disclosures: #{e}"
end
```

#### Using the get_vrbo_listing_safety_disclosures_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetVrboListingSafetyDisclosures200Response>, Integer, Hash)> get_vrbo_listing_safety_disclosures_with_http_info(id, opts)

```ruby
begin
  # Get the Vrbo safety disclosures
  data, status_code, headers = api_instance.get_vrbo_listing_safety_disclosures_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetVrboListingSafetyDisclosures200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_safety_disclosures_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**GetVrboListingSafetyDisclosures200Response**](GetVrboListingSafetyDisclosures200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_story

> <GetVrboListingStory200Response> get_vrbo_listing_story(id, opts)

Get the Vrbo host story

\"Your story\" on the listing: about you, why this property, what makes it unique.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

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

Who collects tax and the rules that apply. Where Vrbo collects (e.g. British Columbia) the rules are read-only.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

### Return type

[**GetVrboListingTaxes200Response**](GetVrboListingTaxes200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vrbo_listing_videos

> <GetVrboListingVideos200Response> get_vrbo_listing_videos(id, opts)

Get the Vrbo videos

The listing's videos with their file name, Vrbo's processing and review status, player and thumbnail URLs, upload time and any reasons Vrbo rejected them.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.

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
  source: 'stored' # String | `stored` (default): Repull's copy, in milliseconds. `live`: read Vrbo now (seconds) and refresh the copy.
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
| **source** | **String** | &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. | [optional][default to &#39;stored&#39;] |

### Return type

[**GetVrboListingVideos200Response**](GetVrboListingVideos200Response.md)

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


## map_vrbo_listing

> <MapVrboListing200Response> map_vrbo_listing(map_vrbo_listing_request)

Link a Vrbo listing to a Repull listing

Link a Vrbo unit that is already on the host's connected Vrbo account to a Repull listing — the Vrbo counterpart of `POST /v1/channels/airbnb/listings/map`. Send `listingId` to link it to that listing, or `create: true` to create a Repull listing from what Vrbo shows. Once linked, the unit's bookings and messages are imported (upcoming ones and the last 30 days first).  `accountId` names the Vrbo account when the workspace has several (`GET /v1/connect/vrbo-login`). `syncEnabled: true` also sends the listing's calendar to Vrbo (full access; refused with `409 calendar_managed_elsewhere` while another tool manages the account's calendar).  The same write as `POST /v1/connections/{id}/mappings`, for one unit.

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
map_vrbo_listing_request = Repull::MapVrboListingRequest.new({vrbo_listing_number: '5506023'}) # MapVrboListingRequest | 

begin
  # Link a Vrbo listing to a Repull listing
  result = api_instance.map_vrbo_listing(map_vrbo_listing_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->map_vrbo_listing: #{e}"
end
```

#### Using the map_vrbo_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MapVrboListing200Response>, Integer, Hash)> map_vrbo_listing_with_http_info(map_vrbo_listing_request)

```ruby
begin
  # Link a Vrbo listing to a Repull listing
  data, status_code, headers = api_instance.map_vrbo_listing_with_http_info(map_vrbo_listing_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MapVrboListing200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->map_vrbo_listing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **map_vrbo_listing_request** | [**MapVrboListingRequest**](MapVrboListingRequest.md) |  |  |

### Return type

[**MapVrboListing200Response**](MapVrboListing200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## reorder_vrbo_listing_photos

> <AddVrboListingPhotos200Response> reorder_vrbo_listing_photos(id, reorder_vrbo_listing_photos_request, opts)

Reorder the Vrbo photos

Put the photos in this order, first photo first. Photos left out keep their order after the ones sent. Photo ids are the `id`s of GET …/photos.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
reorder_vrbo_listing_photos_request = Repull::ReorderVrboListingPhotosRequest.new({photo_ids: ['photo_ids_example']}) # ReorderVrboListingPhotosRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Reorder the Vrbo photos
  result = api_instance.reorder_vrbo_listing_photos(id, reorder_vrbo_listing_photos_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->reorder_vrbo_listing_photos: #{e}"
end
```

#### Using the reorder_vrbo_listing_photos_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AddVrboListingPhotos200Response>, Integer, Hash)> reorder_vrbo_listing_photos_with_http_info(id, reorder_vrbo_listing_photos_request, opts)

```ruby
begin
  # Reorder the Vrbo photos
  data, status_code, headers = api_instance.reorder_vrbo_listing_photos_with_http_info(id, reorder_vrbo_listing_photos_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AddVrboListingPhotos200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->reorder_vrbo_listing_photos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **reorder_vrbo_listing_photos_request** | [**ReorderVrboListingPhotosRequest**](ReorderVrboListingPhotosRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**AddVrboListingPhotos200Response**](AddVrboListingPhotos200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## set_vrbo_listing_cover_photo

> <AddVrboListingPhotos200Response> set_vrbo_listing_cover_photo(id, set_vrbo_listing_cover_photo_request, opts)

Set the Vrbo cover photo

Make one photo the first, the one guests see in search. Photo ids are the `id`s of GET …/photos.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
set_vrbo_listing_cover_photo_request = Repull::SetVrboListingCoverPhotoRequest.new({photo_id: 'photo_id_example'}) # SetVrboListingCoverPhotoRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Set the Vrbo cover photo
  result = api_instance.set_vrbo_listing_cover_photo(id, set_vrbo_listing_cover_photo_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->set_vrbo_listing_cover_photo: #{e}"
end
```

#### Using the set_vrbo_listing_cover_photo_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AddVrboListingPhotos200Response>, Integer, Hash)> set_vrbo_listing_cover_photo_with_http_info(id, set_vrbo_listing_cover_photo_request, opts)

```ruby
begin
  # Set the Vrbo cover photo
  data, status_code, headers = api_instance.set_vrbo_listing_cover_photo_with_http_info(id, set_vrbo_listing_cover_photo_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AddVrboListingPhotos200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->set_vrbo_listing_cover_photo_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **set_vrbo_listing_cover_photo_request** | [**SetVrboListingCoverPhotoRequest**](SetVrboListingCoverPhotoRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**AddVrboListingPhotos200Response**](AddVrboListingPhotos200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_additional_info

> <UpdateVrboListingAdditionalInfo200Response> update_vrbo_listing_additional_info(id, update_vrbo_listing_additional_info_request, opts)

Update the Vrbo additional details

Change the additional details of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `property`, `bedrooms`, `bathrooms`.  **Cost:** 1 call + 2 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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

Change the amenities of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `groups: {<group>: {values: {<field id>: value}}}`. Checkbox `true`/`false`; choice one of the field's `options`; text and numbers as such. Setting a parent to \"no\" clears its children, as Vrbo's own form does.  **Cost:** 1 call per group written + the read back of those groups on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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


## update_vrbo_listing_availability

> <UpdateVrboListingAvailability202Response> update_vrbo_listing_availability(id, update_vrbo_listing_availability_request, opts)

Update the Vrbo calendar

Write nights to Vrbo only — the counterpart of `PUT /v1/channels/airbnb/listings/{id}/availability` with `type: \"calendar\"`, with its operation fields: `daily_price`, `availability`, `min_nights`, `closed_to_arrival`, `closed_to_departure`.  The writes are queued with the account's other Vrbo calendar writes, which Vrbo takes at a pace of its own, so this answers `202` with a `jobId`: read its status with `GET …/availability?jobId=`. The listing's own calendar is not changed, and its next push for the same nights puts its own values back (as on Airbnb). For a change on every channel use `PUT /v1/availability/{propertyId}`.  Listing-level stay rules (default minimum stay, notice, booking window) are Vrbo's booking settings: `PUT /v1/channels/vrbo/listings/{id}/booking-settings` (`type: \"rules\"` is refused with that pointer). Nights up to 730 days ahead. Needs full access (`403 vrbo_messaging_access`); `409 calendar_managed_elsewhere` while another tool manages the account's calendar on Vrbo.

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
update_vrbo_listing_availability_request = Repull::UpdateVrboListingAvailabilityRequest.new({operations: [Repull::UpdateVrboListingAvailabilityRequestOperationsInner.new]}) # UpdateVrboListingAvailabilityRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo calendar
  result = api_instance.update_vrbo_listing_availability(id, update_vrbo_listing_availability_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_availability: #{e}"
end
```

#### Using the update_vrbo_listing_availability_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingAvailability202Response>, Integer, Hash)> update_vrbo_listing_availability_with_http_info(id, update_vrbo_listing_availability_request, opts)

```ruby
begin
  # Update the Vrbo calendar
  data, status_code, headers = api_instance.update_vrbo_listing_availability_with_http_info(id, update_vrbo_listing_availability_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingAvailability202Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_availability_request** | [**UpdateVrboListingAvailabilityRequest**](UpdateVrboListingAvailabilityRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingAvailability202Response**](UpdateVrboListingAvailability202Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_booking_settings

> <UpdateVrboListingBookingSettings200Response> update_vrbo_listing_booking_settings(id, update_vrbo_listing_booking_settings_request, opts)

Update the Vrbo booking settings

Change the booking settings of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `bookingType` (`INSTANT`|`QUOTEHOLD`), `minNights`, `minDaysBeforeBooking`, `maxMonthsBeforeBooking` (6, 9, 12, 18 or 24), `maxLengthOfStay`, `accessType`. Values must be ones the read lists. None of these can be cleared once set — **including `accessType`**: Vrbo keeps the last access type, so it can be changed to another but not removed.  **Cost:** 1–3 calls + 2 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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

Change the cancellation policy of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `policyType` (e.g. `POLICY_TYPE_VR_RELAXED`, `_MODERATE`, `_FIRM`, `_STRICT`, or `POLICY_TYPE_CUSTOM` with `tiers: [{daysBefore, refundPercent}]`). Seasonal overrides are kept.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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


## update_vrbo_listing_checkin_guide

> <UpdateVrboListingCheckinGuide200Response> update_vrbo_listing_checkin_guide(id, update_vrbo_listing_checkin_guide_request, opts)

Update the Vrbo welcome guide

Change the welcome guide of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `checkIn`, `checkOut`, `drivingDirections`, `parkingDirections` (`{instructions}`), `wifi`, `access`, `amenities` (`{AMENITY_ID: {instructions}}`). **The notes are one-way:** Vrbo has not been shown to remove a note once added, so `null` and empty text are refused — change a note to other text instead.  **Cost:** 1–2 calls per item + the read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
update_vrbo_listing_checkin_guide_request = Repull::UpdateVrboListingCheckinGuideRequest.new # UpdateVrboListingCheckinGuideRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo welcome guide
  result = api_instance.update_vrbo_listing_checkin_guide(id, update_vrbo_listing_checkin_guide_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_checkin_guide: #{e}"
end
```

#### Using the update_vrbo_listing_checkin_guide_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingCheckinGuide200Response>, Integer, Hash)> update_vrbo_listing_checkin_guide_with_http_info(id, update_vrbo_listing_checkin_guide_request, opts)

```ruby
begin
  # Update the Vrbo welcome guide
  data, status_code, headers = api_instance.update_vrbo_listing_checkin_guide_with_http_info(id, update_vrbo_listing_checkin_guide_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingCheckinGuide200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_checkin_guide_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_checkin_guide_request** | [**UpdateVrboListingCheckinGuideRequest**](UpdateVrboListingCheckinGuideRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingCheckinGuide200Response**](UpdateVrboListingCheckinGuide200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_descriptions

> <UpdateVrboListingDescriptions200Response> update_vrbo_listing_descriptions(id, update_vrbo_listing_descriptions_request, opts)

Update the Vrbo headline and description

Change the headline and/or description. Without `locale` this is the listing's own language; with `locale` (one of `languages`) it writes that language's translation by hand — a field left out keeps the text Vrbo has for it. Vrbo refuses some characters and words (`( ) * $ €`, other platforms' names, \"covid\") and says which.  The answer is every language, as GET returns it.  **Cost:** 1 Vrbo call + 1 to read back (a translation with one field: +1 to read the other).  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
update_vrbo_listing_descriptions_request = Repull::UpdateVrboListingDescriptionsRequest.new # UpdateVrboListingDescriptionsRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo headline and description
  result = api_instance.update_vrbo_listing_descriptions(id, update_vrbo_listing_descriptions_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_descriptions: #{e}"
end
```

#### Using the update_vrbo_listing_descriptions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingDescriptions200Response>, Integer, Hash)> update_vrbo_listing_descriptions_with_http_info(id, update_vrbo_listing_descriptions_request, opts)

```ruby
begin
  # Update the Vrbo headline and description
  data, status_code, headers = api_instance.update_vrbo_listing_descriptions_with_http_info(id, update_vrbo_listing_descriptions_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingDescriptions200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_descriptions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_descriptions_request** | [**UpdateVrboListingDescriptionsRequest**](UpdateVrboListingDescriptionsRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingDescriptions200Response**](UpdateVrboListingDescriptions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_details

> <UpdateVrboListingDetails200Response> update_vrbo_listing_details(id, update_vrbo_listing_details_request, opts)

Update the Vrbo property details

Change the property details of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `propertyType` (one of `propertyTypeOptions`), `propertyName`, `interiorSize` `{value, unit: sqft|sqm}`, `seniorsOnly`, `longTermRentersWelcome`. `propertyType` and `propertyName` can be changed but not cleared.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
update_vrbo_listing_details_request = Repull::UpdateVrboListingDetailsRequest.new # UpdateVrboListingDetailsRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo property details
  result = api_instance.update_vrbo_listing_details(id, update_vrbo_listing_details_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_details: #{e}"
end
```

#### Using the update_vrbo_listing_details_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingDetails200Response>, Integer, Hash)> update_vrbo_listing_details_with_http_info(id, update_vrbo_listing_details_request, opts)

```ruby
begin
  # Update the Vrbo property details
  data, status_code, headers = api_instance.update_vrbo_listing_details_with_http_info(id, update_vrbo_listing_details_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingDetails200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_details_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_details_request** | [**UpdateVrboListingDetailsRequest**](UpdateVrboListingDetailsRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingDetails200Response**](UpdateVrboListingDetails200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_fees

> <UpdateVrboListingFees200Response> update_vrbo_listing_fees(id, update_vrbo_listing_fees_request, opts)

Update the Vrbo fees

Change the fees of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `cleaning`, `pets`, `extraGuests`, `custom`. `null` clears a fee; `custom` replaces the custom-fee list (`[]` removes them all), each `{productCode, amount, type?, taxable?, taxRate?}` with `productCode` one of the read's `customFeeCodes`.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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

Change the house rules of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `checkInTime`/`checkOutTime` (`Flexible` or `HH:MM` on the half hour), `maxGuests`, `maxAdults`, `occupancyNote`, `minimumAge`, `minimumAgeNote`, `children`, `pets`, `smoking`, `events`, `customRules` (at most 3). `maxAdults` may not exceed `maxGuests`: when lowering `maxGuests`, send `maxAdults` with it. `maxGuests` cannot be cleared; `minimumAge: null` removes the minimum age.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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

Change the map setting of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `showExactLocation: true|false`.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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

Change the payment terms of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `percentDueNow` and `payments: [{percent, daysBeforeArrival}]`, adding up to 100.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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


## update_vrbo_listing_permits

> <UpdateVrboListingPermits200Response> update_vrbo_listing_permits(id, update_vrbo_listing_permits_request, opts)

Update the Vrbo registration / licence

Change the registration / licence of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `settings: [{name, value}]` with the `name`s the read lists (they differ per city). Vrbo checks them against the registry.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
update_vrbo_listing_permits_request = Repull::UpdateVrboListingPermitsRequest.new({settings: [Repull::UpdateVrboListingPermitsRequestSettingsInner.new({name: 'name_example', value: nil})]}) # UpdateVrboListingPermitsRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo registration / licence
  result = api_instance.update_vrbo_listing_permits(id, update_vrbo_listing_permits_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_permits: #{e}"
end
```

#### Using the update_vrbo_listing_permits_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingPermits200Response>, Integer, Hash)> update_vrbo_listing_permits_with_http_info(id, update_vrbo_listing_permits_request, opts)

```ruby
begin
  # Update the Vrbo registration / licence
  data, status_code, headers = api_instance.update_vrbo_listing_permits_with_http_info(id, update_vrbo_listing_permits_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingPermits200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_permits_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_permits_request** | [**UpdateVrboListingPermitsRequest**](UpdateVrboListingPermitsRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingPermits200Response**](UpdateVrboListingPermits200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_photo

> <AddVrboListingPhotos200Response> update_vrbo_listing_photo(id, update_vrbo_listing_photo_request, opts)

Update a Vrbo photo

Change one photo's `caption` and/or its position (`sort_order`, 1 = first). Photo ids are the `id`s of GET …/photos. Vrbo cannot clear a caption once set.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
update_vrbo_listing_photo_request = Repull::UpdateVrboListingPhotoRequest.new({photo_id: 'photo_id_example'}) # UpdateVrboListingPhotoRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update a Vrbo photo
  result = api_instance.update_vrbo_listing_photo(id, update_vrbo_listing_photo_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_photo: #{e}"
end
```

#### Using the update_vrbo_listing_photo_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AddVrboListingPhotos200Response>, Integer, Hash)> update_vrbo_listing_photo_with_http_info(id, update_vrbo_listing_photo_request, opts)

```ruby
begin
  # Update a Vrbo photo
  data, status_code, headers = api_instance.update_vrbo_listing_photo_with_http_info(id, update_vrbo_listing_photo_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AddVrboListingPhotos200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_photo_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_photo_request** | [**UpdateVrboListingPhotoRequest**](UpdateVrboListingPhotoRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**AddVrboListingPhotos200Response**](AddVrboListingPhotos200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_pricing

> <UpdateVrboListingPricing200Response> update_vrbo_listing_pricing(id, update_vrbo_listing_pricing_request, opts)

Update the Vrbo base pricing

Change the base pricing of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `baseRate`. The answer comes once Vrbo shows the new rate. Nightly prices per date come from the listing calendar (`PUT /v1/availability/{propertyId}`), which Vrbo shows over the base rate. Uses Vrbo's calendar quota: while the listing's calendar push is writing, the answer is `409 vrbo_calendar_busy` with `retry_after` and nothing is changed.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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


## update_vrbo_listing_protection

> <UpdateVrboListingProtection200Response> update_vrbo_listing_protection(id, update_vrbo_listing_protection_request, opts)

Update the Vrbo damage protection

Change the damage protection of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `damageDeposit` (`{amount}` or `null`), `damageProtection`.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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

Change the rates and stay discounts of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `startDate`, `endDate` (at most 3 years) and any of `nightlyRate` (one price), `nightlyRates` (`{sunday…saturday}`), `weeklyDiscountPercent`, `monthlyDiscountPercent` (0–99). A discount-only write keeps the current prices when each weekday has one price in the range; otherwise send `nightlyRates`. Nightly prices belong to the listing calendar (`PUT /v1/availability/{propertyId}`), whose push to Vrbo may put back a price set here; use this for the discounts and for prices on nights the calendar does not manage. While the listing's calendar push is writing, the answer is `409 vrbo_calendar_busy` with `retry_after` and nothing is changed.  **Cost:** 1–2 calendar calls + 1 to read back (Vrbo's calendar quota, the one price pushes use) on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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


## update_vrbo_listing_room

> <UpdateVrboListingRoom200Response> update_vrbo_listing_room(id, room_id, update_vrbo_listing_room_request, opts)

Update a Vrbo room

Change a room's name, description, bathroom type, beds or room amenities. Vrbo cannot change the type of a room: delete it and add one. `beds` replaces the room's beds.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
room_id = 'd342a2ab-0cf2-4032-a962-bb1c0e35648c' # String | The room's `spaceId` from GET …/rooms.
update_vrbo_listing_room_request = Repull::UpdateVrboListingRoomRequest.new # UpdateVrboListingRoomRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update a Vrbo room
  result = api_instance.update_vrbo_listing_room(id, room_id, update_vrbo_listing_room_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_room: #{e}"
end
```

#### Using the update_vrbo_listing_room_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingRoom200Response>, Integer, Hash)> update_vrbo_listing_room_with_http_info(id, room_id, update_vrbo_listing_room_request, opts)

```ruby
begin
  # Update a Vrbo room
  data, status_code, headers = api_instance.update_vrbo_listing_room_with_http_info(id, room_id, update_vrbo_listing_room_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingRoom200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_room_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **room_id** | **String** | The room&#39;s &#x60;spaceId&#x60; from GET …/rooms. |  |
| **update_vrbo_listing_room_request** | [**UpdateVrboListingRoomRequest**](UpdateVrboListingRoomRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingRoom200Response**](UpdateVrboListingRoom200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_safety_disclosures

> <UpdateVrboListingSafetyDisclosures200Response> update_vrbo_listing_safety_disclosures(id, update_vrbo_listing_safety_disclosures_request, opts)

Update the Vrbo safety disclosures

Set safety values field by field, as PUT …/amenities does for these two groups: `{\"groups\": {\"homeSafety\": {\"values\": {\"smockDetector\": \"yes\", \"firstAidKit\": true}}}}` (Vrbo's own field ids, as the read lists them). Field ids are in the read.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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
update_vrbo_listing_safety_disclosures_request = Repull::UpdateVrboListingSafetyDisclosuresRequest.new({groups: Repull::UpdateVrboListingSafetyDisclosuresRequestGroups.new}) # UpdateVrboListingSafetyDisclosuresRequest | 
opts = {
  vrbo_listing_number: 'vrbo_listing_number_example' # String | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
}

begin
  # Update the Vrbo safety disclosures
  result = api_instance.update_vrbo_listing_safety_disclosures(id, update_vrbo_listing_safety_disclosures_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_safety_disclosures: #{e}"
end
```

#### Using the update_vrbo_listing_safety_disclosures_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateVrboListingSafetyDisclosures200Response>, Integer, Hash)> update_vrbo_listing_safety_disclosures_with_http_info(id, update_vrbo_listing_safety_disclosures_request, opts)

```ruby
begin
  # Update the Vrbo safety disclosures
  data, status_code, headers = api_instance.update_vrbo_listing_safety_disclosures_with_http_info(id, update_vrbo_listing_safety_disclosures_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateVrboListingSafetyDisclosures200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_safety_disclosures_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string) of a listing linked to Vrbo. |  |
| **update_vrbo_listing_safety_disclosures_request** | [**UpdateVrboListingSafetyDisclosuresRequest**](UpdateVrboListingSafetyDisclosuresRequest.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit. | [optional] |

### Return type

[**UpdateVrboListingSafetyDisclosures200Response**](UpdateVrboListingSafetyDisclosures200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_vrbo_listing_story

> <UpdateVrboListingStory200Response> update_vrbo_listing_story(id, update_vrbo_listing_story_request, opts)

Update the Vrbo host story

Change the host story of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `aboutYou`, `whyThisProperty`, `uniqueBenefits`.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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

Change the taxes of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `tax`, `stayTax` or `partnerTaxSettings`, in Vrbo's shape (see the read's `raw`).  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.

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


## vrbo_listing_action

> <VrboListingAction200Response> vrbo_listing_action(id, vrbo_listing_action_request)

Act on the Vrbo listing

Airbnb's listing actions, on Vrbo:  - `push` / `publish` — push the listing's content onto its Vrbo listing: the same job as `POST /v1/listings/{id}/publish/vrbo` (`202`, poll `GET /v1/listings/{id}/publish/vrbo?jobId=`). Optional `sections` and `vrboListingNumber`. - `unlist` — Vrbo's \"Hide listing\": out of Vrbo search, no new bookings. Read back from Vrbo before answering. - `relist` — Vrbo's \"Reactivate\". - `delete` — deactivate the Repull record (local; the Vrbo listing is not touched — use `unlist` for that).  `unlist` / `relist` act on every Vrbo unit of the listing, or the one named with `vrboListingNumber`. Needs full access. See https://repull.dev/docs/channels/vrbo/listing-content.

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
id = 'id_example' # String | Repull listing id (numeric string).
vrbo_listing_action_request = Repull::VrboListingActionRequest.new({action: 'push'}) # VrboListingActionRequest | 

begin
  # Act on the Vrbo listing
  result = api_instance.vrbo_listing_action(id, vrbo_listing_action_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->vrbo_listing_action: #{e}"
end
```

#### Using the vrbo_listing_action_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<VrboListingAction200Response>, Integer, Hash)> vrbo_listing_action_with_http_info(id, vrbo_listing_action_request)

```ruby
begin
  # Act on the Vrbo listing
  data, status_code, headers = api_instance.vrbo_listing_action_with_http_info(id, vrbo_listing_action_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <VrboListingAction200Response>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->vrbo_listing_action_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id (numeric string). |  |
| **vrbo_listing_action_request** | [**VrboListingActionRequest**](VrboListingActionRequest.md) |  |  |

### Return type

[**VrboListingAction200Response**](VrboListingAction200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

