# Repull::SubmitTrackCredentials200ResponseAccountInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **domain** | **String** | The Track host the connection calls. | [optional] |
| **key_type** | **String** |  | [optional] |
| **auth_mode** | **String** |  | [optional] |
| **account_name** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitTrackCredentials200ResponseAccountInfo.new(
  domain: acme.trackhs.com,
  key_type: null,
  auth_mode: null,
  account_name: null
)
```

