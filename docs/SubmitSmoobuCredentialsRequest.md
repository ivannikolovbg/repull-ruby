# Repull::SubmitSmoobuCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/smoobu&#x60;. | [optional] |
| **credentials** | [**SubmitSmoobuCredentialsRequestCredentials**](SubmitSmoobuCredentialsRequestCredentials.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitSmoobuCredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

