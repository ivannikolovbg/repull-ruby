# Repull::PostalAddress

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **line1** | **String** | Street address: number and street. |  |
| **line2** | **String** | Apartment, unit, suite or building. |  |
| **city** | **String** |  |  |
| **state** | **String** | State, province or region. |  |
| **postal_code** | **String** | Postal or ZIP code. |  |
| **country_code** | **String** | ISO 3166-1 alpha-2 country code. |  |

## Example

```ruby
require 'repull'

instance = Repull::PostalAddress.new(
  line1: 2700 Northwest 2nd Avenue,
  line2: Unit 241,
  city: Miami,
  state: FL,
  postal_code: 33127,
  country_code: US
)
```

