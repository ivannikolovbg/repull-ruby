# Repull::TestWebhookRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** |  | [optional] |
| **event_type** | **String** |  | [optional] |
| **signing_secret** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TestWebhookRequest.new(
  url: null,
  event_type: null,
  signing_secret: null
)
```

