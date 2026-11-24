# Repull::SubmitHospitableCredentials200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ok** | **Boolean** |  | [optional] |
| **account_info** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **webhook** | [**HospitableWebhook**](HospitableWebhook.md) | The webhook URL to show the host: in Hospitable, Apps → Webhooks → + Add new, paste it, tick Reservations, Messages, Properties and Reviews. Optional — without it the connection is polled every minute. &#x60;null&#x60; if it could not be set up. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitHospitableCredentials200Response.new(
  ok: null,
  account_info: null,
  webhook: null
)
```

