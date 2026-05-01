# Repull::WebhookSubscription

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **url** | **String** |  | [optional] |
| **events** | **Array&lt;String&gt;** |  | [optional] |
| **active** | **Boolean** |  | [optional] |
| **secret** | **String** | HMAC-SHA256 signing secret | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::WebhookSubscription.new(
  id: null,
  url: null,
  events: [&quot;reservation.created&quot;,&quot;reservation.updated&quot;],
  active: null,
  secret: null
)
```

