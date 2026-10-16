# Repull::ListingUpdatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**ListingWebhookObject**](ListingWebhookObject.md) |  |  |
| **area** | **String** | Which part moved. Airbnb sends one notification per area rather than a diff, so this is the signal for what to re-read. &#x60;promotions&#x60;: the listing’s Airbnb or Booking.com promotions changed — re-read &#x60;GET /v1/listings/{id}/promotions&#x60;. | [optional] |
| **previous_attributes** | **Hash&lt;String, Object&gt;** | Fields that changed and their prior values, when the source reports them. | [optional] |
| **revision** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingUpdatedPayload.new(
  object: null,
  area: content,
  previous_attributes: null,
  revision: null
)
```

