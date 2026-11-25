# Repull::VerifyTiketClaimRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** |  |  |
| **hotel_id** | **String** | tiket.com Hotel ID. |  |
| **name** | **String** | Optional property name to show until tiket.com&#39;s is read. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::VerifyTiketClaimRequest.new(
  session_id: null,
  hotel_id: null,
  name: null
)
```

