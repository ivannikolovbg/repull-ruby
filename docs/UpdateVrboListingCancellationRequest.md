# Repull::UpdateVrboListingCancellationRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **policy_type** | **String** | POLICY_TYPE_VR_RELAXED (14/7 days), _MODERATE (30/14), _FIRM (60/30), _STRICT (60), … or POLICY_TYPE_CUSTOM with &#x60;tiers&#x60;. The read lists Vrbo&#39;s named policies in &#x60;options&#x60;. |  |
| **tiers** | [**Array&lt;UpdateVrboListingCancellationRequestTiersInner&gt;**](UpdateVrboListingCancellationRequestTiersInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingCancellationRequest.new(
  policy_type: POLICY_TYPE_VR_MODERATE,
  tiers: null
)
```

