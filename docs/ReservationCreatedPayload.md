# Repull::ReservationCreatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **confirmation_code** | **String** |  | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **platform** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **nights** | **Integer** |  | [optional] |
| **guests** | [**ReservationCreatedPayloadGuests**](ReservationCreatedPayloadGuests.md) |  | [optional] |
| **primary_guest** | [**ReservationCreatedPayloadPrimaryGuest**](ReservationCreatedPayloadPrimaryGuest.md) |  | [optional] |
| **pricing** | [**ReservationCreatedPayloadPricing**](ReservationCreatedPayloadPricing.md) |  | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationCreatedPayload.new(
  id: 215906,
  confirmation_code: HMA1234567,
  listing_id: 6250,
  platform: airbnb,
  status: confirmed,
  check_in: Mon Jun 01 00:00:00 UTC 2026,
  check_out: Fri Jun 05 00:00:00 UTC 2026,
  nights: 4,
  guests: null,
  primary_guest: null,
  pricing: null,
  created_at: 2026-05-01T12:34:56Z
)
```

