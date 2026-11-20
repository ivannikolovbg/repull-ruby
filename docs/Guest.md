# Repull::Guest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **display_name** | **String** | Short display name (first name). | [optional] |
| **display_name_long** | **String** | Long display name (first + last). Falls back to displayName when last name is missing. | [optional] |
| **language** | **String** | Guest&#39;s preferred language (ISO 639-1). | [optional] |
| **country** | **String** | Guest country (from profile metadata or address). | [optional] |
| **phone** | **String** | Primary phone contact (or first non-primary if no primary set). May be an Airbnb relay number — check &#x60;phoneType&#x60;. | [optional] |
| **phone_type** | [**GuestPhoneType**](GuestPhoneType.md) | &#x60;airbnb_relay&#x60; when &#x60;phone&#x60; is a temporary Airbnb relay number (SMS only, expires 48h after checkout, shared across hosts, never a guest identifier); &#x60;guest&#x60; otherwise; &#x60;null&#x60; when there is no phone. | [optional] |
| **email** | **String** | Primary email contact. | [optional] |
| **total_reservations** | **Integer** | Lifetime reservation count. | [optional] |
| **total_revenue** | **String** | Decimal-as-string to preserve precision across mixed-currency totals. | [optional] |
| **last_stayed_at** | **Time** |  | [optional] |
| **first_stayed_at** | **Time** |  | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Guest.new(
  id: null,
  display_name: Jane,
  display_name_long: Jane Doe,
  language: null,
  country: null,
  phone: null,
  phone_type: null,
  email: null,
  total_reservations: null,
  total_revenue: 14250.00,
  last_stayed_at: null,
  first_stayed_at: null,
  created_at: null
)
```

