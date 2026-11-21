# Repull::UpdateVrboListingCheckinGuideRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **check_in** | [**UpdateVrboListingCheckinGuideRequestCheckIn**](UpdateVrboListingCheckinGuideRequestCheckIn.md) |  | [optional] |
| **check_out** | [**UpdateVrboListingCheckinGuideRequestCheckIn**](UpdateVrboListingCheckinGuideRequestCheckIn.md) |  | [optional] |
| **driving_directions** | [**UpdateVrboListingCheckinGuideRequestCheckIn**](UpdateVrboListingCheckinGuideRequestCheckIn.md) |  | [optional] |
| **parking_directions** | [**UpdateVrboListingCheckinGuideRequestCheckIn**](UpdateVrboListingCheckinGuideRequestCheckIn.md) |  | [optional] |
| **wifi** | [**UpdateVrboListingCheckinGuideRequestWifi**](UpdateVrboListingCheckinGuideRequestWifi.md) |  | [optional] |
| **access** | [**UpdateVrboListingCheckinGuideRequestAccess**](UpdateVrboListingCheckinGuideRequestAccess.md) |  | [optional] |
| **amenities** | [**Hash&lt;String, UpdateVrboListingCheckinGuideRequestCheckIn&gt;**](UpdateVrboListingCheckinGuideRequestCheckIn.md) | &#x60;{AMENITY_ID: {instructions}}&#x60; — notes are one-way (not removable). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingCheckinGuideRequest.new(
  check_in: null,
  check_out: null,
  driving_directions: null,
  parking_directions: null,
  wifi: null,
  access: null,
  amenities: null
)
```

