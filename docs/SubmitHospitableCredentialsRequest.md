# Repull::SubmitHospitableCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/hospitable&#x60;. | [optional] |
| **credentials** | **Hash&lt;String, Object&gt;** | Personal access token from Hospitable → Settings → API. |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitHospitableCredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

