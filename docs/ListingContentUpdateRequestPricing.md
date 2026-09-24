# Repull::ListingContentUpdateRequestPricing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **default_daily_price** | **Float** | Nightly rate for every night that is not a weekend night. | [optional] |
| **weekend_price** | **Float** | Nightly rate for Saturday and Sunday nights (UTC). | [optional] |
| **cleaning_fee** | **Float** |  | [optional] |
| **price_per_extra_guest** | **Float** |  | [optional] |
| **security_deposit** | **Float** |  | [optional] |
| **weekly_discount** | **Float** | Fraction, not a percentage: &#x60;0.1&#x60; is 10% off a stay of a week or more. | [optional] |
| **monthly_discount** | **Float** | Fraction, not a percentage. | [optional] |
| **guests_included** | **Integer** | Guests covered by the nightly rate before &#x60;pricePerExtraGuest&#x60; applies. | [optional] |
| **currency** | **String** | ISO 4217, e.g. &#x60;USD&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingContentUpdateRequestPricing.new(
  default_daily_price: null,
  weekend_price: null,
  cleaning_fee: null,
  price_per_extra_guest: null,
  security_deposit: null,
  weekly_discount: null,
  monthly_discount: null,
  guests_included: null,
  currency: null
)
```

