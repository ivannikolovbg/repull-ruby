# Repull::SubmitIgmsCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/igms&#x60;. | [optional] |
| **credentials** | **Hash&lt;String, Object&gt;** | API token from iGMS → Settings → Integrations. |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitIgmsCredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

