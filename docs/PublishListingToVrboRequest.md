# Repull::PublishListingToVrboRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The Vrbo account, as its handle (&#x60;\&quot;vrbo:7001234\&quot;&#x60;, Vrbo&#39;s own account id) or the bare id. Needed only when the workspace has several. The old sign-in ids (&#x60;\&quot;vrbo:13\&quot;&#x60;) still resolve until 2027-02-12. | [optional] |
| **property_id** | **String** | Finish this unpublished Vrbo property (from a failed run&#39;s &#x60;job.propertyId&#x60;) instead of starting a new one. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PublishListingToVrboRequest.new(
  account_id: null,
  property_id: null
)
```

