# Repull::BulkPricingRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** | &#x60;apply&#x60; writes the recommended price to each listing&#39;s calendar and fans out to channels (Airbnb/Booking/VRBO). &#x60;decline&#x60; marks the recommendations as &#x60;declined&#x60; so they stop surfacing. |  |
| **items** | [**Array&lt;BulkPricingItem&gt;**](BulkPricingItem.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::BulkPricingRequest.new(
  action: null,
  items: null
)
```

