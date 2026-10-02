# Repull::AirbnbListingDetailsWriteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_type_group** | **String** | The coarse building family. | [optional] |
| **property_type_category** | **String** | The specific type inside the group, e.g. &#x60;apartment&#x60;, &#x60;condominium&#x60;, &#x60;townhouse&#x60;, &#x60;guesthouse&#x60;. Airbnb validates it against the group, so send both when you are changing the kind of property. | [optional] |
| **room_type_category** | **String** | What the guest gets of the property. | [optional] |
| **quiet_hours** | [**Array&lt;AirbnbListingDetailsWriteRequestQuietHoursInner&gt;**](AirbnbListingDetailsWriteRequestQuietHoursInner.md) | Whole hours on a 24h clock, as strings. | [optional] |
| **check_in_option** | [**AirbnbListingDetailsWriteRequestCheckInOption**](AirbnbListingDetailsWriteRequestCheckInOption.md) |  | [optional] |
| **house_manual** | **String** | The house manual guests see after booking. | [optional] |
| **directions** | **String** | Directions to the property, shown to booked guests. | [optional] |
| **wifi_network** | **String** | Wi-Fi network name. | [optional] |
| **wifi_password** | **String** | Wi-Fi password. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbListingDetailsWriteRequest.new(
  property_type_group: null,
  property_type_category: null,
  room_type_category: null,
  quiet_hours: null,
  check_in_option: null,
  house_manual: null,
  directions: null,
  wifi_network: null,
  wifi_password: null
)
```

