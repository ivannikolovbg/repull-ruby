# Repull::VrboCalendarAccess

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **managed_by** | **String** | &#x60;integrated_software&#x60;: Vrbo says connected software (such as a PMS) manages the calendar. &#x60;null&#x60;: Repull may manage it. |  |
| **detected_at** | **Time** | When &#x60;managedBy&#x60; was first seen. &#x60;null&#x60; when not managed. |  |
| **checked_at** | **Time** | When Vrbo was last asked. &#x60;null&#x60; until the first check. |  |
| **docs_url** | **String** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::VrboCalendarAccess.new(
  managed_by: null,
  detected_at: null,
  checked_at: null,
  docs_url: https://repull.dev/docs/channels/vrbo/calendar-managed-elsewhere
)
```

