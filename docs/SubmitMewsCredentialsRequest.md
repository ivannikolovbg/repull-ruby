# Repull::SubmitMewsCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/mews&#x60;. Omit when calling with your API key. | [optional] |
| **write_policy** | **Object** | Optional: what the app may change in the PMS, set before the first sync. Same shape as &#x60;PATCH /v1/connect/{provider}/write-policy&#x60;; switches you leave out keep the provider default (calendar off for hotel PMSs, bookings on). | [optional] |
| **credentials** | [**SubmitMewsCredentialsRequestCredentials**](SubmitMewsCredentialsRequestCredentials.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitMewsCredentialsRequest.new(
  session_id: null,
  write_policy: {&quot;calendar&quot;:{&quot;rates&quot;:true}},
  credentials: null
)
```

