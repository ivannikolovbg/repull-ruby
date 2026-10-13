# Repull::GetBilling200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **plan** | **String** |  | [optional] |
| **limits** | [**GetBilling200ResponseLimits**](GetBilling200ResponseLimits.md) |  | [optional] |
| **used** | [**GetBilling200ResponseUsed**](GetBilling200ResponseUsed.md) |  | [optional] |
| **resets_at** | **Time** |  | [optional] |
| **manage_url** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetBilling200Response.new(
  plan: starter,
  limits: null,
  used: null,
  resets_at: null,
  manage_url: https://repull.dev/dashboard/settings
)
```

