# Repull::PmsWritePolicyReservations

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **website** | **Boolean** | Create bookings from booking websites. |  |
| **dashboard** | **Boolean** | Change and cancel bookings from the dashboard. |  |
| **api** | **Boolean** | Create, change and cancel bookings through the reservations API. |  |

## Example

```ruby
require 'repull'

instance = Repull::PmsWritePolicyReservations.new(
  website: null,
  dashboard: null,
  api: null
)
```

