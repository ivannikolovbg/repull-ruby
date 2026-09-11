# Repull::SubmitOwnerrezCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/ownerrez&#x60;. | [optional] |
| **credentials** | **Hash&lt;String, Object&gt;** | Username + API token from OwnerRez → Settings → API. |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitOwnerrezCredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

