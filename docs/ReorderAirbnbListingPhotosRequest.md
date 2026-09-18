# Repull::ReorderAirbnbListingPhotosRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **photo_ids** | **Array&lt;String&gt;** | Airbnb photo ids (&#x60;photoAirbnbId&#x60; from &#x60;GET /photos&#x60;) in display order, first photo first. No duplicates; every id must be on this listing. |  |

## Example

```ruby
require 'repull'

instance = Repull::ReorderAirbnbListingPhotosRequest.new(
  photo_ids: null
)
```

