# Repull::GuestProfile

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **display_name** | **String** |  | [optional] |
| **display_name_long** | **String** |  | [optional] |
| **avatar_url** | **String** |  | [optional] |
| **language** | **String** |  | [optional] |
| **country** | **String** |  | [optional] |
| **phone** | **String** |  | [optional] |
| **email** | **String** |  | [optional] |
| **total_reservations** | **Integer** |  | [optional] |
| **total_revenue** | **String** | Decimal as string. | [optional] |
| **currency** | **String** |  | [optional] |
| **is_blacklisted** | **Boolean** |  | [optional] |
| **blacklisted_reason** | **String** |  | [optional] |
| **risk_level** | **String** | Main-vanio risk score (e.g. &#x60;low&#x60;, &#x60;medium&#x60;, &#x60;high&#x60;). | [optional] |
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
  avatar_url: null,
  language: null,
  country: null,
  phone: null,
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

