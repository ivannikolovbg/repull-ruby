# Repull::ReservationMessageSentPayloadFrom

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | &#x60;host&#x60; or &#x60;co-host&#x60;. | [optional] |
| **name** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageSentPayloadFrom.new(
  type: host,
  name: null
)
```

