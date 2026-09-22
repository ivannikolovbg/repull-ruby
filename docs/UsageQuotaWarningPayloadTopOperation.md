# Repull::UsageQuotaWarningPayloadTopOperation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **operation_id** | **String** |  | [optional] |
| **request_count** | **Integer** |  | [optional] |
| **share_percent** | **Float** | Share of the window&#39;s requests, 0-100. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UsageQuotaWarningPayloadTopOperation.new(
  operation_id: replay_webhook_delivery,
  request_count: 17000,
  share_percent: 85
)
```

