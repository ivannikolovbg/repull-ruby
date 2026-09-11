# Repull::SubmitBookingsyncCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/bookingsync&#x60;. | [optional] |
| **credentials** | **Hash&lt;String, Object&gt;** | OAuth client credentials issued by BookingSync. |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitBookingsyncCredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

