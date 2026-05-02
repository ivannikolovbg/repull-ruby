# Repull::MarketMyListing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **name** | **String** |  | [optional] |
| **city** | **String** |  | [optional] |
| **lat** | **Float** |  | [optional] |
| **lng** | **Float** |  | [optional] |
| **thumbnail** | **String** |  | [optional] |
| **today_price** | **Integer** | Pre-computed ADR rounded to integer. | [optional] |
| **blocked** | **Boolean** |  | [optional] |
| **booked_nights** | **Integer** |  | [optional] |
| **available_nights** | **Integer** |  | [optional] |
| **type** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MarketMyListing.new(
  id: null,
  name: null,
  city: null,
  lat: null,
  lng: null,
  thumbnail: null,
  today_price: null,
  blocked: null,
  booked_nights: null,
  available_nights: null,
  type: mine
)
```

