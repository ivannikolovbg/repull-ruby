# Repull::ListingAddress

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **street** | **String** | Street line as stored on the listing. Kept for existing integrations; same value as &#x60;line1&#x60; unless the listing has no street of its own. | [optional] |
| **line1** | **String** | Street address: number and street. | [optional] |
| **line2** | **String** | Apartment, unit, suite or building. | [optional] |
| **city** | **String** |  | [optional] |
| **state** | **String** | State, province or region. | [optional] |
| **postal_code** | **String** | Postal or ZIP code. | [optional] |
| **country_code** | **String** | ISO 3166-1 alpha-2 country code. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingAddress.new(
  street: 2700 Northwest 2nd Avenue,
  line1: 2700 Northwest 2nd Avenue,
  line2: Unit 241,
  city: Miami,
  state: FL,
  postal_code: 33127,
  country_code: US
)
```

