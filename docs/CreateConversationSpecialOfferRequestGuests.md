# Repull::CreateConversationSpecialOfferRequestGuests

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **adults** | **Integer** |  |  |
| **children** | **Integer** |  | [optional][default to 0] |
| **infants** | **Integer** |  | [optional][default to 0] |
| **pets** | **Integer** |  | [optional][default to 0] |

## Example

```ruby
require 'repull'

instance = Repull::CreateConversationSpecialOfferRequestGuests.new(
  adults: 2,
  children: null,
  infants: null,
  pets: null
)
```

