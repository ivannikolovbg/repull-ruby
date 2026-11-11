# Repull::PublishListingToVrboRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The Vrbo account, as its connection id (&#x60;\&quot;vrbo:13\&quot;&#x60;) or the bare number. Needed only when the workspace has several. | [optional] |
| **property_id** | **String** | Finish this unpublished Vrbo property (from a failed run&#39;s &#x60;job.propertyId&#x60;) instead of starting a new one. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PublishListingToVrboRequest.new(
  account_id: null,
  property_id: null
)
```

