# Repull::VrboNotifications

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **state** | **String** | &#x60;active&#x60;: notifications arrive for this account&#39;s guest messages. &#x60;missing&#x60;: Repull found new guest messages and no notification came for them — ask the host to add &#x60;address&#x60; on Vrbo (or turn its notifications back on). &#x60;unknown&#x60;: no guest messages yet to judge by. |  |
| **last_received_at** | **Time** | When the last Vrbo notification reached &#x60;address&#x60;. &#x60;null&#x60; when none ever has. |  |
| **address** | **String** | The address the host adds on Vrbo as a secondary email, with message and reservation notifications on. |  |

## Example

```ruby
require 'repull'

instance = Repull::VrboNotifications.new(
  state: null,
  last_received_at: null,
  address: in+vrbo-1234-321@repull.dev
)
```

