# Repull::AtlasApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_listing_segments**](AtlasApi.md#get_listing_segments) | **GET** /v1/listings/{id}/segments | Atlas DNA segment intelligence for a listing |
| [**list_listing_comps**](AtlasApi.md#list_listing_comps) | **GET** /v1/listings/{id}/comps | Comp set for a listing (with daily nightly pricing) |


## get_listing_segments

> <ListingSegmentsResponse> get_listing_segments(id, opts)

Atlas DNA segment intelligence for a listing

Aggregates Atlas DNA segment signal (quality tier, design style, bedrooms) across the listing's geographic neighborhood (default: 5km radius) or the whole city, so consumers can answer: - What segments dominate my market? - Which segment does my listing match best? - What's the ADR uplift for moving up a tier?  DNA coverage is still ramping — segments are scored asynchronously. Cities and radii without scored comps return `totalCompsAnalyzed: 0` plus a `low_dna_coverage` recommendation rather than fabricated data.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AtlasApi.new
id = 56 # Integer | 
opts = {
  level: 'comp_set', # String | `comp_set` (default) restricts to a `radius_km` bbox. `market` aggregates across the whole city.
  radius_km: 8.14 # Float | Only used when `level=comp_set`.
}

begin
  # Atlas DNA segment intelligence for a listing
  result = api_instance.get_listing_segments(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AtlasApi->get_listing_segments: #{e}"
end
```

#### Using the get_listing_segments_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingSegmentsResponse>, Integer, Hash)> get_listing_segments_with_http_info(id, opts)

```ruby
begin
  # Atlas DNA segment intelligence for a listing
  data, status_code, headers = api_instance.get_listing_segments_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingSegmentsResponse>
rescue Repull::ApiError => e
  puts "Error when calling AtlasApi->get_listing_segments_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **level** | **String** | &#x60;comp_set&#x60; (default) restricts to a &#x60;radius_km&#x60; bbox. &#x60;market&#x60; aggregates across the whole city. | [optional][default to &#39;comp_set&#39;] |
| **radius_km** | **Float** | Only used when &#x60;level&#x3D;comp_set&#x60;. | [optional][default to 5] |

### Return type

[**ListingSegmentsResponse**](ListingSegmentsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_listing_comps

> <ListingCompsResponse> list_listing_comps(id, opts)

Comp set for a listing (with daily nightly pricing)

Returns the actual comp set for a listing — the underlying competitor listings (with daily nightly pricing), not just the aggregated `compSummary` from `/pricing`. Each comp comes back with distance, bedrooms, ratings, lat/lng, platform link, and a per-day rate/availability series for the requested window.  Powered by Atlas. Comps with no coordinates are excluded — there's no way to rank them by distance. Listings without coordinates return `data: []` and a `warning` field.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AtlasApi.new
id = 56 # Integer | 
opts = {
  radius_km: 8.14, # Float | Bbox + haversine on lat/lng. Default 5, max 50.
  limit: 56, # Integer | Closest-first. Max 100.
  start_date: Date.parse('2013-10-20'), # Date | Defaults to today.
  end_date: Date.parse('2013-10-20') # Date | Defaults to today + 30 days.
}

begin
  # Comp set for a listing (with daily nightly pricing)
  result = api_instance.list_listing_comps(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AtlasApi->list_listing_comps: #{e}"
end
```

#### Using the list_listing_comps_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingCompsResponse>, Integer, Hash)> list_listing_comps_with_http_info(id, opts)

```ruby
begin
  # Comp set for a listing (with daily nightly pricing)
  data, status_code, headers = api_instance.list_listing_comps_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingCompsResponse>
rescue Repull::ApiError => e
  puts "Error when calling AtlasApi->list_listing_comps_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **radius_km** | **Float** | Bbox + haversine on lat/lng. Default 5, max 50. | [optional][default to 5] |
| **limit** | **Integer** | Closest-first. Max 100. | [optional][default to 20] |
| **start_date** | **Date** | Defaults to today. | [optional] |
| **end_date** | **Date** | Defaults to today + 30 days. | [optional] |

### Return type

[**ListingCompsResponse**](ListingCompsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

