# Repull::BookingSetupRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** |  |  |
| **property_id** | **String** | Booking.com property id — required for readiness/open/contacts/policies actions. | [optional] |
| **leid** | **Integer** | Legal entity id — required for &#x60;check-legal-status&#x60;. | [optional] |
| **contacts** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | Contacts payload for &#x60;set-contacts&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingSetupRequest.new(
  action: null,
  property_id: null,
  leid: null,
  contacts: null
)
```

