# Repull::ListingPricingSettings

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **currency** | **String** |  | [optional] |
| **base_price** | **Float** | Default nightly rate. | [optional] |
| **weekend_price** | **Float** |  | [optional] |
| **cleaning_fee** | **Float** |  | [optional] |
| **extra_guest_fee** | **Float** | Per extra guest per night, above &#x60;guestsIncluded&#x60;. | [optional] |
| **guests_included** | **Integer** |  | [optional] |
| **security_deposit** | **Float** |  | [optional] |
| **weekly_discount_percent** | **Float** | Percent off for 7+ nights: &#x60;10&#x60; is 10%. | [optional] |
| **monthly_discount_percent** | **Float** | Percent off for 28+ nights. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPricingSettings.new(
  currency: GBP,
  base_price: null,
  weekend_price: null,
  cleaning_fee: null,
  extra_guest_fee: null,
  guests_included: null,
  security_deposit: null,
  weekly_discount_percent: null,
  monthly_discount_percent: null
)
```

