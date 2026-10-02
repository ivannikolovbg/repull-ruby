# Repull::Connection

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **provider** | **String** |  | [optional] |
| **status** | **String** | &#x60;active&#x60; — connected and working. &#x60;pending&#x60; — still settling. &#x60;needs_permissions&#x60; — connected but the host must grant more access before it works (see &#x60;action&#x60;/&#x60;fixUrl&#x60;). An &#x60;active&#x60; connection can also carry an &#x60;action&#x60; (e.g. a Smoobu legacy API key that must be replaced with a key + secret before October 31, 2026). &#x60;error&#x60; — the last operation failed. &#x60;disconnected&#x60; — revoked or superseded. | [optional] |
| **external_account_id** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **host** | [**ConnectHost**](ConnectHost.md) | Host metadata for the linked account. Currently populated for Airbnb only; null for other providers. | [optional] |
| **action** | [**ConnectionAction**](ConnectionAction.md) | Set when the host must do something before the connection works (e.g. grant the invited Booking.com Extranet user full access). &#x60;null&#x60; when no action is pending. | [optional] |
| **fix_url** | **String** | Durable link that reopens the hosted Connect flow bound to this account on the fix screen — send the host here to resolve &#x60;action&#x60;. Present only when &#x60;action.required&#x60; is true; &#x60;null&#x60; otherwise. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Connection.new(
  id: null,
  provider: hostaway,
  status: active,
  external_account_id: null,
  created_at: null,
  host: null,
  action: null,
  fix_url: null
)
```

