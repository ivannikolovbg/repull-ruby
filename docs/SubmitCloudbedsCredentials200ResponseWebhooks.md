# Repull::SubmitCloudbedsCredentials200ResponseWebhooks

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **registered** | **Integer** | Webhook subscriptions created at the PMS (Cloudbeds). Mews webhooks are enabled once per integration by Mews, so this is 0 there. | [optional] |
| **error** | **String** | Why subscribing failed, if it did. The connection still syncs by polling. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitCloudbedsCredentials200ResponseWebhooks.new(
  registered: null,
  error: null
)
```

