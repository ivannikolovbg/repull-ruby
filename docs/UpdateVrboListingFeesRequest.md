# Repull::UpdateVrboListingFeesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cleaning** | [**UpdateVrboListingFeesRequestCleaning**](UpdateVrboListingFeesRequestCleaning.md) |  | [optional] |
| **pets** | [**UpdateVrboListingFeesRequestCleaning**](UpdateVrboListingFeesRequestCleaning.md) |  | [optional] |
| **extra_guests** | [**UpdateVrboListingFeesRequestExtraGuests**](UpdateVrboListingFeesRequestExtraGuests.md) |  | [optional] |
| **custom** | [**Array&lt;UpdateVrboListingFeesRequestCustomInner&gt;**](UpdateVrboListingFeesRequestCustomInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingFeesRequest.new(
  cleaning: null,
  pets: null,
  extra_guests: null,
  custom: null
)
```

