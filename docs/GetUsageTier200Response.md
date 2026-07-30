# Repull::GetUsageTier200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tier** | **String** |  | [optional] |
| **limits** | [**GetUsageTier200ResponseLimits**](GetUsageTier200ResponseLimits.md) |  | [optional] |
| **used** | [**GetUsageTier200ResponseUsed**](GetUsageTier200ResponseUsed.md) |  | [optional] |
| **remaining** | [**GetUsageTier200ResponseRemaining**](GetUsageTier200ResponseRemaining.md) |  | [optional] |
| **resets_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetUsageTier200Response.new(
  tier: null,
  limits: null,
  used: null,
  remaining: null,
  resets_at: null
)
```

