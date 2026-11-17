# Repull::AccountNotificationsMissingPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **Integer** |  |  |
| **provider** | **String** |  |  |
| **account_id** | **String** | Vrbo&#39;s account number (&#x60;accounts[].externalAccountId&#x60; on &#x60;GET /v1/connect/vrbo-login&#x60;). |  |
| **connection_id** | **Integer** | The workspace&#39;s Vrbo connection record. |  |
| **notifications** | [**VrboNotifications**](VrboNotifications.md) |  |  |
| **detected_at** | **Time** |  |  |
| **docs_url** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AccountNotificationsMissingPayload.new(
  workspace_id: null,
  provider: null,
  account_id: null,
  connection_id: null,
  notifications: null,
  detected_at: null,
  docs_url: https://repull.dev/docs/channels/vrbo/notifications
)
```

