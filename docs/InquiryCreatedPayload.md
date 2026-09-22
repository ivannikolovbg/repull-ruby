# Repull::InquiryCreatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**InquiryWebhookObject**](InquiryWebhookObject.md) |  |  |
| **occurred_at** | **Time** |  | [optional] |
| **revision** | **Time** | The inquiry&#39;s &#x60;updatedAt&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::InquiryCreatedPayload.new(
  object: null,
  occurred_at: null,
  revision: null
)
```

