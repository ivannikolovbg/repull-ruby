# Repull::CreateConversationSpecialOfferRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** | Repull listing id to offer. Defaults to the listing the conversation is about. | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** | Must be after &#x60;checkIn&#x60;. | [optional] |
| **guests** | [**CreateConversationSpecialOfferRequestGuests**](CreateConversationSpecialOfferRequestGuests.md) |  | [optional] |
| **total_price** | **Float** | Airbnb: the total the guest pays for the whole stay, in the listing’s Airbnb currency. | [optional] |
| **rental_amount** | **Float** | VRBO: rent for the whole stay, excluding fees and taxes. | [optional] |
| **fees** | [**Array&lt;CreateConversationSpecialOfferRequestFeesInner&gt;**](CreateConversationSpecialOfferRequestFeesInner.md) | VRBO: the offer’s fees — replaces its fee list. &#x60;type&#x60; is VRBO’s fee type (&#x60;CLEANING&#x60;, &#x60;PET&#x60;, …). | [optional] |
| **damage_deposit** | **Float** | VRBO: refundable damage deposit; &#x60;null&#x60; for none. | [optional] |
| **message** | **String** | VRBO: the message sent to the guest with the offer (a friendly default otherwise). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateConversationSpecialOfferRequest.new(
  listing_id: 23892,
  check_in: Thu Oct 01 00:00:00 UTC 2026,
  check_out: Mon Oct 05 00:00:00 UTC 2026,
  guests: null,
  total_price: 880,
  rental_amount: 4636,
  fees: null,
  damage_deposit: 500,
  message: null
)
```

