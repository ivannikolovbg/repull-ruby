# Repull::GetChannelHealth200ResponseVrbo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accounts_connected** | **Integer** |  | [optional] |
| **accounts_signed_out** | **Integer** | Accounts VRBO signed out; &#x60;status&#x60; is &#x60;down&#x60; while any is. | [optional] |
| **inbox_sync_late** | **Integer** | Accounts whose last full inbox sync is older than 30 minutes (it runs every 5). | [optional] |
| **calendar_queue_backlog** | **Integer** | Listings with a calendar push waiting. | [optional] |
| **calendar_oldest_wait_minutes** | **Integer** |  | [optional] |
| **window_hours** | **Integer** | Hours the push failure rate is judged over. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetChannelHealth200ResponseVrbo.new(
  accounts_connected: null,
  accounts_signed_out: null,
  inbox_sync_late: null,
  calendar_queue_backlog: null,
  calendar_oldest_wait_minutes: null,
  window_hours: null
)
```

