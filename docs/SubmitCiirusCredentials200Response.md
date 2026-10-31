# Repull::SubmitCiirusCredentials200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** |  | [optional] |
| **connected** | **Boolean** |  | [optional] |
| **pms_connection_id** | **String** | Id of the stored connection. | [optional] |
| **created** | **Boolean** | False when an existing connection was updated. | [optional] |
| **session_id** | **String** |  | [optional] |
| **account_info** | [**SubmitCiirusCredentials200ResponseAccountInfo**](SubmitCiirusCredentials200ResponseAccountInfo.md) |  | [optional] |
| **first_sync** | [**SubmitTrackCredentials200ResponseFirstSync**](SubmitTrackCredentials200ResponseFirstSync.md) |  | [optional] |
| **write_policy** | [**PmsWritePolicy**](PmsWritePolicy.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitCiirusCredentials200Response.new(
  provider: ciirus,
  connected: null,
  pms_connection_id: null,
  created: null,
  session_id: null,
  account_info: null,
  first_sync: null,
  write_policy: null
)
```

