# Repull::UpdateVrboListingWelcomeGuideRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **check_in** | [**UpdateVrboListingWelcomeGuideRequestCheckIn**](UpdateVrboListingWelcomeGuideRequestCheckIn.md) |  | [optional] |
| **check_out** | [**UpdateVrboListingWelcomeGuideRequestCheckIn**](UpdateVrboListingWelcomeGuideRequestCheckIn.md) |  | [optional] |
| **driving_directions** | [**UpdateVrboListingWelcomeGuideRequestCheckIn**](UpdateVrboListingWelcomeGuideRequestCheckIn.md) |  | [optional] |
| **parking_directions** | [**UpdateVrboListingWelcomeGuideRequestCheckIn**](UpdateVrboListingWelcomeGuideRequestCheckIn.md) |  | [optional] |
| **wifi** | [**UpdateVrboListingWelcomeGuideRequestWifi**](UpdateVrboListingWelcomeGuideRequestWifi.md) |  | [optional] |
| **access** | [**UpdateVrboListingWelcomeGuideRequestAccess**](UpdateVrboListingWelcomeGuideRequestAccess.md) |  | [optional] |
| **amenities** | [**Hash&lt;String, UpdateVrboListingWelcomeGuideRequestCheckIn&gt;**](UpdateVrboListingWelcomeGuideRequestCheckIn.md) | &#x60;{AMENITY_ID: {instructions}}&#x60; — notes are one-way (not removable). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingWelcomeGuideRequest.new(
  check_in: null,
  check_out: null,
  driving_directions: null,
  parking_directions: null,
  wifi: null,
  access: null,
  amenities: null
)
```

