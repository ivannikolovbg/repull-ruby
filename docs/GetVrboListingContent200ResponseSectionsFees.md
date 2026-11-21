# Repull::GetVrboListingContent200ResponseSectionsFees

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **currency** | **String** |  | [optional] |
| **cleaning** | [**GetVrboListingContent200ResponseSectionsFeesCleaning**](GetVrboListingContent200ResponseSectionsFeesCleaning.md) |  | [optional] |
| **pets** | [**GetVrboListingContent200ResponseSectionsFeesCleaning**](GetVrboListingContent200ResponseSectionsFeesCleaning.md) |  | [optional] |
| **extra_guests** | [**GetVrboListingContent200ResponseSectionsFeesExtraGuests**](GetVrboListingContent200ResponseSectionsFeesExtraGuests.md) |  | [optional] |
| **custom** | [**Array&lt;GetVrboListingContent200ResponseSectionsFeesCustomInner&gt;**](GetVrboListingContent200ResponseSectionsFeesCustomInner.md) |  | [optional] |
| **custom_fee_codes** | **Array&lt;String&gt;** |  | [optional] |
| **fee_types** | **Array&lt;String&gt;** |  | [optional] |
| **extra_guest_fee_types** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingContent200ResponseSectionsFees.new(
  currency: null,
  cleaning: null,
  pets: null,
  extra_guests: null,
  custom: null,
  custom_fee_codes: null,
  fee_types: null,
  extra_guest_fee_types: null
)
```

