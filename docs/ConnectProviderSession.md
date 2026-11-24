# Repull::ConnectProviderSession

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** | The hosted page to send the user to. |  |
| **provider** | **String** |  |  |
| **session_id** | **String** | Also sent back on the redirect (&#x60;sessionId&#x3D;&#x60;), in the popup message and in &#x60;connect.session.completed&#x60;. |  |
| **expires_at** | **Time** |  |  |
| **state** | **String** | Your &#x60;state&#x60; from the request, echoed; &#x60;null&#x60; when you sent none. | [optional] |
| **workspace_id** | **String** | PriceLabs only, when the request opened a sub-workspace (&#x60;workspace.name&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectProviderSession.new(
  url: https://connect.repull.dev/cs_8gQrT2v9k3M4nLp7wJxYzAbCdEfGhIjKlMnOp,
  provider: airbnb,
  session_id: cs_8gQrT2v9k3M4nLp7wJxYzAbCdEfGhIjKlMnOp,
  expires_at: null,
  state: null,
  workspace_id: 1204
)
```

