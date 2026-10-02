# Repull::ReservationCapabilities

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **managed_by** | **String** | &#x60;pms&#x60; — booked in the connected PMS; &#x60;repull&#x60; — a direct booking made in Repull. | [optional] |
| **provider** | **String** |  | [optional] |
| **create** | **Boolean** | &#x60;POST /v1/reservations&#x60;. | [optional] |
| **modify** | **Boolean** | &#x60;PATCH /v1/reservations/{id}&#x60;. | [optional] |
| **cancel** | **Boolean** | &#x60;POST /v1/reservations/{id}/cancel&#x60;. | [optional] |
| **quote** | **Boolean** | &#x60;POST /v1/reservations/quote&#x60;. | [optional] |
| **custom_price** | **Boolean** | &#x60;totalPrice&#x60; on create is honoured; otherwise the PMS (or the rate engine) prices the stay. | [optional] |
| **notes** | **String** | What the flags do not say: limits, required access, and why something is off. | [optional] |
| **verified_against** | **String** | &#x60;sandbox&#x60; — run end to end on the vendor sandbox (Mews, Cloudbeds); &#x60;vendor_docs&#x60; — verified against the vendor&#39;s API documentation only. Null for direct bookings. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationCapabilities.new(
  managed_by: null,
  provider: hostaway,
  create: null,
  modify: null,
  cancel: null,
  quote: null,
  custom_price: null,
  notes: null,
  verified_against: null
)
```

