# Repull::AirbnbListingListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;AirbnbListing&gt;**](AirbnbListing.md) |  |  |
| **pagination** | [**Pagination**](Pagination.md) |  |  |
| **data_freshness** | [**AirbnbDataFreshness**](AirbnbDataFreshness.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbListingListResponse.new(
  data: null,
  pagination: null,
  data_freshness: null
)
```

