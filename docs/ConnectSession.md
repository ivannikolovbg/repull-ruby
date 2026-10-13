# Repull::ConnectSession

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** |  |  |
| **url** | **String** |  |  |
| **expires_at** | **Time** |  |  |
| **state** | **String** | Echoed back from the request body for SDK consumers that pass an opaque correlation token. | [optional] |
| **purpose** | **String** | Present only on a Repull Migrate session. | [optional] |
| **include_request_only** | **Boolean** | Present (&#x60;true&#x60;) when the session also lists PMSes Repull doesn&#39;t connect yet. | [optional] |
| **workspace_id** | **String** | Present when the session lands on a sub-workspace (&#x60;workspace&#x60; or &#x60;X-Workspace-Id&#x60; on the request): the workspace the connection lands in. Read and write it with &#x60;X-Workspace-Id&#x60;; on a migrate session, track the import with &#x60;GET /v1/migrations/{workspaceId}&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectSession.new(
  session_id: cs_8gQrT2v9k3M4nLp7wJxYzAbCdEfGhIjKlMnOp,
  url: https://connect.repull.dev/cs_8gQrT2v9k3M4nLp7wJxYzAbCdEfGhIjKlMnOp,
  expires_at: null,
  state: null,
  purpose: null,
  include_request_only: null,
  workspace_id: 1204
)
```

