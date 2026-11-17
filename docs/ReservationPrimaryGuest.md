# Repull::ReservationPrimaryGuest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Internal Repull guest ID. Use &#x60;GET /v1/guests/{id}&#x60; for the full profile. | [optional] |
| **first_name** | **String** |  | [optional] |
| **last_name** | **String** |  | [optional] |
| **email** | **String** | Primary email contact (or first non-primary if no primary set). | [optional] |
| **phone** | **String** | Primary phone contact (or first non-primary if no primary set). For an Airbnb stay this may be an Airbnb relay number — check &#x60;phoneType&#x60;. | [optional] |
| **phone_type** | [**GuestPhoneType**](GuestPhoneType.md) | Present whenever &#x60;phone&#x60; is. &#x60;airbnb_relay&#x60; when &#x60;phone&#x60; is a temporary Airbnb relay number (SMS only, expires 48h after checkout, shared across hosts, never a guest identifier); &#x60;guest&#x60; otherwise. | [optional] |
| **phone_expires_at** | **Time** | Only next to an Airbnb relay number: when it stops working (checkout + 48 hours). &#x60;null&#x60; when Airbnb did not give the checkout time with its offset. A cancelled reservation&#39;s relay number stops working at cancellation, whatever this says. | [optional] |
| **language** | **String** | Guest&#39;s preferred language (BCP-47 / ISO 639-1). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationPrimaryGuest.new(
  id: null,
  first_name: null,
  last_name: null,
  email: null,
  phone: null,
  phone_type: null,
  phone_expires_at: 2026-11-22T16:00Z,
  language: null
)
```

