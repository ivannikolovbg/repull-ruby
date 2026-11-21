# Repull::UpdateVrboListingFeesRequestCustomInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **product_code** | **String** | One of the read&#39;s &#x60;customFeeCodes&#x60; (e.g. ADMINISTRATIVE, HOT_TUB, LINENS, PARKING, POOL). |  |
| **amount** | **Float** |  |  |
| **type** | **String** |  | [optional] |
| **taxable** | **Boolean** |  | [optional] |
| **tax_rate** | **Float** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingFeesRequestCustomInner.new(
  product_code: PARKING,
  amount: null,
  type: null,
  taxable: null,
  tax_rate: null
)
```

