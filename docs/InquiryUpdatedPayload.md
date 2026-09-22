# Repull::InquiryUpdatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**InquiryWebhookObject**](InquiryWebhookObject.md) |  |  |
| **previous_attributes** | **Hash&lt;String, Object&gt;** | Keys of &#x60;object&#x60; that moved (&#x60;status&#x60;, &#x60;checkIn&#x60;, &#x60;checkOut&#x60;, &#x60;guests&#x60;, &#x60;reservationId&#x60;), mapped to their prior values. |  |
| **occurred_at** | **Time** |  | [optional] |
| **revision** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::InquiryUpdatedPayload.new(
  object: null,
  previous_attributes: {&quot;status&quot;:&quot;open&quot;},
  occurred_at: null,
  revision: null
)
```

