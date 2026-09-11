# Repull::SubmitHostawayCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/hostaway&#x60;. | [optional] |
| **credentials** | **Hash&lt;String, Object&gt;** | Account ID + API key from Hostaway → Settings → Public API. |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitHostawayCredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

