# Repull::Resolution

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **resolution_id** | **String** | Airbnb&#39;s resolution id — the &#x60;{id}&#x60; path value and the join key to a transaction&#39;s &#x60;reference&#x60;. |  |
| **confirmation_code** | **String** | Airbnb confirmation code of the reservation the case is on. | [optional] |
| **reservation_id** | **Integer** | Repull&#39;s internal reservation id, when the reservation is in this workspace. | [optional] |
| **listing_name** | **String** |  | [optional] |
| **status** | **String** | OPEN or CLOSED, as Airbnb reports it. |  |
| **reason** | **String** | Why the resolution was opened. | [optional] |
| **case_status** | **String** | Airbnb&#39;s case-status label. | [optional] |
| **status_text** | **String** | Human-readable status detail. | [optional] |
| **suggested_action_text** | **String** | Airbnb&#39;s hint on whose turn it is to act next — track progress with it. | [optional] |
| **customer_support_initiated** | **Boolean** | True when Airbnb Customer Support (not the host/guest) opened the case. | [optional] |
| **product_type** | **String** |  | [optional] |
| **initiator** | **Object** | Who opened the case (id + name). | [optional] |
| **responder** | **Object** | Who responds (id + name). | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |
| **synced_at** | **Time** | When Repull last refreshed this case from Airbnb. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Resolution.new(
  resolution_id: CLSF-06464054,
  confirmation_code: HMZKMYCBC5,
  reservation_id: null,
  listing_name: null,
  status: OPEN,
  reason: null,
  case_status: null,
  status_text: null,
  suggested_action_text: null,
  customer_support_initiated: null,
  product_type: null,
  initiator: null,
  responder: null,
  created_at: null,
  updated_at: null,
  synced_at: null
)
```

