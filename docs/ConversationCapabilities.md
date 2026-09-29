# Repull::ConversationCapabilities

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **can_pre_approve** | **Boolean** | &#x60;POST /v1/conversations/{id}/pre-approval&#x60; would pre-approve the open inquiry (Airbnb connected directly, VRBO). |  |
| **can_withdraw** | **Boolean** | A pre-approval or offer is live and can be withdrawn — &#x60;DELETE /v1/conversations/{id}/pre-approval&#x60; (VRBO) or &#x60;DELETE …/special-offers/{offerId}&#x60; (Airbnb). |  |
| **can_send_offer** | **Boolean** | &#x60;POST /v1/conversations/{id}/special-offers&#x60; would send an offer. |  |
| **offer_price** | **String** | How an offer is priced here: &#x60;total&#x60; — one &#x60;totalPrice&#x60; for the stay (Airbnb); &#x60;breakdown&#x60; — &#x60;rentalAmount&#x60;, &#x60;fees&#x60;, &#x60;damageDeposit&#x60;, and the channel computes the guest total (VRBO). |  |
| **can_preview_offer** | **Boolean** | &#x60;POST /v1/conversations/{id}/special-offers/preview&#x60; returns the channel’s recalculated offer (VRBO). |  |

## Example

```ruby
require 'repull'

instance = Repull::ConversationCapabilities.new(
  can_pre_approve: null,
  can_withdraw: null,
  can_send_offer: null,
  offer_price: null,
  can_preview_offer: null
)
```

