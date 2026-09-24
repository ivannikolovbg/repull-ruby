# Repull::CreateConnectSessionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **redirect_url** | **String** | Where to send the user after they finish (or cancel). Status query params are appended. |  |
| **state** | **String** | Opaque pass-through correlation token. Echoed back in the response. | [optional] |
| **allowed_providers** | **Array&lt;String&gt;** | Optional whitelist of provider IDs the picker should expose. Omit to show every channel in the registry. | [optional] |
| **locale** | **String** | Optional UI language for the hosted Connect pages. Accepts any supported locale code (currently &#x60;en&#x60;, &#x60;fr&#x60;). When set it pins the language for the whole flow, overriding the workspace &#x60;default_language&#x60;. Unknown codes are ignored and the page falls back to the workspace default, then &#x60;Accept-Language&#x60;, then &#x60;en&#x60;. The end user can still override per-visit with a &#x60;?locale&#x3D;&#x60; query param on the hosted page. | [optional] |
| **purpose** | **String** | &#x60;migrate&#x60; starts a Repull Migrate session: the property manager connects their current PMS (or channel) and their data is copied into a new workspace of theirs, which you read with &#x60;X-Workspace-Id&#x60;. The hosted pages use migration wording, and after connecting they show the import&#39;s progress. | [optional][default to &#39;connect&#39;] |
| **workspace** | [**CreateConnectSessionRequestWorkspace**](CreateConnectSessionRequestWorkspace.md) |  | [optional] |
| **copy** | [**CreateConnectSessionRequestCopy**](CreateConnectSessionRequestCopy.md) |  | [optional] |
| **scope** | **Array&lt;String&gt;** | Migrate only — what you want brought across, listed to the property manager before they connect. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateConnectSessionRequest.new(
  redirect_url: null,
  state: null,
  allowed_providers: null,
  locale: fr,
  purpose: null,
  workspace: null,
  copy: null,
  scope: null
)
```

