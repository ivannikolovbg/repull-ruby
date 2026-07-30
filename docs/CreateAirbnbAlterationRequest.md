# Repull::CreateAirbnbAlterationRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **confirmation_code** | **String** | Airbnb confirmation code of the reservation to alter. |  |
| **check_in** | **Date** | New check-in date (YYYY-MM-DD). | [optional] |
| **check_out** | **Date** | New check-out date (YYYY-MM-DD). | [optional] |
| **number_of_guests** | **Integer** | New guest count. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateAirbnbAlterationRequest.new(
  confirmation_code: null,
  check_in: null,
  check_out: null,
  number_of_guests: null
)
```

