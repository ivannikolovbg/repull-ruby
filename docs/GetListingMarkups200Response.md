# Repull::GetListingMarkups200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id. | [optional] |
| **airbnb** | [**Array&lt;GetListingMarkups200ResponseAirbnbInner&gt;**](GetListingMarkups200ResponseAirbnbInner.md) |  | [optional] |
| **booking** | [**Array&lt;GetListingMarkups200ResponseBookingInner&gt;**](GetListingMarkups200ResponseBookingInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetListingMarkups200Response.new(
  id: null,
  airbnb: null,
  booking: null
)
```

