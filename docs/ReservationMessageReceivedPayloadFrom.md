# Repull::ReservationMessageReceivedPayloadFrom

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Message author (guest, host, system). | [optional] |
| **name** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageReceivedPayloadFrom.new(
  type: guest,
  name: Alex Morgan
)
```

