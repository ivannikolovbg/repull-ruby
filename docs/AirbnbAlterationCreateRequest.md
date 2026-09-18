# Repull::AirbnbAlterationCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **confirmation_code** | **String** | Airbnb confirmation code of the reservation to alter. &#x60;GET /v1/channels/airbnb/reservations&#x60; lists them. |  |
| **check_in** | **Date** | New check-in date, &#x60;YYYY-MM-DD&#x60;. | [optional] |
| **check_out** | **Date** | New check-out date, &#x60;YYYY-MM-DD&#x60;. Must be after &#x60;check_in&#x60; when both are sent. | [optional] |
| **number_of_guests** | **Integer** | New guest count for the stay. | [optional] |
| **total_price** | **Float** | New total for the whole stay, in the listing currency. Sent to Airbnb as the alteration&#39;s price override. | [optional] |
| **listing_id** | **Integer** | Move the reservation to this listing — a **listing transfer**. This is the **Repull** listing id (the &#x60;id&#x60; from &#x60;GET /v1/properties&#x60;), the same id every other Airbnb channel route takes; Repull verifies you own it, that it is active and connected to Airbnb, and translates it to the Airbnb listing id before sending it. Airbnb decides whether to honour the move. | [optional] |
| **airbnb_listing_id** | **String** | The transfer target as the **Airbnb** listing id, for callers who hold that instead of the Repull id. Prefer &#x60;listing_id&#x60;. Sending both is allowed only when they name the same listing. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbAlterationCreateRequest.new(
  confirmation_code: HMX4CMA2X9,
  check_in: Sun Aug 02 00:00:00 UTC 2026,
  check_out: Thu Aug 06 00:00:00 UTC 2026,
  number_of_guests: 3,
  total_price: 640,
  listing_id: 4118,
  airbnb_listing_id: 18871326
)
```

