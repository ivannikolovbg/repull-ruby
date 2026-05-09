# Repull::SetKvRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **value** | **Object** | Any JSON-serializable value. Stored verbatim. |  |
| **ttl_seconds** | **Integer** | Optional TTL in seconds. The row&#39;s &#x60;ttl_at&#x60; is set to &#x60;now() + ttl_seconds&#x60;. Past-&#x60;ttl_at&#x60; rows are filtered from reads. Pass a positive integer; &#x60;0&#x60; is rejected. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SetKvRequest.new(
  value: null,
  ttl_seconds: null
)
```

