# Repull::AccountCalendarAccessChangedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **Integer** |  |  |
| **provider** | **String** |  |  |
| **account_id** | **String** | Vrbo&#39;s account number (&#x60;accounts[].externalAccountId&#x60; on &#x60;GET /v1/connect/vrbo-login&#x60;). |  |
| **connection_id** | **Integer** | The workspace&#39;s Vrbo connection record. |  |
| **calendar** | [**VrboCalendarAccess**](VrboCalendarAccess.md) |  |  |
| **changed_at** | **Time** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::AccountCalendarAccessChangedPayload.new(
  workspace_id: null,
  provider: null,
  account_id: null,
  connection_id: null,
  calendar: null,
  changed_at: null
)
```

