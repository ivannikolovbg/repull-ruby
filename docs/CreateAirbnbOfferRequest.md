# Repull::CreateAirbnbOfferRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | What to create. |  |
| **thread_id** | **String** | Airbnb message-thread id the offer answers. (&#x60;threadId&#x60; is accepted too.) |  |
| **block_instant_booking** | **Boolean** | Pre-approval only: require the guest to book through the pre-approval rather than Instant Book. (&#x60;blockInstantBooking&#x60; is accepted too.) | [optional][default to false] |
| **listing_id** | **String** | Offer only (required): the AIRBNB listing id, as a string. | [optional] |
| **start_date** | **Date** | Offer only (required): first night. | [optional] |
| **nights** | **Integer** | Offer only (required). | [optional] |
| **total_price** | **Float** | Offer only (required): total for the stay, in the listing’s Airbnb currency. | [optional] |
| **guest_details** | [**CreateAirbnbOfferRequestGuestDetails**](CreateAirbnbOfferRequestGuestDetails.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateAirbnbOfferRequest.new(
  type: null,
  thread_id: 2675957479,
  block_instant_booking: null,
  listing_id: 955656266214757921,
  start_date: Thu Oct 01 00:00:00 UTC 2026,
  nights: 4,
  total_price: 880,
  guest_details: null
)
```

