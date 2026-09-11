# Repull::SubmitLodgifyCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/lodgify&#x60;. | [optional] |
| **credentials** | **Hash&lt;String, Object&gt;** | API key from Lodgify → Settings → Public API. |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitLodgifyCredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

