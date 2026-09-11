# Repull::SubmitSmoobuCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/smoobu&#x60;. | [optional] |
| **credentials** | **Hash&lt;String, Object&gt;** | API key from Smoobu → Settings → For developers. |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitSmoobuCredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

