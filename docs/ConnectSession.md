# Repull::ConnectSession

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** |  |  |
| **url** | **String** |  |  |
| **expires_at** | **Time** |  |  |
| **state** | **String** | Echoed back from the request body for SDK consumers that pass an opaque correlation token. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectSession.new(
  session_id: cs_8gQrT2v9k3M4nLp7wJxYzAbCdEfGhIjKlMnOp,
  url: https://connect.repull.dev/cs_8gQrT2v9k3M4nLp7wJxYzAbCdEfGhIjKlMnOp,
  expires_at: null,
  state: null
)
```

