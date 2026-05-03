# Repull::ConnectStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **connected** | **Boolean** |  | [optional] |
| **provider** | **String** |  | [optional] |
| **id** | **String** | Repull-side connection ID. Stable across token refreshes. | [optional] |
| **status** | **String** |  | [optional] |
| **external_account_id** | **String** | Provider-side account ID (e.g. the Airbnb host ID). | [optional] |
| **created_at** | **Time** |  | [optional] |
| **host** | [**ConnectHost**](ConnectHost.md) | Host metadata, populated for Airbnb when the host row exists. Null for other providers (per-provider enrichment is incremental). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectStatus.new(
  connected: true,
  provider: airbnb,
  id: 3,
  status: active,
  external_account_id: 23998907,
  created_at: null,
  host: null
)
```

