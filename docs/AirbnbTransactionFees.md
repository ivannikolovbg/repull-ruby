# Repull::AirbnbTransactionFees

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **host_service_fee** | **Float** | Airbnb&#39;s host service fee on this line, as a deduction (negative). Already taken out of &#x60;amount&#x60;. |  |
| **cleaning_fee** | **Float** | Cleaning fee included in this line&#39;s gross. |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbTransactionFees.new(
  host_service_fee: -7.45,
  cleaning_fee: 40.57
)
```

