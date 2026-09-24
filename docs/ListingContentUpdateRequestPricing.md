# Repull::ListingContentUpdateRequestPricing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **default_daily_price** | **Float** | Nightly rate for every night that is not a weekend night. | [optional] |
| **weekend_price** | **Float** | Nightly rate for Saturday and Sunday nights (UTC). | [optional] |
| **cleaning_fee** | **Float** |  | [optional] |
| **price_per_extra_guest** | **Float** |  | [optional] |
| **security_deposit** | **Float** |  | [optional] |
| **weekly_discount** | **Float** | A percentage, not a fraction: &#x60;10&#x60; is 10% off a stay of a week or more. A value between 0 and 1 is refused (it would publish as a fraction of one percent) — send &#x60;10&#x60;, not &#x60;0.1&#x60;. &#x60;0&#x60; clears it. | [optional] |
| **monthly_discount** | **Float** | A percentage, not a fraction: &#x60;20&#x60; is 20% off a stay of 28 nights or more. Values between 0 and 1 are refused, as for &#x60;weeklyDiscount&#x60;. | [optional] |
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

