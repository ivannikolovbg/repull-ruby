# Repull::SubmitCloudbedsCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/cloudbeds&#x60;. Omit when calling with your API key. | [optional] |
| **credentials** | [**SubmitCloudbedsCredentialsRequestCredentials**](SubmitCloudbedsCredentialsRequestCredentials.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitCloudbedsCredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

