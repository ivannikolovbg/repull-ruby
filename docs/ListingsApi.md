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
| [**pull_listing_from_airbnb**](ListingsApi.md#pull_listing_from_airbnb) | **POST** /v1/listings/{id}/pull/airbnb | Refresh a listing from Airbnb |
| [**set_listings_status**](ListingsApi.md#set_listings_status) | **POST** /v1/listings/status | Activate or deactivate listings in bulk |
| [**take_listing_offline**](ListingsApi.md#take_listing_offline) | **POST** /v1/listings/{id}/offline | Take a listing off the market |
| [**take_listing_online**](ListingsApi.md#take_listing_online) | **POST** /v1/listings/{id}/online | Put a listing back on the market |
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

Returns connection state and sync activity per channel. `channels` is sync activity (empty until first push). `connections` is connection state (populated as soon as a channel is linked). Recommended polling cadence: at most once per 30s per listing — for bulk views, prefer `GET /v1/listings` and filter client-side.  **When a push fails, this endpoint says why.** `channels[].pushError` carries the channel's own reason for the last failed push, verbatim — `\"Links and contact info can't be shared\"`, `\"Check-in start time must be before end time\"`, `\"property_type_group must be one of […]\"`. It is free text written by the channel, so render it next to the retry button rather than parsing it. `null` when the last push succeeded or none has run; pair it with `pushStatus` to tell those two apart.  **It also says what you will not be allowed to change.** The `airbnb` entry in `connections` carries `lockedFields` — attributes Airbnb has locked on this listing. Airbnb does not refuse a write to one: it answers 200, reports the field as locked, and applies nothing, so a locked write is indistinguishable from a successful one unless you looked first. Read it before you let someone edit. Airbnb-only; no other channel has the concept, and no other entry carries the field.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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

Cursor-paginated list of listings owned by the authenticated workspace. Use `pagination.nextCursor` from one response as the `cursor` query param of the next request to walk the full set. `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`. Filters: `q` (substring on name/street/city), `status`, `channel`.  **Optional expansions:** Pass `?include=content` to enrich each row with the rich content slab (summary, description, space, house rules, etc. — sourced from `listings_descriptions` for the `en` locale). Pass `?include=details` for the structural slab (bedrooms, bathrooms, person capacity, check-in window, wifi, house manual, etc.). Both default to `null` per row when the underlying `listings_descriptions` / `listings_details` row is missing — distinct from the field being absent (which signals the expansion was not requested). Pass `?include=thumbnail` to guarantee `thumbnailUrl` on every returned row — including the reduced inactive ones. Combine comma-separated, e.g. `?include=content,thumbnail`. The default response stays lean; consumers must opt in.  **Inactive listings:** by default only active listings are returned. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated, so when `status` asks for inactive ones they carry only `id`, `name`, `status` and `channels` — enough to choose what to activate with `PATCH /v1/listings/{id}`. The `content` and `details` expansions are not applied to them. `?include=thumbnail` is the one exception: it adds `thumbnailUrl` to an inactive row so a single request can render an active/inactive selection screen with pictures, instead of one follow-up call per listing (which an inactive listing would answer with `403 listing_inactive` anyway).

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
  status: 'active', # String | Filter by listing status. Defaults to `active`. Pass `inactive` to list the listings you can activate, `archived` for archived ones, or `all` for every status. Inactive listings are returned with identity fields only — `id`, `name`, `status` and `channels` — and never with `address`, `content` or `details`; activate one to see the rest. The only field you can add to an inactive row is `thumbnailUrl`, via `?include=thumbnail`.
  channel: 'airbnb', # String | Restrict to listings published on the given channel (`airbnb`, `booking`, `vrbo`, etc.). Joins through `listing_platform_links` and matches active links only.
  include: 'content,thumbnail' # String | Comma-separated optional expansions. Currently supported: `content`, `details`, `thumbnail`. `thumbnail` guarantees `thumbnailUrl` on every row and is the only expansion that applies to inactive listings. Unknown values return 422 with a `valid_values` envelope. (Note: `amenities` is not yet supported on the list endpoint — use the detail endpoint to fetch amenity rows for a single listing.)
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
| **status** | **String** | Filter by listing status. Defaults to &#x60;active&#x60;. Pass &#x60;inactive&#x60; to list the listings you can activate, &#x60;archived&#x60; for archived ones, or &#x60;all&#x60; for every status. Inactive listings are returned with identity fields only — &#x60;id&#x60;, &#x60;name&#x60;, &#x60;status&#x60; and &#x60;channels&#x60; — and never with &#x60;address&#x60;, &#x60;content&#x60; or &#x60;details&#x60;; activate one to see the rest. The only field you can add to an inactive row is &#x60;thumbnailUrl&#x60;, via &#x60;?include&#x3D;thumbnail&#x60;. | [optional][default to &#39;active&#39;] |
| **channel** | **String** | Restrict to listings published on the given channel (&#x60;airbnb&#x60;, &#x60;booking&#x60;, &#x60;vrbo&#x60;, etc.). Joins through &#x60;listing_platform_links&#x60; and matches active links only. | [optional] |
| **include** | **String** | Comma-separated optional expansions. Currently supported: &#x60;content&#x60;, &#x60;details&#x60;, &#x60;thumbnail&#x60;. &#x60;thumbnail&#x60; guarantees &#x60;thumbnailUrl&#x60; on every row and is the only expansion that applies to inactive listings. Unknown values return 422 with a &#x60;valid_values&#x60; envelope. (Note: &#x60;amenities&#x60; is not yet supported on the list endpoint — use the detail endpoint to fetch amenity rows for a single listing.) | [optional] |

### Return type

[**ListingListResponse**](ListingListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## publish_listing_to_airbnb

> <ListingPublishAirbnbResponse> publish_listing_to_airbnb(id, opts)

Publish a listing to Airbnb

Push a Repull listing's canonical content to Airbnb. Pass `airbnbConnectionId` to update an already-mapped Airbnb listing, or `hostId` to create a brand-new Airbnb listing under that host.  **A publish is not one call to Airbnb.** It is up to eight independent ones — details, description, amenities, rooms, policies, photos, pricing, checkout_tasks — and each can fail on its own. `result.published` is true only when every attempted section landed; `result.sections` lists the ones that did and `result.errors[]` carries Airbnb's own reason, per section, for the ones that did not. **A partial publish is normal and is not rolled back**: what succeeded stays applied. Publish again once you have fixed the failing sections — a re-publish of an unchanged section is harmless.  `result.live` is a different question from `result.published`. `published` is about CONTENT — every attempted section landed. `live` is about whether the listing takes bookings: it is true only when activation was actually performed and succeeded. A create can land all eight sections and still leave the listing inactive, because activation is skipped when instant-booking cannot be confirmed to be off — so `published: true` with `live: false` is a real and common outcome, and `result.warnings` says why. `live` is ABSENT, not `false`, when activation was never part of the operation: publishing to an already-mapped listing updates content and activates nothing. Only treat a listing as not-live when `live` is present and false.  `result.warnings[]` lists steps that failed WITHOUT failing the publish — optional work the push carried on past. They were previously swallowed, so the only sign of one was a listing that was somehow not quite right afterwards. A publish can be `published: true` and still carry warnings; read them before concluding nothing needs doing.  `result.lockedFields` names the fields Airbnb will not let this listing change at all. They are not retryable by anyone: Airbnb answers 200 and applies nothing. `GET /v1/channels/airbnb/listings/{id}` reports the same list up front.  **Which fields this pushes** — title, description sections and house rules (English/primary locale), amenities, rooms and beds, photos, nightly price and fees, cancellation policy and guest controls, check-in/out times, quiet hours, property and room type, checkout tasks. **Not pushed by this endpoint:** non-primary locales (`PUT /v1/channels/airbnb/listings/{id}/descriptions`), guest-safety disclosures (`PUT …/safety-disclosures`), check-in method (`PUT …/details`), permits (`PUT …/permits`), and the calendar (`PUT …/availability`).  `force: true` re-pushes every section, ignoring dirty-field tracking. Without it only the sections changed since the last successful publish are sent.  Send `Idempotency-Key` to make a retry safe: a timeout on a publish otherwise leaves you unable to tell whether it ran.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31', # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
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

> <Array(<ListingPublishAirbnbResponse>, Integer, Hash)> publish_listing_to_airbnb_with_http_info(id, opts)

```ruby
begin
  # Publish a listing to Airbnb
  data, status_code, headers = api_instance.publish_listing_to_airbnb_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPublishAirbnbResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->publish_listing_to_airbnb_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |
| **listing_publish_airbnb_request** | [**ListingPublishAirbnbRequest**](ListingPublishAirbnbRequest.md) |  | [optional] |

### Return type

[**ListingPublishAirbnbResponse**](ListingPublishAirbnbResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## publish_listing_to_booking

> <ListingPublishBookingResponse> publish_listing_to_booking(id, opts)

Publish a listing to Booking.com

Push a Repull listing's content to Booking.com. The listing must already be mapped to a Booking.com property + room — claim the hotel through the Connect Booking flow, then map its rooms with `POST /v1/connect/booking/map-rooms`.  **Which property the content lands in.** A listing can be mapped to more than one Booking.com property; the same unit re-listed under a new property keeps its old mapping, and workspaces routinely sit on five or six. When the listing has exactly one property you need send nothing. When it has several, name one with `hotelId` in the body (or `?hotel_id=` — the same value, accepted either way, body wins if you send both). Omit it on such a listing and the push is refused with **`409 ambiguous_booking_mapping`**, listing the candidate ids: content pushed into a property chosen for you lands on the wrong listing and reports success, which is worse than a refusal. `GET /v1/channels/booking/properties` lists every property with the listings mapped under it. Naming a property this listing is not mapped to is a `404` that names the ones it is.  The property that actually received the content comes back as `result.hotelId`.  **A publish is not one call to Booking.com.** It is several independent Content API calls — details, description, amenities, rooms, photos, pricing — and each can fail on its own. `result.published` is true only when every attempted section landed; `result.sections` lists the ones that did and `result.errors[]` carries Booking.com's own reason, per section, for the ones that did not. A property whose Content API credentials do not cover a section answers 403 for that section alone. **A partial publish is normal and is not rolled back**: what succeeded stays applied. Fix the failing sections and publish again — re-publishing an unchanged section is harmless.  A listing with no Booking.com property mapped at all is not an error: the call returns `result.published: false` with `result.reason` and `result.hotelId: null`, and nothing is pushed.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
id = 56 # Integer | Repull listing id — NOT a Booking.com hotel id.
opts = {
  hotel_id: 'hotel_id_example', # String | Booking.com property to publish into, for a listing mapped to more than one. The query-string spelling of the body's `hotelId`, accepted so this route reads the same as every other Booking listing-addressed route. The body wins when both are sent.
  listing_publish_booking_request: Repull::ListingPublishBookingRequest.new # ListingPublishBookingRequest | 
}

begin
  # Publish a listing to Booking.com
  result = api_instance.publish_listing_to_booking(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->publish_listing_to_booking: #{e}"
end
```

#### Using the publish_listing_to_booking_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPublishBookingResponse>, Integer, Hash)> publish_listing_to_booking_with_http_info(id, opts)

```ruby
begin
  # Publish a listing to Booking.com
  data, status_code, headers = api_instance.publish_listing_to_booking_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPublishBookingResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->publish_listing_to_booking_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id — NOT a Booking.com hotel id. |  |
| **hotel_id** | **String** | Booking.com property to publish into, for a listing mapped to more than one. The query-string spelling of the body&#39;s &#x60;hotelId&#x60;, accepted so this route reads the same as every other Booking listing-addressed route. The body wins when both are sent. | [optional] |
| **listing_publish_booking_request** | [**ListingPublishBookingRequest**](ListingPublishBookingRequest.md) |  | [optional] |

### Return type

[**ListingPublishBookingResponse**](ListingPublishBookingResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## pull_listing_from_airbnb

> <ListingPullResponse> pull_listing_from_airbnb(id, opts)

Refresh a listing from Airbnb

Re-read this listing from Airbnb and update your stored copy, then report what was refreshed and when. The mirror image of `POST /v1/listings/{id}/publish/airbnb`.  Every other Airbnb read on this API is served from our database. This endpoint is the one that goes and asks Airbnb — use it after a push, to see the values Airbnb actually kept, or when a host has changed something in the Airbnb app.  **What it refreshes:** basic listing facts (property type, bedrooms, beds, bathrooms, capacity), descriptions, photos, rooms and beds, amenities, booking settings (check-in/check-out windows, guest controls, cancellation policy), stay rules (min/max nights, advance-booking window, turnover buffer), pricing settings and standard fees, permits, checkout tasks and the check-in guide. After it returns, those values are what `GET /v1/listings/{id}?include=content,details` and the `/v1/channels/airbnb/**` routes serve.  **What it does NOT refresh:** the calendar (nightly rates and availability — see `GET /v1/channels/airbnb/listings/{id}/availability`), reservations, messages, reviews or payouts. Those arrive continuously through the channel's own sync and never need a manual pull.  **Runs synchronously** — the response is the result, not a job id. Expect several seconds.  **One pull per listing per 15 minutes.** A pull is roughly a dozen Airbnb calls; a second call inside the window returns `429 rate_limit_exceeded` with `Retry-After` and `nextPullAvailableAt`, and makes no Airbnb calls. Two simultaneous calls cannot both run.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
  listing_pull_airbnb_request: Repull::ListingPullAirbnbRequest.new # ListingPullAirbnbRequest | 
}

begin
  # Refresh a listing from Airbnb
  result = api_instance.pull_listing_from_airbnb(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->pull_listing_from_airbnb: #{e}"
end
```

#### Using the pull_listing_from_airbnb_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPullResponse>, Integer, Hash)> pull_listing_from_airbnb_with_http_info(id, opts)

```ruby
begin
  # Refresh a listing from Airbnb
  data, status_code, headers = api_instance.pull_listing_from_airbnb_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPullResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->pull_listing_from_airbnb_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **listing_pull_airbnb_request** | [**ListingPullAirbnbRequest**](ListingPullAirbnbRequest.md) |  | [optional] |

### Return type

[**ListingPullResponse**](ListingPullResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
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


## take_listing_offline

> <ListingMarketStateResponse> take_listing_offline(id, opts)

Take a listing off the market

Stop this listing being sold, on every channel it is connected to, in one call.  What that means differs per channel and you do not have to know which is which. On **Airbnb** the live listing is deactivated with a valid deactivation reason and then READ BACK — Airbnb accepts some deactivations and leaves the listing up, so \"we sent the request\" is never reported as success. On **Booking.com** there is no unlist at all; the equivalent is closing the room's availability across the whole forward window, which is what happens.  **This is not the same as deactivating the listing in Repull.** The two get confused because both sound like removal, and they have opposite consequences:  | | Take offline (this endpoint) | Deactivate in Repull (`PATCH /v1/listings/{id}` `{\"active\": false}`) | |---|---|---| | The guest-facing listing | **Stops taking bookings** | Stays live and keeps taking bookings | | Billing and plan limits | Unchanged | No longer billed, no longer counts toward the cap | | API access to the listing | Unchanged — you can still read and write it | `403 listing_inactive` until reactivated | | Reverse it with | `POST /v1/listings/{id}/online` | `PATCH /v1/listings/{id}` `{\"active\": true}` | | Data kept | Yes | Yes, and it keeps syncing |  Neither one deletes anything, on either side.  **The answer is per channel item.** A listing can sit on several Airbnb connections and a Booking.com property at once; they fail independently and a partial result is the ordinary outcome, so every item reports its own `state`, `code` and `message` and there is no top-level success flag to mislead you. Nothing is rolled back — re-send the same request to retry the items that did not land.  **Booking.com ambiguity is reported, not fanned out.** A listing mapped to more than one active Booking.com property comes back with that item refused (`ambiguous_booking_mapping`) while the Airbnb items still run: closing the wrong property's availability takes real inventory off sale, and taking a listing off Airbnb is not less urgent because its Booking.com mapping is untidy. Name the property with `hotelId` and send it again.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
id = 56 # Integer | Repull listing id.
opts = {
  hotel_id: 'hotel_id_example', # String | Booking.com property to act on, for a listing mapped to more than one. The query-string spelling of the body's `hotelId`; the body wins when both are sent.
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31', # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
  listing_market_state_request: Repull::ListingMarketStateRequest.new # ListingMarketStateRequest | 
}

begin
  # Take a listing off the market
  result = api_instance.take_listing_offline(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->take_listing_offline: #{e}"
end
```

#### Using the take_listing_offline_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingMarketStateResponse>, Integer, Hash)> take_listing_offline_with_http_info(id, opts)

```ruby
begin
  # Take a listing off the market
  data, status_code, headers = api_instance.take_listing_offline_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingMarketStateResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->take_listing_offline_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id. |  |
| **hotel_id** | **String** | Booking.com property to act on, for a listing mapped to more than one. The query-string spelling of the body&#39;s &#x60;hotelId&#x60;; the body wins when both are sent. | [optional] |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |
| **listing_market_state_request** | [**ListingMarketStateRequest**](ListingMarketStateRequest.md) |  | [optional] |

### Return type

[**ListingMarketStateResponse**](ListingMarketStateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## take_listing_online

> <ListingMarketStateResponse> take_listing_online(id, opts)

Put a listing back on the market

Put this listing back on sale, on every channel it is connected to. The counterpart of `POST /v1/listings/{id}/offline`, which documents the per-item response and the difference between this and deactivating a listing in Repull.  **It does not push content.** On **Airbnb** it re-enables sync and makes the listing available again; anything that changed while the listing was down is still unpublished, so follow with `POST /v1/listings/{id}/publish/airbnb` if the content moved. On **Booking.com** it re-syncs the true calendar rather than opening everything: dates that are genuinely blocked — a reservation, an owner stay — stay blocked, and only the closure `offline` wrote lifts. The two directions are not mirror images, and that is deliberate.  **One asymmetry worth planning for.** Taking a listing down passes no billing gate; putting it back up goes through the channel-publish gate. So on a workspace whose subscription has lapsed, `offline` still works and this endpoint answers `402 payment_required` — a listing can be left off the market until billing is sorted out. That refusal is reported as a billing refusal with the action that fixes it, never as a channel error: retrying, or reconnecting the channel, does nothing for it.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
id = 56 # Integer | Repull listing id.
opts = {
  hotel_id: 'hotel_id_example', # String | Booking.com property to act on, for a listing mapped to more than one. The query-string spelling of the body's `hotelId`; the body wins when both are sent.
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31', # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
  listing_market_state_request: Repull::ListingMarketStateRequest.new # ListingMarketStateRequest | 
}

begin
  # Put a listing back on the market
  result = api_instance.take_listing_online(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->take_listing_online: #{e}"
end
```

#### Using the take_listing_online_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingMarketStateResponse>, Integer, Hash)> take_listing_online_with_http_info(id, opts)

```ruby
begin
  # Put a listing back on the market
  data, status_code, headers = api_instance.take_listing_online_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingMarketStateResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->take_listing_online_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id. |  |
| **hotel_id** | **String** | Booking.com property to act on, for a listing mapped to more than one. The query-string spelling of the body&#39;s &#x60;hotelId&#x60;; the body wins when both are sent. | [optional] |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |
| **listing_market_state_request** | [**ListingMarketStateRequest**](ListingMarketStateRequest.md) |  | [optional] |

### Return type

[**ListingMarketStateResponse**](ListingMarketStateResponse.md)

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

> <ListingContentUpdateResponse> update_listing_content(id, listing_content_update_request, opts)

Update canonical listing content

Write your PMS's canonical listing content — title, description, amenities, address, occupancy, and policies — into a Repull listing, making it the source of truth. This is the flagship \"the PMS owns listing content, Repull distributes it\" enabler.  **Partial update:** every field is optional. Only the fields you send are written; absent fields are left untouched. `amenities` is a FULL replacement of the amenity set (omit to leave untouched, send `[]` to clear).  **Multilingual:** send `locale` to say which language this copy is in (`it`, `pt-BR`, …). Canonical content is stored per locale, so each language keeps its own row instead of overwriting the English one. Omit it for English.  **Local write only — NOT a channel publish.** This mutates Repull's own copy of the content. It does NOT push to Airbnb / Booking.com; it marks the channels dirty so a later publish knows what changed. Distribution stays a separate explicit step.  **Photos are deferred:** a provided `photos` array is echoed back in the `deferred` field and NOT persisted (media ingestion is a follow-up).  Cross-tenant access (a listing that belongs to a different workspace) returns 404 — never 403. This endpoint is served even when the account is over the plan-listings cap, since editing content on a listing you already own never grows the portfolio.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

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
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Update canonical listing content
  result = api_instance.update_listing_content(id, listing_content_update_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->update_listing_content: #{e}"
end
```

#### Using the update_listing_content_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingContentUpdateResponse>, Integer, Hash)> update_listing_content_with_http_info(id, listing_content_update_request, opts)

```ruby
begin
  # Update canonical listing content
  data, status_code, headers = api_instance.update_listing_content_with_http_info(id, listing_content_update_request, opts)
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
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**ListingContentUpdateResponse**](ListingContentUpdateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

