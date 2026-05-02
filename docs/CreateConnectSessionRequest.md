# Repull::CreateConnectSessionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **redirect_url** | **String** | Where to send the user after they finish (or cancel). Status query params are appended. |  |
| **state** | **String** | Opaque pass-through correlation token. Echoed back in the response. | [optional] |
| **allowed_providers** | **Array&lt;String&gt;** | Optional whitelist of provider IDs the picker should expose. Omit to show every channel in the registry. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateConnectSessionRequest.new(
  redirect_url: null,
  state: null,
  allowed_providers: null
)
```

