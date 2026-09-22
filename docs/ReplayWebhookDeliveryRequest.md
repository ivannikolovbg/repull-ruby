# Repull::ReplayWebhookDeliveryRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **force** | **Boolean** | Replay even though this delivery already succeeded. Still counts against the 3-per-hour limit. | [optional][default to false] |

## Example

```ruby
require 'repull'

instance = Repull::ReplayWebhookDeliveryRequest.new(
  force: null
)
```

