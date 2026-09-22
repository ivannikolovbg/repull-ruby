# Repull::CreateAirbnbOfferRequestGuestDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **number_of_guests** | **Integer** |  | [optional] |
| **number_of_adults** | **Integer** |  | [optional] |
| **number_of_children** | **Integer** |  | [optional] |
| **number_of_infants** | **Integer** |  | [optional] |
| **number_of_pets** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateAirbnbOfferRequestGuestDetails.new(
  number_of_guests: 3,
  number_of_adults: 2,
  number_of_children: 1,
  number_of_infants: 0,
  number_of_pets: 0
)
```

