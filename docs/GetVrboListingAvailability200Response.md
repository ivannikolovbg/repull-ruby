# Repull::GetVrboListingAvailability200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**GetVrboListingAvailability200ResponseData**](GetVrboListingAvailability200ResponseData.md) |  | [optional] |
| **range** | [**GetVrboListingAvailability200ResponseRange**](GetVrboListingAvailability200ResponseRange.md) |  | [optional] |
| **warning** | **String** | Set when Vrbo did not return the bookings and blocks for the range. | [optional] |
| **data_freshness** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **vrbo_listing_number** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingAvailability200Response.new(
  data: null,
  range: null,
  warning: null,
  data_freshness: null,
  vrbo_listing_number: null
)
```

