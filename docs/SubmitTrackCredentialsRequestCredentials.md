# Repull::SubmitTrackCredentialsRequestCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **domain** | **String** | Your Track domain: &#x60;acme.trackhs.com&#x60;, or just the subdomain &#x60;acme&#x60;. A full URL is accepted; only the host is kept. |  |
| **api_key** | **String** | Track API key. |  |
| **api_secret** | **String** | Track API secret, shown next to the key in Track. |  |
| **key_type** | **String** | &#x60;server&#x60; — a Server Key (Company Setup → API Keys), full access, recommended. &#x60;channel&#x60; — a Channel Key (PMS Setup → Distribution Channels), booking only. | [optional][default to &#39;server&#39;] |
| **auth_mode** | **String** | How requests to Track are signed. Leave the default unless Track support told you otherwise. | [optional][default to &#39;hmac&#39;] |
| **hmac_realm** | **String** | HMAC realm. Defaults to &#x60;Acquia&#x60;, the realm Track&#39;s HMAC signing uses. | [optional] |
| **secret_is_base64** | **Boolean** | Whether &#x60;apiSecret&#x60; is base64-encoded, as Track issues it. Set false to sign with the secret&#39;s raw text. | [optional][default to true] |
| **payment_type_id** | **Integer** | The Track payment type that payments recorded through this connection are posted to. | [optional] |
| **move_reason_id** | **Integer** | The Track move reason used when a reservation is moved to another unit. Without it, unit changes are refused. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitTrackCredentialsRequestCredentials.new(
  domain: acme.trackhs.com,
  api_key: null,
  api_secret: null,
  key_type: null,
  auth_mode: null,
  hmac_realm: null,
  secret_is_base64: null,
  payment_type_id: null,
  move_reason_id: null
)
```

