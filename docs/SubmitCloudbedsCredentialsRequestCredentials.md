# Repull::SubmitCloudbedsCredentialsRequestCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **api_key** | **String** | Cloudbeds API key. |  |
| **property_ids** | **Array&lt;String&gt;** | Organization keys only: limit the connection to these properties. Omit to use every property the key can see. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitCloudbedsCredentialsRequestCredentials.new(
  api_key: null,
  property_ids: null
)
```

