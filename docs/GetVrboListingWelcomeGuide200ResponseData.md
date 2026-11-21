# Repull::GetVrboListingWelcomeGuide200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **check_in** | [**GetVrboListingContent200ResponseSectionsWelcomeGuideCheckIn**](GetVrboListingContent200ResponseSectionsWelcomeGuideCheckIn.md) |  | [optional] |
| **check_out** | [**GetVrboListingContent200ResponseSectionsWelcomeGuideCheckIn**](GetVrboListingContent200ResponseSectionsWelcomeGuideCheckIn.md) |  | [optional] |
| **driving_directions** | [**GetVrboListingContent200ResponseSectionsWelcomeGuideCheckIn**](GetVrboListingContent200ResponseSectionsWelcomeGuideCheckIn.md) |  | [optional] |
| **parking_directions** | [**GetVrboListingContent200ResponseSectionsWelcomeGuideCheckIn**](GetVrboListingContent200ResponseSectionsWelcomeGuideCheckIn.md) |  | [optional] |
| **access** | [**GetVrboListingContent200ResponseSectionsWelcomeGuideAccess**](GetVrboListingContent200ResponseSectionsWelcomeGuideAccess.md) |  | [optional] |
| **wifi** | [**GetVrboListingContent200ResponseSectionsWelcomeGuideWifi**](GetVrboListingContent200ResponseSectionsWelcomeGuideWifi.md) |  | [optional] |
| **amenities** | [**Hash&lt;String, GetVrboListingContent200ResponseSectionsWelcomeGuideCheckIn&gt;**](GetVrboListingContent200ResponseSectionsWelcomeGuideCheckIn.md) | Keyed by Vrbo amenity id (e.g. HOT_TUB_HOSPITALITY). | [optional] |
| **contacts** | [**Array&lt;GetVrboListingContent200ResponseSectionsWelcomeGuideContactsInner&gt;**](GetVrboListingContent200ResponseSectionsWelcomeGuideContactsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingWelcomeGuide200ResponseData.new(
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

