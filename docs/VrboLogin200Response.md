# Repull::VrboLogin200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **Integer** |  | [optional] |
| **status** | **String** |  | [optional] |
| **reason** | **String** |  | [optional] |
| **error** | **String** |  | [optional] |
| **destination** | **String** |  | [optional] |
| **notification_email** | **String** |  | [optional] |
| **awaiting_mapping** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::VrboLogin200Response.new(
  account_id: null,
  status: null,
  reason: null,
  error: null,
  destination: null,
  notification_email: null,
  awaiting_mapping: null
)
```

