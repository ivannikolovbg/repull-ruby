# Repull::ChannelDegradedPayloadObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **customer_id** | **Integer** |  |  |
| **provider** | **String** |  |  |
| **external_account_id** | **String** | The provider&#39;s own account, host or hotel id. | [optional] |
| **status** | **String** |  |  |
| **detail** | **String** | What we observed, in the provider&#39;s words where possible. A bare \&quot;degraded\&quot; tells nobody what to fix. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ChannelDegradedPayloadObject.new(
  customer_id: null,
  provider: booking,
  external_account_id: null,
  status: null,
  detail: null
)
```

