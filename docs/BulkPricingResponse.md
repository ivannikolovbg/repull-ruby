# Repull::BulkPricingResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **processed** | **Integer** | Total dates attempted across every item. | [optional] |
| **succeeded** | **Integer** | Total dates that were successfully applied (or declined). | [optional] |
| **failed** | [**Array&lt;BulkPricingFailure&gt;**](BulkPricingFailure.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BulkPricingResponse.new(
  processed: null,
  succeeded: null,
  failed: null
)
```

