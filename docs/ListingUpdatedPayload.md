# Repull::ListingUpdatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**ListingWebhookObject**](ListingWebhookObject.md) |  |  |
| **area** | **String** | Which part moved. Airbnb sends one notification per area rather than a diff, so this is the signal for what to re-read. | [optional] |
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

