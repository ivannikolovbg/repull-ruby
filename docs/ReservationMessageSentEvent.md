# Repull::ReservationMessageSentEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event** | **String** | The event name. This field is &#x60;event&#x60;, not &#x60;type&#x60;. |  |
| **event_id** | **String** | Stable across every delivery and replay of this logical event — dedupe on it. |  |
| **api_version** | **String** |  |  |
| **timestamp** | **Time** | When this delivery was built. |  |
| **account** | [**WebhookEventAccount**](WebhookEventAccount.md) |  | [optional] |
| **workspace_id** | **Integer** | The sub-workspace this event happened in. Present only on events from a sub-workspace your workspace opened (&#x60;POST /v1/connect&#x60; with &#x60;workspace&#x60;, or Repull Migrate); omitted on your own workspace&#39;s events. It is the same workspace as &#x60;workspaceId&#x60; on &#x60;POST /v1/connect&#x60; and &#x60;GET /v1/workspaces&#x60; and the &#x60;X-Workspace-Id&#x60; header, but those return it as a string (&#x60;\&quot;2042\&quot;&#x60;) while the event carries a JSON number (&#x60;2042&#x60;): compare as strings, e.g. &#x60;String(event.workspaceId) &#x3D;&#x3D;&#x3D; workspace.workspaceId&#x60;. The UUID &#x60;data.workspaceId&#x60; on &#x60;account.created&#x60; / &#x60;account.disconnected&#x60; is a different identifier. | [optional] |
| **data** | [**ReservationMessageSentPayload**](ReservationMessageSentPayload.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageSentEvent.new(
  event: null,
  event_id: null,
  api_version: 2026-04,
  timestamp: null,
  account: null,
  workspace_id: 2042,
  data: null
)
```

