# Repull::GetVrboOffer200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Vrbo keeps one live quote per conversation: always &#x60;current&#x60;. | [optional] |
| **conversation_id** | **String** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **check_in** | **String** |  | [optional] |
| **check_out** | **String** |  | [optional] |
| **nights** | **Integer** |  | [optional] |
| **guests** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **total_price** | **Float** | Vrbo&#39;s guest total (with its taxes and service fee). | [optional] |
| **currency** | **String** |  | [optional] |
| **rental_amount** | **Float** |  | [optional] |
| **fees** | [**Array&lt;GetVrboOffer200ResponseFeesInner&gt;**](GetVrboOffer200ResponseFeesInner.md) |  | [optional] |
| **damage_deposit** | **Float** |  | [optional] |
| **lines** | **Array&lt;Hash&lt;String, Object&gt;&gt;** |  | [optional] |
| **message** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboOffer200Response.new(
  id: current,
  conversation_id: null,
  channel: vrbo,
  status: sent,
  check_in: null,
  check_out: null,
  nights: null,
  guests: null,
  total_price: null,
  currency: null,
  rental_amount: null,
  fees: null,
  damage_deposit: null,
  lines: null,
  message: null
)
```

