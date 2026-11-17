# Repull::GuestContact

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Contact channel type (&#x60;phone&#x60;, &#x60;email&#x60;, etc.). | [optional] |
| **value** | **String** |  | [optional] |
| **verified** | **Boolean** |  | [optional] |
| **is_primary** | **Boolean** |  | [optional] |
| **last_used** | **Time** |  | [optional] |
| **phone_type** | [**GuestPhoneType**](GuestPhoneType.md) | Phone contacts only: &#x60;airbnb_relay&#x60; when this is a temporary Airbnb relay number (SMS only, expires 48h after checkout, shared across hosts, never a guest identifier); &#x60;guest&#x60; otherwise. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GuestContact.new(
  type: phone,
  value: +15551234567,
  verified: null,
  is_primary: null,
  last_used: null,
  phone_type: null
)
```

