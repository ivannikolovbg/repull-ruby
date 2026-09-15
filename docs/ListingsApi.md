# Repull::ListingsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_listing**](ListingsApi.md#create_listing) | **POST** /v1/listings | Create a Repull listing |
| [**create_listing_photo_upload_url**](ListingsApi.md#create_listing_photo_upload_url) | **POST** /v1/listings/{id}/photos/upload-url | Mint a direct-to-storage photo upload URL |
| [**deactivate_listing**](ListingsApi.md#deactivate_listing) | **DELETE** /v1/listings/{id} | Deactivate (exclude) a listing |
| [**delete_listing_photo**](ListingsApi.md#delete_listing_photo) | **DELETE** /v1/listings/{id}/photos | Delete a stored listing photo |
| [**generate_listing_content**](ListingsApi.md#generate_listing_content) | **POST** /v1/listings/{id}/generate-content | AI-generate listing content |
| [**get_listing**](ListingsApi.md#get_listing) | **GET** /v1/listings/{id} | Get a listing |
| [**get_listing_publish_status**](ListingsApi.md#get_listing_publish_status) | **GET** /v1/listings/{id}/publish-status | Per-channel publish status |
| [**list_listing_photos**](ListingsApi.md#list_listing_photos) | **GET** /v1/listings/{id}/photos | List a listing&#39;s stored photos |
| [**list_listings**](ListingsApi.md#list_listings) | **GET** /v1/listings | List listings |
| [**publish_listing_to_airbnb**](ListingsApi.md#publish_listing_to_airbnb) | **POST** /v1/listings/{id}/publish/airbnb | Publish a listing to Airbnb |
| [**publish_listing_to_booking**](ListingsApi.md#publish_listing_to_booking) | **POST** /v1/listings/{id}/publish/booking | Publish a listing to Booking.com |
| [**set_listings_status**](ListingsApi.md#set_listings_status) | **POST** /v1/listings/status | Activate or deactivate listings in bulk |
| [**update_listing_active**](ListingsApi.md#update_listing_active) | **PATCH** /v1/listings/{id} | Deactivate or reactivate a listing |
| [**update_listing_content**](ListingsApi.md#update_listing_content) | **PUT** /v1/listings/{id}/content | Update canonical listing content |


## create_listing

> <ListingCreateResponse> create_listing(listing_create_request)

Create a Repull listing

Create a new vacation-rental listing under the authenticated workspace. The listing is stored in the canonical Vanio listings tables and can be published to multiple channels (Airbnb, Booking.com) via the publish endpoints.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
listing_create_request = Repull::ListingCreateRequest.new({name: 'Sunset Loft #2'}) # ListingCreateRequest | 

begin
  # Create a Repull listing
  result = api_instance.create_listing(listing_create_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->create_listing: #{e}"
end
```

#### Using the create_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingCreateResponse>, Integer, Hash)> create_listing_with_http_info(listing_create_request)

```ruby
begin
  # Create a Repull listing
  data, status_code, headers = api_instance.create_listing_with_http_info(listing_create_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingCreateResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->create_listing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_create_request** | [**ListingCreateRequest**](ListingCreateRequest.md) |  |  |

### Return type

[**ListingCreateResponse**](ListingCreateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_listing_photo_upload_url

> <ListingPhotoUploadUrlResponse> create_listing_photo_upload_url(id, listing_photo_upload_url_request)

Mint a direct-to-storage photo upload URL

Mints a short-lived signed upload URL + token for a listing photo. **The client PUTs the raw file bytes directly to the returned `uploadUrl` — the file bytes never pass through the Repull API or main vanio.** This endpoint only mints the URL; do not POST the file itself here, it will not be accepted.  Flow: (1) POST here with `fileName`/`fileType`/optional `fileSize` to get `{ uploadUrl, token, path, publicUrl, expiresIn }`; (2) PUT the raw file bytes to `uploadUrl` from the client; (3) `publicUrl` is the durable URL for the uploaded photo — attach it to the listing via `PUT /v1/listings/{id}/content` (`photos` field) or list it back via `GET /v1/listings/{id}/photos`.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | Repull listing id
listing_photo_upload_url_request = Repull::ListingPhotoUploadUrlRequest.new({file_name: 'living-room.jpg', file_type: 'image/jpeg'}) # ListingPhotoUploadUrlRequest | 

begin
  # Mint a direct-to-storage photo upload URL
  result = api_instance.create_listing_photo_upload_url(id, listing_photo_upload_url_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->create_listing_photo_upload_url: #{e}"
end
```

#### Using the create_listing_photo_upload_url_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPhotoUploadUrlResponse>, Integer, Hash)> create_listing_photo_upload_url_with_http_info(id, listing_photo_upload_url_request)

```ruby
begin
  # Mint a direct-to-storage photo upload URL
  data, status_code, headers = api_instance.create_listing_photo_upload_url_with_http_info(id, listing_photo_upload_url_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPhotoUploadUrlResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->create_listing_photo_upload_url_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id |  |
| **listing_photo_upload_url_request** | [**ListingPhotoUploadUrlRequest**](ListingPhotoUploadUrlRequest.md) |  |  |

### Return type

[**ListingPhotoUploadUrlResponse**](ListingPhotoUploadUrlResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## deactivate_listing

> <ListingActiveResponse> deactivate_listing(id)

Deactivate (exclude) a listing

Deactivate a listing — sets it inactive and excludes it from Repull. This is a **soft** operation: the listing row is KEPT (never hard-deleted) and the upstream channel (Airbnb / Hospitable / Booking.com) is NEVER touched. Repull only mutates its own copy.  Equivalent to `PATCH /v1/listings/{id}` with `{ \"active\": false }`. This is the primary self-serve way for a free-tier customer to trim back under the plan-listings cap — `DELETE` is served even when the account is over the cap (a 402-locked account can still call it). To bring a listing back, use `PATCH` with `{ \"active\": true }`.  Idempotent: deactivating an already-inactive listing returns 200.  To deactivate many listings at once, use `POST /v1/listings/status` with `{ \"active\": false }`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | Repull listing id

begin
  # Deactivate (exclude) a listing
  result = api_instance.deactivate_listing(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->deactivate_listing: #{e}"
end
```

#### Using the deactivate_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingActiveResponse>, Integer, Hash)> deactivate_listing_with_http_info(id)

```ruby
begin
  # Deactivate (exclude) a listing
  data, status_code, headers = api_instance.deactivate_listing_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingActiveResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->deactivate_listing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id |  |

### Return type

[**ListingActiveResponse**](ListingActiveResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_listing_photo

> <ListingPhotoDeleteResponse> delete_listing_photo(id, listing_photo_delete_request)

Delete a stored listing photo

Deletes a single stored photo by its storage `path` (as returned by `GET /v1/listings/{id}/photos` or `POST /v1/listings/{id}/photos/upload-url`).  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | Repull listing id
listing_photo_delete_request = Repull::ListingPhotoDeleteRequest.new({path: 'path_example'}) # ListingPhotoDeleteRequest | 

begin
  # Delete a stored listing photo
  result = api_instance.delete_listing_photo(id, listing_photo_delete_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->delete_listing_photo: #{e}"
end
```

#### Using the delete_listing_photo_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPhotoDeleteResponse>, Integer, Hash)> delete_listing_photo_with_http_info(id, listing_photo_delete_request)

```ruby
begin
  # Delete a stored listing photo
  data, status_code, headers = api_instance.delete_listing_photo_with_http_info(id, listing_photo_delete_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPhotoDeleteResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->delete_listing_photo_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id |  |
| **listing_photo_delete_request** | [**ListingPhotoDeleteRequest**](ListingPhotoDeleteRequest.md) |  |  |

### Return type

[**ListingPhotoDeleteResponse**](ListingPhotoDeleteResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## generate_listing_content

> <ListingGenerateContentResponse> generate_listing_content(id, opts)

AI-generate listing content

Generate guest-facing copy (title, summary, description, amenities, etc.) for a listing using Repull AI. When `photos` are provided the vision model is used for photo-grounded copy. Persists into the listing by default.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | 
opts = {
  listing_generate_content_request: Repull::ListingGenerateContentRequest.new # ListingGenerateContentRequest | 
}

begin
  # AI-generate listing content
  result = api_instance.generate_listing_content(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->generate_listing_content: #{e}"
end
```

#### Using the generate_listing_content_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingGenerateContentResponse>, Integer, Hash)> generate_listing_content_with_http_info(id, opts)

```ruby
begin
  # AI-generate listing content
  data, status_code, headers = api_instance.generate_listing_content_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingGenerateContentResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->generate_listing_content_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **listing_generate_content_request** | [**ListingGenerateContentRequest**](ListingGenerateContentRequest.md) |  | [optional] |

### Return type

[**ListingGenerateContentResponse**](ListingGenerateContentResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_listing

> <Listing> get_listing(id, opts)

Get a listing

Fetch a single listing by id. Returns the same shape as one element of the `GET /v1/listings` response, so you can bind the result to the same model. Cross-tenant access (a listing that belongs to a different workspace) returns 404 — never 403, never reveals the listing's existence.  **Optional expansions:** Pass `?include=amenities` to enrich the response with the listing's amenity rows (`[]` when the listing has none). Pass `?include=content` for the rich content slab (summary, description, space, house rules, etc. — sourced from `listings_descriptions` for the `en` locale; `null` when no row is stored). Pass `?include=details` for the structural slab (bedrooms, bathrooms, person capacity, check-in window, wifi, house manual, etc.; `null` when no row is stored). Combine comma-separated, e.g. `?include=amenities,content,details`. The default response stays lean; consumers must opt in.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | Repull listing id
opts = {
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  include: 'content,details' # String | Comma-separated optional expansions. Currently supported: `amenities`, `content`, `details`. Unknown values return 422 with a `valid_values` envelope.
}

begin
  # Get a listing
  result = api_instance.get_listing(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->get_listing: #{e}"
end
```

#### Using the get_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Listing>, Integer, Hash)> get_listing_with_http_info(id, opts)

```ruby
begin
  # Get a listing
  data, status_code, headers = api_instance.get_listing_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Listing>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->get_listing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id |  |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **include** | **String** | Comma-separated optional expansions. Currently supported: &#x60;amenities&#x60;, &#x60;content&#x60;, &#x60;details&#x60;. Unknown values return 422 with a &#x60;valid_values&#x60; envelope. | [optional] |

### Return type

[**Listing**](Listing.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_listing_publish_status

> <ListingPublishStatusResponse> get_listing_publish_status(id)

Per-channel publish status

Returns connection state and sync activity per channel. `channels` is sync activity (empty until first push). `connections` is connection state (populated as soon as a channel is linked). Recommended polling cadence: at most once per 30s per listing — for bulk views, prefer `GET /v1/listings` and filter client-side.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | 

begin
  # Per-channel publish status
  result = api_instance.get_listing_publish_status(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->get_listing_publish_status: #{e}"
end
```

#### Using the get_listing_publish_status_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPublishStatusResponse>, Integer, Hash)> get_listing_publish_status_with_http_info(id)

```ruby
begin
  # Per-channel publish status
  data, status_code, headers = api_instance.get_listing_publish_status_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPublishStatusResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->get_listing_publish_status_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

[**ListingPublishStatusResponse**](ListingPublishStatusResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_listing_photos

> <ListingPhotosResponse> list_listing_photos(id)

List a listing's stored photos

Returns the photo set currently stored for this listing.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | Repull listing id

begin
  # List a listing's stored photos
  result = api_instance.list_listing_photos(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->list_listing_photos: #{e}"
end
```

#### Using the list_listing_photos_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPhotosResponse>, Integer, Hash)> list_listing_photos_with_http_info(id)

```ruby
begin
  # List a listing's stored photos
  data, status_code, headers = api_instance.list_listing_photos_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPhotosResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->list_listing_photos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id |  |

### Return type

[**ListingPhotosResponse**](ListingPhotosResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_listings

> <ListingListResponse> list_listings(opts)

List listings

Cursor-paginated list of listings owned by the authenticated workspace. Use `pagination.nextCursor` from one response as the `cursor` query param of the next request to walk the full set. `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`. Filters: `q` (substring on name/street/city), `status`, `channel`.  **Optional expansions:** Pass `?include=content` to enrich each row with the rich content slab (summary, description, space, house rules, etc. — sourced from `listings_descriptions` for the `en` locale). Pass `?include=details` for the structural slab (bedrooms, bathrooms, person capacity, check-in window, wifi, house manual, etc.). Both default to `null` per row when the underlying `listings_descriptions` / `listings_details` row is missing — distinct from the field being absent (which signals the expansion was not requested). Combine comma-separated, e.g. `?include=content,details`. The default response stays lean; consumers must opt in.  **Inactive listings:** by default only active listings are returned. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated, so when `status` asks for inactive ones they carry only `id`, `name`, `status` and `channels` — enough to choose what to activate with `PATCH /v1/listings/{id}`. `?include=` expansions are not applied to them.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
opts = {
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.nextCursor`. Omit to fetch the first page.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.nextCursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  limit: 56, # Integer | Max items per page. Hard cap is 100.
  q: 'q_example', # String | Case-insensitive substring search on name, street, or city.
  status: 'active', # String | Filter by listing status. Defaults to `active`. Pass `inactive` to list the listings you can activate, `archived` for archived ones, or `all` for every status. Inactive listings are returned with identity fields only — `id`, `name`, `status` and `channels` — and never with `address`, `thumbnailUrl`, `content` or `details`; activate one to see the rest.
  channel: 'airbnb', # String | Restrict to listings published on the given channel (`airbnb`, `booking`, `vrbo`, etc.). Joins through `listing_platform_links` and matches active links only.
  include: 'content,details' # String | Comma-separated optional expansions. Currently supported: `content`, `details`. Unknown values return 422 with a `valid_values` envelope. (Note: `amenities` is not yet supported on the list endpoint — use the detail endpoint to fetch amenity rows for a single listing.)
}

begin
  # List listings
  result = api_instance.list_listings(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->list_listings: #{e}"
end
```

#### Using the list_listings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingListResponse>, Integer, Hash)> list_listings_with_http_info(opts)

```ruby
begin
  # List listings
  data, status_code, headers = api_instance.list_listings_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingListResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->list_listings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. Omit to fetch the first page. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **limit** | **Integer** | Max items per page. Hard cap is 100. | [optional][default to 20] |
| **q** | **String** | Case-insensitive substring search on name, street, or city. | [optional] |
| **status** | **String** | Filter by listing status. Defaults to &#x60;active&#x60;. Pass &#x60;inactive&#x60; to list the listings you can activate, &#x60;archived&#x60; for archived ones, or &#x60;all&#x60; for every status. Inactive listings are returned with identity fields only — &#x60;id&#x60;, &#x60;name&#x60;, &#x60;status&#x60; and &#x60;channels&#x60; — and never with &#x60;address&#x60;, &#x60;thumbnailUrl&#x60;, &#x60;content&#x60; or &#x60;details&#x60;; activate one to see the rest. | [optional][default to &#39;active&#39;] |
| **channel** | **String** | Restrict to listings published on the given channel (&#x60;airbnb&#x60;, &#x60;booking&#x60;, &#x60;vrbo&#x60;, etc.). Joins through &#x60;listing_platform_links&#x60; and matches active links only. | [optional] |
| **include** | **String** | Comma-separated optional expansions. Currently supported: &#x60;content&#x60;, &#x60;details&#x60;. Unknown values return 422 with a &#x60;valid_values&#x60; envelope. (Note: &#x60;amenities&#x60; is not yet supported on the list endpoint — use the detail endpoint to fetch amenity rows for a single listing.) | [optional] |

### Return type

[**ListingListResponse**](ListingListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## publish_listing_to_airbnb

> <ListingPublishResponse> publish_listing_to_airbnb(id, opts)

Publish a listing to Airbnb

Push a Repull listing to Airbnb. Pass `airbnbConnectionId` to update an already-mapped Airbnb listing, or `hostId` to create a brand-new Airbnb listing under that host.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | 
opts = {
  listing_publish_airbnb_request: Repull::ListingPublishAirbnbRequest.new # ListingPublishAirbnbRequest | 
}

begin
  # Publish a listing to Airbnb
  result = api_instance.publish_listing_to_airbnb(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->publish_listing_to_airbnb: #{e}"
end
```

#### Using the publish_listing_to_airbnb_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPublishResponse>, Integer, Hash)> publish_listing_to_airbnb_with_http_info(id, opts)

```ruby
begin
  # Publish a listing to Airbnb
  data, status_code, headers = api_instance.publish_listing_to_airbnb_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPublishResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->publish_listing_to_airbnb_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **listing_publish_airbnb_request** | [**ListingPublishAirbnbRequest**](ListingPublishAirbnbRequest.md) |  | [optional] |

### Return type

[**ListingPublishResponse**](ListingPublishResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## publish_listing_to_booking

> <ListingPublishResponse> publish_listing_to_booking(id)

Publish a listing to Booking.com

Push a Repull listing to Booking.com. The listing must already be mapped to a Booking property + room (created via the Booking-claim Connect flow).  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | 

begin
  # Publish a listing to Booking.com
  result = api_instance.publish_listing_to_booking(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->publish_listing_to_booking: #{e}"
end
```

#### Using the publish_listing_to_booking_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPublishResponse>, Integer, Hash)> publish_listing_to_booking_with_http_info(id)

```ruby
begin
  # Publish a listing to Booking.com
  data, status_code, headers = api_instance.publish_listing_to_booking_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPublishResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->publish_listing_to_booking_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

[**ListingPublishResponse**](ListingPublishResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## set_listings_status

> <ListingStatusBatchResponse> set_listings_status(listing_status_batch_request)

Activate or deactivate listings in bulk

Sets up to 500 listings active or inactive in one call. Send `{ \"listingIds\": [\"4118\", \"4119\"], \"active\": false }` to deactivate them, or `\"active\": true` to activate them.  An inactive listing is not counted toward your plan's listing limit or billed. It is NOT deleted and the upstream channel (Airbnb / Booking.com / your PMS) is never touched — its data keeps syncing, so it is complete the moment you activate it again. Until then it cannot be read, changed, or receive webhooks.  **All or nothing.** Nothing changes unless the whole request can be applied: - If any id is not one of your listings, the call returns `404` naming those ids. - If activating would take you over your plan's listing limit, the call returns `402 listings_limit_exceeded`. Only listings that are currently inactive count toward the new total, so re-sending ids that are already active never trips the limit.  Deactivating is always allowed, including when your account is already over its limit — it is how you get back under it.  **Idempotent.** Ids already in the requested state are returned in `unchanged`; ids this call changed are returned in `updated`.  For a single listing, `PATCH /v1/listings/{id}` does the same.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
listing_status_batch_request = Repull::ListingStatusBatchRequest.new({listing_ids: ['4118'], active: false}) # ListingStatusBatchRequest | 

begin
  # Activate or deactivate listings in bulk
  result = api_instance.set_listings_status(listing_status_batch_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->set_listings_status: #{e}"
end
```

#### Using the set_listings_status_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingStatusBatchResponse>, Integer, Hash)> set_listings_status_with_http_info(listing_status_batch_request)

```ruby
begin
  # Activate or deactivate listings in bulk
  data, status_code, headers = api_instance.set_listings_status_with_http_info(listing_status_batch_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingStatusBatchResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->set_listings_status_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_status_batch_request** | [**ListingStatusBatchRequest**](ListingStatusBatchRequest.md) |  |  |

### Return type

[**ListingStatusBatchResponse**](ListingStatusBatchResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_listing_active

> <ListingActiveResponse> update_listing_active(id, listing_active_request)

Deactivate or reactivate a listing

Toggle a listing's active state. Send `{ \"active\": false }` to **deactivate** (exclude the listing from Repull) or `{ \"active\": true }` to **reactivate** it.  \"Deactivate\" keeps the listing row — it is NOT a hard delete, and it NEVER touches the upstream channel (Airbnb / Hospitable / Booking.com). Repull only mutates its own copy of the inventory. Deactivating is the self-serve way to get back under the plan-listings cap without paying.  Reactivation respects the plan-listings cap: if activating this listing would push you over the cap for your tier, the call returns `402 listings_limit_exceeded` and the listing stays inactive. Deactivate another listing or upgrade first.  Idempotent: setting a listing to the state it's already in returns 200.  To change many listings at once, all or nothing, use `POST /v1/listings/status`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | Repull listing id
listing_active_request = Repull::ListingActiveRequest.new({active: false}) # ListingActiveRequest | 

begin
  # Deactivate or reactivate a listing
  result = api_instance.update_listing_active(id, listing_active_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->update_listing_active: #{e}"
end
```

#### Using the update_listing_active_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingActiveResponse>, Integer, Hash)> update_listing_active_with_http_info(id, listing_active_request)

```ruby
begin
  # Deactivate or reactivate a listing
  data, status_code, headers = api_instance.update_listing_active_with_http_info(id, listing_active_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingActiveResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->update_listing_active_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id |  |
| **listing_active_request** | [**ListingActiveRequest**](ListingActiveRequest.md) |  |  |

### Return type

[**ListingActiveResponse**](ListingActiveResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_listing_content

> <ListingContentUpdateResponse> update_listing_content(id, listing_content_update_request)

Update canonical listing content

Write your PMS's canonical listing content — title, description, amenities, address, occupancy, and policies — into a Repull listing, making it the source of truth. This is the flagship \"the PMS owns listing content, Repull distributes it\" enabler.  **Partial update:** every field is optional. Only the fields you send are written; absent fields are left untouched. `amenities` is a FULL replacement of the amenity set (omit to leave untouched, send `[]` to clear).  **Local write only — NOT a channel publish.** This mutates Repull's own copy of the content. It does NOT push to Airbnb / Booking.com; it marks the channels dirty so a later publish knows what changed. Distribution stays a separate explicit step.  **Photos are deferred:** a provided `photos` array is echoed back in the `deferred` field and NOT persisted (media ingestion is a follow-up).  Cross-tenant access (a listing that belongs to a different workspace) returns 404 — never 403. This endpoint is served even when the account is over the plan-listings cap, since editing content on a listing you already own never grows the portfolio.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | Repull listing id
listing_content_update_request = Repull::ListingContentUpdateRequest.new # ListingContentUpdateRequest | 

begin
  # Update canonical listing content
  result = api_instance.update_listing_content(id, listing_content_update_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->update_listing_content: #{e}"
end
```

#### Using the update_listing_content_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingContentUpdateResponse>, Integer, Hash)> update_listing_content_with_http_info(id, listing_content_update_request)

```ruby
begin
  # Update canonical listing content
  data, status_code, headers = api_instance.update_listing_content_with_http_info(id, listing_content_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingContentUpdateResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->update_listing_content_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id |  |
| **listing_content_update_request** | [**ListingContentUpdateRequest**](ListingContentUpdateRequest.md) |  |  |

### Return type

[**ListingContentUpdateResponse**](ListingContentUpdateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

