# Repull::GetVrboListingContent200ResponseSectionsCancellation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **policy_type** | **String** |  | [optional] |
| **tiers** | [**Array&lt;GetVrboListingCancellation200ResponseDataTiersInner&gt;**](GetVrboListingCancellation200ResponseDataTiersInner.md) |  | [optional] |
| **seasonal** | **Array&lt;Hash&lt;String, Object&gt;&gt;** |  | [optional] |
| **options** | [**Array&lt;GetVrboListingCancellation200ResponseDataOptionsInner&gt;**](GetVrboListingCancellation200ResponseDataOptionsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingContent200ResponseSectionsCancellation.new(
  policy_type: null,
  tiers: null,
  seasonal: null,
  options: null
)
```

