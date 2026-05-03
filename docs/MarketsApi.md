# Repull::MarketsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_market**](MarketsApi.md#get_market) | **GET** /v1/markets/{city} | Deep-dive on a single market |
| [**get_market_calendar**](MarketsApi.md#get_market_calendar) | **GET** /v1/markets/{city}/calendar | Calendar-level market view |
| [**list_market_browse**](MarketsApi.md#list_market_browse) | **GET** /v1/markets/browse | Paginated discovery catalog |
| [**list_markets**](MarketsApi.md#list_markets) | **GET** /v1/markets | List markets the customer operates in |


## get_market

> <MarketDetailResponse> get_market(city, opts)

Deep-dive on a single market

Detailed market view for one city — price distribution, bedroom mix, property types, upcoming events, Wheelhouse demand, monthly benchmarks, customer health rollup, top comps (proximity-sorted, paginated), customer's percentile position, capacity-mix gap, and a 6-month supply trend.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::MarketsApi.new
city = 'city_example' # String | URL-encoded city name (e.g. `Radium%20Hot%20Springs`).
opts = {
  comps_page: 56 # Integer | 1-indexed page number for the `topComps` slice.
}

begin
  # Deep-dive on a single market
  result = api_instance.get_market(city, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling MarketsApi->get_market: #{e}"
end
```

#### Using the get_market_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MarketDetailResponse>, Integer, Hash)> get_market_with_http_info(city, opts)

```ruby
begin
  # Deep-dive on a single market
  data, status_code, headers = api_instance.get_market_with_http_info(city, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MarketDetailResponse>
rescue Repull::ApiError => e
  puts "Error when calling MarketsApi->get_market_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **city** | **String** | URL-encoded city name (e.g. &#x60;Radium%20Hot%20Springs&#x60;). |  |
| **comps_page** | **Integer** | 1-indexed page number for the &#x60;topComps&#x60; slice. | [optional][default to 1] |

### Return type

[**MarketDetailResponse**](MarketDetailResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_market_calendar

> <MarketCalendarResponse> get_market_calendar(city, opts)

Calendar-level market view

Date-by-date market view for a city — market avg / min / max nightly rate, occupancy %, Wheelhouse demand, events touching the date, and (when `listingId` is supplied) an overlay of the customer's own pricing + availability.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::MarketsApi.new
city = 'city_example' # String | 
opts = {
  start_date: Date.parse('2013-10-20'), # Date | Defaults to today.
  end_date: Date.parse('2013-10-20'), # Date | Defaults to today + 365 days.
  listing_id: 56 # Integer | Optional — overlays the customer's own pricing/availability for direct comparison. Bypasses the upstream cache.
}

begin
  # Calendar-level market view
  result = api_instance.get_market_calendar(city, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling MarketsApi->get_market_calendar: #{e}"
end
```

#### Using the get_market_calendar_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MarketCalendarResponse>, Integer, Hash)> get_market_calendar_with_http_info(city, opts)

```ruby
begin
  # Calendar-level market view
  data, status_code, headers = api_instance.get_market_calendar_with_http_info(city, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MarketCalendarResponse>
rescue Repull::ApiError => e
  puts "Error when calling MarketsApi->get_market_calendar_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **city** | **String** |  |  |
| **start_date** | **Date** | Defaults to today. | [optional] |
| **end_date** | **Date** | Defaults to today + 365 days. | [optional] |
| **listing_id** | **Integer** | Optional — overlays the customer&#39;s own pricing/availability for direct comparison. Bypasses the upstream cache. | [optional] |

### Return type

[**MarketCalendarResponse**](MarketCalendarResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_market_browse

> <MarketBrowseResponse> list_market_browse(opts)

Paginated discovery catalog

Cursor-paginated, search-filterable catalog of every Atlas-tracked market the customer could expand into. Backed by the precomputed `market_summaries` table (>=5 active comps per city). Supports fuzzy `q` substring search (trigram-indexed), `country` (ISO 3166-1 alpha-2) filter, and `sort` (`listings_desc` | `name_asc`). Use the `nextCursor` from `pagination` to walk pages — the cursor is an opaque base64 token; do not parse it.  `pagination.total` is the count of markets matching the current `q`/`country`/`min_listings` filter (across all pages). Renamed from the upstream's legacy `total_in_filter` so SDK consumers see the same `pagination.total` field as on every other list endpoint.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::MarketsApi.new
opts = {
  q: 'q_example', # String | Substring match on city name (case-insensitive).
  country: 'country_example', # String | ISO 3166-1 alpha-2 (e.g. `US`, `ES`).
  min_listings: 56, # Integer | Minimum comp-set size — cities with fewer active comps are excluded.
  cursor: 'cursor_example', # String | Opaque cursor returned by the previous page's `pagination.nextCursor`.
  limit: 56, # Integer | 
  sort: 'listings_desc' # String | 
}

begin
  # Paginated discovery catalog
  result = api_instance.list_market_browse(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling MarketsApi->list_market_browse: #{e}"
end
```

#### Using the list_market_browse_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MarketBrowseResponse>, Integer, Hash)> list_market_browse_with_http_info(opts)

```ruby
begin
  # Paginated discovery catalog
  data, status_code, headers = api_instance.list_market_browse_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MarketBrowseResponse>
rescue Repull::ApiError => e
  puts "Error when calling MarketsApi->list_market_browse_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **q** | **String** | Substring match on city name (case-insensitive). | [optional] |
| **country** | **String** | ISO 3166-1 alpha-2 (e.g. &#x60;US&#x60;, &#x60;ES&#x60;). | [optional] |
| **min_listings** | **Integer** | Minimum comp-set size — cities with fewer active comps are excluded. | [optional][default to 5] |
| **cursor** | **String** | Opaque cursor returned by the previous page&#39;s &#x60;pagination.nextCursor&#x60;. | [optional] |
| **limit** | **Integer** |  | [optional][default to 30] |
| **sort** | **String** |  | [optional][default to &#39;listings_desc&#39;] |

### Return type

[**MarketBrowseResponse**](MarketBrowseResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_markets

> <MarketsOverviewResponse> list_markets

List markets the customer operates in

Returns per-city KPIs across every market the authenticated customer has listings in (market share, ADR vs market, occupancy, ratings) plus a lightweight `browse` discovery summary (top-50 featured markets, country categories, total catalog size). For the full paginated discovery catalog with search, call `GET /v1/markets/browse`. Each `markets[]` entry is enriched with `subscribed` + `source` from the customer's market subscriptions.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::MarketsApi.new

begin
  # List markets the customer operates in
  result = api_instance.list_markets
  p result
rescue Repull::ApiError => e
  puts "Error when calling MarketsApi->list_markets: #{e}"
end
```

#### Using the list_markets_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MarketsOverviewResponse>, Integer, Hash)> list_markets_with_http_info

```ruby
begin
  # List markets the customer operates in
  data, status_code, headers = api_instance.list_markets_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MarketsOverviewResponse>
rescue Repull::ApiError => e
  puts "Error when calling MarketsApi->list_markets_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**MarketsOverviewResponse**](MarketsOverviewResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

