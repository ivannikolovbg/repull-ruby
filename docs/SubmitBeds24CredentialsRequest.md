# Repull::SubmitBeds24CredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/beds24&#x60;. | [optional] |
| **credentials** | **Hash&lt;String, Object&gt;** | API key + prop key from Beds24 → Settings → Apps &amp; Integrations. |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitBeds24CredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

