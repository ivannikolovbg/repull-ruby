# Repull::QuotesApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_quote**](QuotesApi.md#get_quote) | **GET** /v1/quotes | Price a stay |


## get_quote

> <Quote> get_quote(property_id, check_in, check_out, opts)

Price a stay

Returns the full price breakdown for a stay — nightly total, length-of-stay discount, cleaning fee, pet and other fees, taxes, and the total.  A quote is priced against a booking website, because the markup, custom fees and tax overrides that decide what a guest is actually charged live there. A workspace with no booking site receives `422 quote_unavailable` rather than a number computed from different rules than the ones applied at checkout.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::QuotesApi.new
property_id = 56 # Integer | Repull property id — discover via `GET /v1/properties`.
check_in = Date.parse('2013-10-20') # Date | 
check_out = Date.parse('2013-10-20') # Date | 
opts = {
  guests: 56, # Integer | 
  pets: 56, # Integer | 
  website_id: 56 # Integer | Which booking site to price against. Defaults to the workspace's only site.
}

begin
  # Price a stay
  result = api_instance.get_quote(property_id, check_in, check_out, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling QuotesApi->get_quote: #{e}"
end
```

#### Using the get_quote_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Quote>, Integer, Hash)> get_quote_with_http_info(property_id, check_in, check_out, opts)

```ruby
begin
  # Price a stay
  data, status_code, headers = api_instance.get_quote_with_http_info(property_id, check_in, check_out, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Quote>
rescue Repull::ApiError => e
  puts "Error when calling QuotesApi->get_quote_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **Integer** | Repull property id — discover via &#x60;GET /v1/properties&#x60;. |  |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** |  |  |
| **guests** | **Integer** |  | [optional][default to 1] |
| **pets** | **Integer** |  | [optional][default to 0] |
| **website_id** | **Integer** | Which booking site to price against. Defaults to the workspace&#39;s only site. | [optional] |

### Return type

[**Quote**](Quote.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

