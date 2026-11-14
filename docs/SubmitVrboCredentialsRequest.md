# Repull::SubmitVrboCredentialsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | Connect session id from &#x60;POST /v1/connect/vrbo&#x60;. | [optional] |
| **advertiser_external_id** | **String** | The host&#39;s Vrbo advertiser id. Repull mints the Basic-Auth pair for it, which the host pastes into Vrbo Partner Central. |  |
| **endpoint_url** | **String** | Optional. Vrbo Partner Central sets this itself. | [optional] |
| **rotate** | **Boolean** | Replace the advertiser&#39;s existing password and return the new one. The old password stops working. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitVrboCredentialsRequest.new(
  session_id: null,
  advertiser_external_id: null,
  endpoint_url: null,
  rotate: null
)
```

