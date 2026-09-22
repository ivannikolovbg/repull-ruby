# Repull::CreateConversationSpecialOfferRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** | Repull listing id to offer. Defaults to the listing the conversation is about. | [optional] |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** | Must be after &#x60;checkIn&#x60;. |  |
| **guests** | [**CreateConversationSpecialOfferRequestGuests**](CreateConversationSpecialOfferRequestGuests.md) |  |  |
| **total_price** | **Float** | Total the guest pays for the whole stay, in the listing’s Airbnb currency. |  |

## Example

```ruby
require 'repull'

instance = Repull::CreateConversationSpecialOfferRequest.new(
  listing_id: 23892,
  check_in: Thu Oct 01 00:00:00 UTC 2026,
  check_out: Mon Oct 05 00:00:00 UTC 2026,
  guests: null,
  total_price: 880
)
```

