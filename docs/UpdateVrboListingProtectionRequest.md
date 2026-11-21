# Repull::UpdateVrboListingProtectionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **damage_deposit** | [**UpdateVrboListingProtectionRequestDamageDeposit**](UpdateVrboListingProtectionRequestDamageDeposit.md) |  | [optional] |
| **damage_protection** | **Object** | In Vrbo&#39;s shape, as the read returns it. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingProtectionRequest.new(
  damage_deposit: null,
  damage_protection: null
)
```

