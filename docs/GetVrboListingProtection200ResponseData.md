# Repull::GetVrboListingProtection200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **currency** | **String** |  | [optional] |
| **damage_coverage_enabled** | **Boolean** |  | [optional] |
| **damage_deposit** | **Object** |  | [optional] |
| **damage_protection** | **Object** |  | [optional] |
| **options** | [**Array&lt;GetVrboListingContent200ResponseSectionsProtectionOptionsInner&gt;**](GetVrboListingContent200ResponseSectionsProtectionOptionsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingProtection200ResponseData.new(
  currency: null,
  damage_coverage_enabled: null,
  damage_deposit: null,
  damage_protection: null,
  options: null
)
```

