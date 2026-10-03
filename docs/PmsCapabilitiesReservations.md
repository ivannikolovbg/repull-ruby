# Repull::PmsCapabilitiesReservations

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **respond** | **Boolean** | &#x60;POST /v1/reservations/{id}/accept|decline&#x60; on requests this PMS relays. | [optional] |
| **preapprove** | **Boolean** | &#x60;POST /v1/conversations/{id}/pre-approval&#x60; on inquiries this PMS relays. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PmsCapabilitiesReservations.new(
  respond: null,
  preapprove: null
)
```

