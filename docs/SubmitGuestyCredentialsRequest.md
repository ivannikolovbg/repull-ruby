# Repull::SubmitGuestyCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/guesty&#x60;. | [optional] |
| **credentials** | **Hash&lt;String, Object&gt;** | Client ID + secret from Guesty → Integrations → Open API. |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitGuestyCredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

