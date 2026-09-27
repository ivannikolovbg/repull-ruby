# Repull::SubmitCloudbedsCredentials200ResponseAccountInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **external_account_id** | **String** | The Cloudbeds property id these credentials belong to. | [optional] |
| **account_name** | **String** |  | [optional] |
| **property_ids** | **Array&lt;String&gt;** | Every property the credentials cover. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitCloudbedsCredentials200ResponseAccountInfo.new(
  external_account_id: null,
  account_name: null,
  property_ids: null
)
```

