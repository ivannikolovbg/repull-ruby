# Repull::SubmitVrboCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/vrbo&#x60;. | [optional] |
| **credentials** | **Hash&lt;String, Object&gt;** | Activation handshake — Repull mints the Basic-Auth pair the host pastes into Vrbo Partner Central. |  |

## Example

```ruby
require 'repull'

instance = Repull::SubmitVrboCredentialsRequest.new(
  session_id: null,
  credentials: null
)
```

