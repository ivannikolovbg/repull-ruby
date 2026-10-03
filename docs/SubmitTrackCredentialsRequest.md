# Repull::SubmitTrackCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/track&#x60;. Omit when calling with your API key. | [optional] |
| **write_policy** | **Object** | Optional: what the app may change in Track, set before the first sync. Same shape as &#x60;PATCH /v1/connect/{provider}/write-policy&#x60;; switches you leave out keep the provider default (everything on). | [optional] |
| **credentials** | [**SubmitTrackCredentialsRequestCredentials**](SubmitTrackCredentialsRequestCredentials.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitTrackCredentialsRequest.new(
  session_id: null,
  write_policy: {&quot;reservations&quot;:{&quot;api&quot;:false}},
  credentials: null
)
```

