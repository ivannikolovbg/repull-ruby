# Repull::UsageQuotaWarningPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scope** | **String** | Which quota this warning is about. | [optional] |
| **window_key** | **String** | The window the warning covers — the UTC date when scope is \&quot;daily_requests\&quot;. Stable dedupe key. | [optional] |
| **tier** | **String** |  | [optional] |
| **used** | **Integer** |  | [optional] |
| **limit** | **Integer** |  | [optional] |
| **percent_used** | **Integer** |  | [optional] |
| **remaining** | **Integer** |  | [optional] |
| **resets_at** | **Time** | When the window resets and the counter returns to zero. | [optional] |
| **top_operation** | [**UsageQuotaWarningPayloadTopOperation**](UsageQuotaWarningPayloadTopOperation.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UsageQuotaWarningPayload.new(
  scope: daily_requests,
  window_key: 2026-05-01,
  tier: starter,
  used: 20000,
  limit: 25000,
  percent_used: 80,
  remaining: 5000,
  resets_at: 2026-05-02T00:00Z,
  top_operation: null
)
```

