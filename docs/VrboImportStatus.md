# Repull::VrboImportStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **Integer** |  | [optional] |
| **state** | **String** |  | [optional] |
| **access_type** | **String** | &#x60;messaging&#x60;: bookings and messages only, the calendar is never pushed. | [optional] |
| **requested_at** | **Time** | When the mapping was confirmed. | [optional] |
| **priority_imported_at** | **Time** | Upcoming bookings and the last 30 days are in. | [optional] |
| **history_completed_at** | **Time** |  | [optional] |
| **history_complete** | **Boolean** | The whole account history is imported. | [optional] |
| **last_synced_at** | **Time** | Last completed sync (Vrbo is read every few minutes and on each Vrbo notification email). | [optional] |
| **conversations_seen** | **Integer** |  | [optional] |
| **conversations_imported** | **Integer** |  | [optional] |
| **reservations** | **Integer** | Bookings imported so far. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::VrboImportStatus.new(
  account_id: null,
  state: null,
  access_type: null,
  requested_at: null,
  priority_imported_at: null,
  history_completed_at: null,
  history_complete: null,
  last_synced_at: null,
  conversations_seen: null,
  conversations_imported: null,
  reservations: null
)
```

