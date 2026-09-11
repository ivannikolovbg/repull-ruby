# Repull::ReviewWebhookObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull-internal review id. Pass to &#x60;GET /v1/reviews/{id}&#x60;. |  |
| **channel** | **String** | Source channel the review came from. |  |
| **listing_id** | **Integer** | Repull listing id the review is about. | [optional] |
| **reservation_id** | **Integer** | Repull reservation id the review is attached to, if known. | [optional] |
| **customer_id** | **Integer** | Workspace (customer) id. |  |
| **reviewer_role** | **String** | Who wrote the review — &#x60;guest&#x60; (about the host/property) or &#x60;host&#x60; (about the guest). |  |
| **rating** | **Integer** | Overall star rating, if present. | [optional] |
| **submitted_at** | **Time** | When the review was submitted on the source channel. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReviewWebhookObject.new(
  id: 90210,
  channel: airbnb,
  listing_id: 5668,
  reservation_id: 215906,
  customer_id: 1,
  reviewer_role: guest,
  rating: 5,
  submitted_at: 2026-05-01T09:00Z
)
```

