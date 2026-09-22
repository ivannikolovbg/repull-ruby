# Repull::CreateConversationSpecialOffer201ResponseGuests

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total** | **Integer** |  | [optional] |
| **adults** | **Integer** |  | [optional] |
| **children** | **Integer** |  | [optional] |
| **infants** | **Integer** |  | [optional] |
| **pets** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateConversationSpecialOffer201ResponseGuests.new(
  total: 3,
  adults: 2,
  children: 1,
  infants: 0,
  pets: 0
)
```

