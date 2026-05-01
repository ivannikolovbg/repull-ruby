# Repull::Connection

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **provider** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **external_account_id** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **host** | [**ConnectHost**](ConnectHost.md) | Host metadata for the linked account. Currently populated for Airbnb only; null for other providers. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Connection.new(
  id: null,
  provider: hostaway,
  status: active,
  external_account_id: null,
  created_at: null,
  host: null
)
```

