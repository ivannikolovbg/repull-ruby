# Repull::MigrationFailedEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event** | **String** | The event name. This field is &#x60;event&#x60;, not &#x60;type&#x60;. |  |
| **event_id** | **String** | Stable across every delivery and replay of this logical event — dedupe on it. |  |
| **api_version** | **String** |  |  |
| **timestamp** | **Time** | When this delivery was built. |  |
| **account** | [**WebhookEventAccount**](WebhookEventAccount.md) |  | [optional] |
| **workspace_id** | **Integer** | The migration&#39;s workspace — pass it as &#x60;X-Workspace-Id&#x60;, or to &#x60;GET /v1/migrations/{workspaceId}&#x60;. |  |
| **data** | [**MigrationImportPayload**](MigrationImportPayload.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::MigrationFailedEvent.new(
  event: null,
  event_id: null,
  api_version: 2026-04,
  timestamp: null,
  account: null,
  workspace_id: null,
  data: null
)
```

