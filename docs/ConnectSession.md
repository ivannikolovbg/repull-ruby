# Repull::ConnectSession

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** |  |  |
| **url** | **String** |  |  |
| **expires_at** | **Time** |  |  |
| **state** | **String** | Echoed back from the request body for SDK consumers that pass an opaque correlation token. | [optional] |
| **purpose** | **String** | Present only on a Repull Migrate session. | [optional] |
| **workspace_id** | **String** | Repull Migrate only: the workspace the property manager&#39;s data lands in. Read it with &#x60;X-Workspace-Id&#x60;, track it with &#x60;GET /v1/migrations/{workspaceId}&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectSession.new(
  session_id: cs_8gQrT2v9k3M4nLp7wJxYzAbCdEfGhIjKlMnOp,
  url: https://connect.repull.dev/cs_8gQrT2v9k3M4nLp7wJxYzAbCdEfGhIjKlMnOp,
  expires_at: null,
  state: null,
  purpose: null,
  workspace_id: 1204
)
```

