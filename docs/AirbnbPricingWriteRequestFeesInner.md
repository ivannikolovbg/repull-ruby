# Repull::AirbnbPricingWriteRequestFeesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **fee_type** | **String** | Airbnb fee type: &#x60;PASS_THROUGH_CLEANING_FEE&#x60;, &#x60;PASS_THROUGH_SHORT_TERM_CLEANING_FEE&#x60;, &#x60;PASS_THROUGH_PET_FEE&#x60;, &#x60;PASS_THROUGH_SECURITY_DEPOSIT&#x60;, &#x60;PASS_THROUGH_MANAGEMENT_FEE&#x60;, &#x60;PASS_THROUGH_RESORT_FEE&#x60;, &#x60;PASS_THROUGH_COMMUNITY_FEE&#x60;, &#x60;PASS_THROUGH_LINEN_FEE&#x60;. |  |
| **amount** | **Float** | &#x60;null&#x60; removes the fee. Flat: currency × 1,000,000. Percent: whole percent. |  |
| **amount_type** | **String** | Defaults to the existing fee&#39;s, else &#x60;flat&#x60;. Percent is accepted for management and resort fees. | [optional] |
| **charge_type** | **String** | Who it is charged per. Defaults to the existing fee&#39;s, else &#x60;PER_GROUP&#x60;. | [optional] |
| **charge_period** | **String** | Once per booking or per night. Defaults to the existing fee&#39;s, else &#x60;PER_BOOKING&#x60;. | [optional] |
| **offline** | **Boolean** | Collected offline by the host rather than through Airbnb. Default &#x60;false&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbPricingWriteRequestFeesInner.new(
  fee_type: PASS_THROUGH_MANAGEMENT_FEE,
  amount: 10,
  amount_type: null,
  charge_type: null,
  charge_period: null,
  offline: null
)
```

