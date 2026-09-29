# Repull::PreviewConversationSpecialOfferRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **guests** | [**PreviewConversationSpecialOfferRequestGuests**](PreviewConversationSpecialOfferRequestGuests.md) |  | [optional] |
| **rental_amount** | **Float** | Rent for the stay, excluding fees and taxes. | [optional] |
| **fees** | [**Array&lt;PreviewConversationSpecialOfferRequestFeesInner&gt;**](PreviewConversationSpecialOfferRequestFeesInner.md) |  | [optional] |
| **damage_deposit** | **Float** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PreviewConversationSpecialOfferRequest.new(
  check_in: Thu Nov 26 00:00:00 UTC 2026,
  check_out: Sun Dec 06 00:00:00 UTC 2026,
  guests: null,
  rental_amount: null,
  fees: null,
  damage_deposit: null
)
```

