# Repull::ListingFee

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | &#x60;cleaning&#x60;, &#x60;pet&#x60;, &#x60;linen&#x60;, &#x60;resort&#x60;, &#x60;management&#x60;, &#x60;community&#x60;, or the source&#39;s own kind. | [optional] |
| **name** | **String** |  | [optional] |
| **amount** | **Float** | In the listing currency when &#x60;amountType&#x60; is &#x60;flat&#x60;; a percent when &#x60;percent&#x60;. | [optional] |
| **amount_type** | **String** |  | [optional] |
| **charged_per** | [**ChargePer**](ChargePer.md) |  | [optional] |
| **optional** | **Boolean** | Offered to the guest (an add-on) rather than always charged. | [optional] |
| **source** | **String** | Where it was read from: &#x60;airbnb&#x60;, &#x60;guesty&#x60;, … | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingFee.new(
  type: cleaning,
  name: Damage Waiver,
  amount: 35,
  amount_type: null,
  charged_per: null,
  optional: null,
  source: guesty
)
```

