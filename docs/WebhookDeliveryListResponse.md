# Repull::WebhookDeliveryListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;WebhookDelivery&gt;**](WebhookDelivery.md) |  | [optional] |
| **pagination** | [**WebhookDeliveryListResponsePagination**](WebhookDeliveryListResponsePagination.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::WebhookDeliveryListResponse.new(
  data: null,
  pagination: null
)
```

