# Repull::HospitableWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** | The webhook URL to paste into Hospitable. Unique to this connection. |  |
| **status** | **String** | &#x60;not_configured&#x60;: no delivery yet (the host has not added the URL). &#x60;receiving&#x60;: a delivery arrived in the last 24 hours. &#x60;stale&#x60;: deliveries arrived before, none in the last 24 hours. |  |
| **last_received_at** | **Time** | When the last verified delivery arrived; &#x60;null&#x60; before the first. |  |
| **events** | **Array&lt;String&gt;** | The webhook types to tick in Hospitable. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::HospitableWebhook.new(
  url: https://api.repull.dev/webhooks/pms/hospitable?token&#x3D;4f9c2a7e1b3d5f60a8c9e2b4d6f8a0c1,
  status: receiving,
  last_received_at: null,
  events: [&quot;Reservations&quot;,&quot;Messages&quot;,&quot;Properties&quot;,&quot;Reviews&quot;]
)
```

