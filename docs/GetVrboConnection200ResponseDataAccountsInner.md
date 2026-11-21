# Repull::GetVrboConnection200ResponseDataAccountsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  | [optional] |
| **account_name** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **session_status** | **String** |  | [optional] |
| **access_type** | **String** |  | [optional] |
| **linked_units** | **Integer** |  | [optional] |
| **connected_at** | **String** |  | [optional] |
| **last_synced_at** | **String** |  | [optional] |
| **sync** | [**GetVrboConnection200ResponseDataAccountsInnerSync**](GetVrboConnection200ResponseDataAccountsInnerSync.md) |  | [optional] |
| **import** | **Hash&lt;String, Object&gt;** | The account&#39;s import progress, as &#x60;GET /v1/connect/vrbo-login&#x60; reports it. | [optional] |
| **fix_url** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboConnection200ResponseDataAccountsInner.new(
  account_id: vrbo:7001234,
  account_name: null,
  status: null,
  session_status: null,
  access_type: null,
  linked_units: null,
  connected_at: null,
  last_synced_at: null,
  sync: null,
  import: null,
  fix_url: null
)
```

