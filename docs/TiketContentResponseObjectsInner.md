# Repull::TiketContentResponseObjectsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **kind** | **String** | What the object is. | [optional] |
| **partner_code** | **String** | Repull&#39;s code for the object on tiket.com. | [optional] |
| **listing_id** | **String** |  | [optional] |
| **pushed_at** | **Time** |  | [optional] |
| **echo_token** | **String** | tiket.com&#39;s reference for the push. Quote it to tiket.com support. | [optional] |
| **content** | **Hash&lt;String, Object&gt;** | The content that was sent. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketContentResponseObjectsInner.new(
  kind: null,
  partner_code: null,
  listing_id: null,
  pushed_at: null,
  echo_token: null,
  content: null
)
```

