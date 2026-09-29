# Repull::PmsWritePolicyCalendar

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **availability** | **Boolean** | Open and close nights. Off also means the PMS&#39;s bookings never block the calendar on other channels. |  |
| **rates** | **Boolean** | Nightly prices. |  |
| **restrictions** | **Boolean** | Minimum stay and other stay restrictions. |  |

## Example

```ruby
require 'repull'

instance = Repull::PmsWritePolicyCalendar.new(
  availability: null,
  rates: null,
  restrictions: null
)
```

