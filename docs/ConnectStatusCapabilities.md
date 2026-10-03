# Repull::ConnectStatusCapabilities

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reservations** | [**ReservationCapabilities**](ReservationCapabilities.md) |  | [optional] |
| **pms** | [**PmsCapabilities**](PmsCapabilities.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectStatusCapabilities.new(
  reservations: null,
  pms: null
)
```

