# Repull::ReservationMessageReceivedPayloadFrom

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Who wrote it: &#x60;guest&#x60;, &#x60;booker&#x60;, &#x60;cotraveler&#x60;, or &#x60;airbnb&#x60; (Airbnb Support writing on the thread). | [optional] |
| **name** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageReceivedPayloadFrom.new(
  type: guest,
  name: Alex Morgan
)
```

