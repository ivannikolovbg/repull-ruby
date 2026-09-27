# Repull::CancelReservationRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reason** | **String** | Why it was cancelled; recorded on the reservation (and in the PMS&#39;s notes). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CancelReservationRequest.new(
  reason: null
)
```

