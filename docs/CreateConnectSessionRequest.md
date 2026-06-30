# Repull::CreateConnectSessionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **redirect_url** | **String** | Where to send the user after they finish (or cancel). Status query params are appended. |  |
| **state** | **String** | Opaque pass-through correlation token. Echoed back in the response. | [optional] |
| **allowed_providers** | **Array&lt;String&gt;** | Optional whitelist of provider IDs the picker should expose. Omit to show every channel in the registry. | [optional] |
| **locale** | **String** | Optional UI language for the hosted Connect pages. Accepts any supported locale code (currently &#x60;en&#x60;, &#x60;fr&#x60;). When set it pins the language for the whole flow, overriding the workspace &#x60;default_language&#x60;. Unknown codes are ignored and the page falls back to the workspace default, then &#x60;Accept-Language&#x60;, then &#x60;en&#x60;. The end user can still override per-visit with a &#x60;?locale&#x3D;&#x60; query param on the hosted page. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateConnectSessionRequest.new(
  redirect_url: null,
  state: null,
  allowed_providers: null,
  locale: fr
)
```

