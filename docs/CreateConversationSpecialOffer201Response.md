# Repull::CreateConversationSpecialOffer201Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb special-offer id. Use it to read or withdraw the offer. |  |
| **conversation_id** | **String** | Repull conversation id the offer was sent on. |  |
| **status** | **String** | Airbnb’s status for the offer: &#x60;active&#x60; (the guest can book it), &#x60;accepted&#x60;, &#x60;declined&#x60;, &#x60;expired&#x60; or &#x60;voided&#x60; (withdrawn). |  |
| **listing_id** | **String** | Repull listing id, when known. | [optional] |
| **airbnb_listing_id** | **String** | Airbnb listing id the offer is for (a string — it exceeds 2^53). | [optional] |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** |  |  |
| **nights** | **Integer** |  |  |
| **guests** | [**CreateConversationSpecialOffer201ResponseGuests**](CreateConversationSpecialOffer201ResponseGuests.md) |  | [optional] |
| **total_price** | **Float** | Total for the stay, in the listing’s Airbnb currency. |  |
| **created_at** | **Time** |  | [optional] |
| **expires_at** | **Time** | When the guest can no longer book the offer (Airbnb gives them 24 hours). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateConversationSpecialOffer201Response.new(
  id: 1459920384,
  conversation_id: 164743,
  status: active,
  listing_id: 23892,
  airbnb_listing_id: 955656266214757921,
  check_in: Thu Oct 01 00:00:00 UTC 2026,
  check_out: Mon Oct 05 00:00:00 UTC 2026,
  nights: 4,
  guests: null,
  total_price: 880,
  created_at: null,
  expires_at: null
)
```

