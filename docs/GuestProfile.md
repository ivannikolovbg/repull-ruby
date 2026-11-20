# Repull::GuestProfile

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **display_name** | **String** |  | [optional] |
| **display_name_long** | **String** |  | [optional] |
| **language** | **String** |  | [optional] |
| **country** | **String** |  | [optional] |
| **phone** | **String** | Primary phone contact. May be an Airbnb relay number — check &#x60;phoneType&#x60;. | [optional] |
| **phone_type** | [**GuestPhoneType**](GuestPhoneType.md) | &#x60;airbnb_relay&#x60; when &#x60;phone&#x60; is a temporary Airbnb relay number; &#x60;guest&#x60; otherwise; &#x60;null&#x60; when there is no phone. | [optional] |
| **email** | **String** |  | [optional] |
| **total_reservations** | **Integer** |  | [optional] |
| **total_revenue** | **String** | Decimal as string. | [optional] |
| **currency** | **String** |  | [optional] |
| **is_blacklisted** | **Boolean** |  | [optional] |
| **blacklisted_reason** | **String** |  | [optional] |
| **risk_level** | **String** | Risk score (e.g. &#x60;low&#x60;, &#x60;medium&#x60;, &#x60;high&#x60;). | [optional] |
| **verification_level** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **contacts** | [**Array&lt;GuestContact&gt;**](GuestContact.md) |  | [optional] |
| **flags** | [**Array&lt;GuestFlag&gt;**](GuestFlag.md) |  | [optional] |
| **notes** | [**Array&lt;GuestNote&gt;**](GuestNote.md) |  | [optional] |
| **reservations_summary** | [**GuestReservationsSummary**](GuestReservationsSummary.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GuestProfile.new(
  id: null,
  display_name: null,
  display_name_long: null,
  language: null,
  country: null,
  phone: null,
  phone_type: null,
  email: null,
  total_reservations: null,
  total_revenue: null,
  currency: null,
  is_blacklisted: null,
  blacklisted_reason: null,
  risk_level: null,
  verification_level: null,
  created_at: null,
  contacts: null,
  flags: null,
  notes: null,
  reservations_summary: null
)
```

