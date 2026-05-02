# Repull::ListingPricingApplyResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ok** | **Boolean** |  | [optional] |
| **applied** | **Integer** | Number of recommendations applied (apply action only). | [optional] |
| **declined** | **Integer** | Number of dates declined (decline action only). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPricingApplyResponse.new(
  ok: null,
  applied: null,
  declined: null
)
```

