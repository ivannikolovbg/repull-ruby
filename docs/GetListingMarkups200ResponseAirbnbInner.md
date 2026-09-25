# Repull::GetListingMarkups200ResponseAirbnbInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **airbnb_id** | **String** | Airbnb listing id. | [optional] |
| **markup_percent** | **Float** | Percent added to the listing&#39;s price on Airbnb. 35 &#x3D; +35%. &#x60;null&#x60; &#x3D; none. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetListingMarkups200ResponseAirbnbInner.new(
  airbnb_id: null,
  markup_percent: 35
)
```

