# Repull::CreateConversationSpecialOffer201Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The offer id — use it to read or withdraw the offer. Airbnb’s special-offer id; on VRBO, where a conversation has one live offer, &#x60;current&#x60;. |  |
| **conversation_id** | **String** | Repull conversation id the offer was sent on. |  |
| **channel** | **String** | The channel the offer is on. | [optional] |
| **status** | **String** | Airbnb: its status for the offer — &#x60;active&#x60; (the guest can book it), &#x60;accepted&#x60;, &#x60;declined&#x60;, &#x60;expired&#x60; or &#x60;voided&#x60; (withdrawn). VRBO: &#x60;sent&#x60; (just sent), &#x60;current&#x60; (the live offer) or &#x60;preview&#x60; (recalculated, not sent). |  |
| **listing_id** | **String** | Repull listing id, when known. | [optional] |
| **airbnb_listing_id** | **String** | Airbnb listing id the offer is for (a string — it exceeds 2^53). | [optional] |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** |  |  |
| **nights** | **Integer** |  |  |
| **guests** | [**CreateConversationSpecialOffer201ResponseGuests**](CreateConversationSpecialOffer201ResponseGuests.md) |  | [optional] |
| **total_price** | **Float** | What the guest pays for the stay. Airbnb: the total you set. VRBO: VRBO’s own total, including its taxes and service fee. |  |
| **currency** | **String** | Currency of the amounts, when the channel states it (VRBO). | [optional] |
| **rental_amount** | **Float** | VRBO: rent for the stay, excluding fees and taxes. Null on Airbnb (priced by one total). | [optional] |
| **discount** | **Float** | VRBO: its automatic stay discount on the rent, when the offer carries one. | [optional] |
| **fees** | [**Array&lt;CreateConversationSpecialOffer201ResponseFeesInner&gt;**](CreateConversationSpecialOffer201ResponseFeesInner.md) | VRBO: the offer’s fees by type. Empty on Airbnb. | [optional] |
| **damage_deposit** | **Float** | VRBO: refundable damage deposit; null for none. | [optional] |
| **lines** | [**Array&lt;CreateConversationSpecialOffer201ResponseLinesInner&gt;**](CreateConversationSpecialOffer201ResponseLinesInner.md) | VRBO: its offer summary line by line, in VRBO’s words (nights, fees, taxes, total traveler payment, payout). | [optional] |
| **message** | **String** | The message sent to the guest with the offer (VRBO). | [optional] |
| **created_at** | **Time** |  | [optional] |
| **expires_at** | **Time** | When the guest can no longer book the offer (Airbnb gives them 24 hours). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateConversationSpecialOffer201Response.new(
  id: 1459920384,
  conversation_id: 164743,
  channel: airbnb,
  status: active,
  listing_id: 23892,
  airbnb_listing_id: 955656266214757921,
  check_in: Thu Oct 01 00:00:00 UTC 2026,
  check_out: Mon Oct 05 00:00:00 UTC 2026,
  nights: 4,
  guests: null,
  total_price: 880,
  currency: CAD,
  rental_amount: 4041.9,
  discount: null,
  fees: null,
  damage_deposit: 500,
  lines: null,
  message: null,
  created_at: null,
  expires_at: null
)
```

