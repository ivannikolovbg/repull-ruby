# Repull::TransactionFees

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **commission** | **Float** | Channel commission deducted. |  |
| **service_fee** | **Float** | Payments service fee deducted. |  |
| **processing_fee** | **Float** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::TransactionFees.new(
  commission: 3340.8,
  service_fee: 334.08,
  processing_fee: null
)
```

