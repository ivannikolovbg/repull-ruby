# Repull::SubmitMewsCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/mews&#x60;. Omit when calling with your API key. | [optional] |
| **credentials** | [**SubmitMewsCredentialsRequestCredentials**](SubmitMewsCredentialsRequestCredentials.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitMewsCredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

