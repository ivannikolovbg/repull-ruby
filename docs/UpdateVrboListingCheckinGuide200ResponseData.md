# Repull::UpdateVrboListingCheckinGuide200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **check_in** | [**GetVrboListingContent200ResponseSectionsCheckinGuideCheckIn**](GetVrboListingContent200ResponseSectionsCheckinGuideCheckIn.md) |  | [optional] |
| **check_out** | [**GetVrboListingContent200ResponseSectionsCheckinGuideCheckIn**](GetVrboListingContent200ResponseSectionsCheckinGuideCheckIn.md) |  | [optional] |
| **driving_directions** | [**GetVrboListingContent200ResponseSectionsCheckinGuideCheckIn**](GetVrboListingContent200ResponseSectionsCheckinGuideCheckIn.md) |  | [optional] |
| **parking_directions** | [**GetVrboListingContent200ResponseSectionsCheckinGuideCheckIn**](GetVrboListingContent200ResponseSectionsCheckinGuideCheckIn.md) |  | [optional] |
| **access** | [**GetVrboListingContent200ResponseSectionsCheckinGuideAccess**](GetVrboListingContent200ResponseSectionsCheckinGuideAccess.md) |  | [optional] |
| **wifi** | [**GetVrboListingContent200ResponseSectionsCheckinGuideWifi**](GetVrboListingContent200ResponseSectionsCheckinGuideWifi.md) |  | [optional] |
| **amenities** | [**Hash&lt;String, GetVrboListingContent200ResponseSectionsCheckinGuideCheckIn&gt;**](GetVrboListingContent200ResponseSectionsCheckinGuideCheckIn.md) | Keyed by Vrbo amenity id (e.g. HOT_TUB_HOSPITALITY). | [optional] |
| **contacts** | [**Array&lt;GetVrboListingContent200ResponseSectionsCheckinGuideContactsInner&gt;**](GetVrboListingContent200ResponseSectionsCheckinGuideContactsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingCheckinGuide200ResponseData.new(
  check_in: null,
  check_out: null,
  driving_directions: null,
  parking_directions: null,
  access: null,
  wifi: null,
  amenities: null,
  contacts: null
)
```

