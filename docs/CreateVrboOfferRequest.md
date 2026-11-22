# Repull::CreateVrboOfferRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  |  |
| **thread_id** | **String** | The Vrbo conversation (&#x60;vrbo:&lt;uuid&gt;&#x60;). &#x60;threadId&#x60; is accepted too. |  |
| **message** | **String** | A note Vrbo shows the guest with the pre-approval or quote. | [optional] |
| **start_date** | **Date** | Offer: first night. With &#x60;nights&#x60;. | [optional] |
| **nights** | **Integer** | Offer: number of nights. With &#x60;start_date&#x60;. | [optional] |
| **guest_details** | [**CreateVrboOfferRequestGuestDetails**](CreateVrboOfferRequestGuestDetails.md) |  | [optional] |
| **rental_amount** | **Float** | Offer: the rent for the stay, before fees and taxes. | [optional] |
| **fees** | [**Array&lt;CreateVrboOfferRequestFeesInner&gt;**](CreateVrboOfferRequestFeesInner.md) |  | [optional] |
| **damage_deposit** | **Float** | Offer: refundable damage deposit; &#x60;null&#x60; for none. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateVrboOfferRequest.new(
  type: null,
  thread_id: null,
  message: null,
  start_date: null,
  nights: null,
  guest_details: null,
  rental_amount: null,
  fees: null,
  damage_deposit: null
)
```

