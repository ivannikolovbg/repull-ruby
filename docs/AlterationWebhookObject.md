# Repull::AlterationWebhookObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull-internal alteration id (&#x60;reservation_alterations.id&#x60;). |  |
| **alteration_id** | **String** | Provider-side alteration/resolution id. | [optional] |
| **channel** | **String** | Source channel. Currently always &#x60;airbnb&#x60;. |  |
| **reservation_id** | **Integer** | Repull reservation id the alteration targets. Pass to &#x60;GET /v1/reservations/{id}&#x60;. |  |
| **customer_id** | **Integer** | Workspace (customer) id. |  |
| **status** | **String** | Alteration lifecycle status. |  |
| **initiator** | **String** | Who requested the alteration. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AlterationWebhookObject.new(
  id: 4471,
  alteration_id: RAX9K2M4C1,
  channel: airbnb,
  reservation_id: 215906,
  customer_id: 1,
  status: pending,
  initiator: guest
)
```

