# Repull::SubmitCloudbedsCredentials200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** |  | [optional] |
| **connected** | **Boolean** |  | [optional] |
| **pms_connection_id** | **String** | Id of the stored connection. | [optional] |
| **created** | **Boolean** | False when an existing connection was updated. | [optional] |
| **session_id** | **String** |  | [optional] |
| **account_info** | [**SubmitCloudbedsCredentials200ResponseAccountInfo**](SubmitCloudbedsCredentials200ResponseAccountInfo.md) |  | [optional] |
| **webhooks** | [**SubmitCloudbedsCredentials200ResponseWebhooks**](SubmitCloudbedsCredentials200ResponseWebhooks.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitCloudbedsCredentials200Response.new(
  provider: cloudbeds,
  connected: null,
  pms_connection_id: null,
  created: null,
  session_id: null,
  account_info: null,
  webhooks: null
)
```

