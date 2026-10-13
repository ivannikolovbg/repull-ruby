# Repull::CreateBillingCheckout200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **plan** | **String** |  | [optional] |
| **checkout_url** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateBillingCheckout200Response.new(
  plan: starter,
  checkout_url: https://repull.dev/dashboard/settings
)
```

