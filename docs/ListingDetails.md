# Repull::ListingDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_type** | **String** | Specific property type (e.g. &#x60;apartment&#x60;, &#x60;townhouse&#x60;, &#x60;cabin&#x60;). | [optional] |
| **property_type_category** | **String** | Coarser grouping above propertyType (e.g. &#x60;house&#x60;, &#x60;apartment&#x60;). | [optional] |
| **room_type_category** | **String** | Sleeping arrangement (e.g. &#x60;entire_home&#x60;, &#x60;private_room&#x60;, &#x60;shared_room&#x60;). | [optional] |
| **bedrooms** | **Integer** |  | [optional] |
| **bathrooms** | **String** | Numeric value carried as a string to preserve fractional bathrooms (e.g. &#x60;\&quot;1.5\&quot;&#x60;). | [optional] |
| **beds** | **Integer** |  | [optional] |
| **person_capacity** | **Integer** | Maximum guest capacity. | [optional] |
| **check_in_time_start** | **String** | Earliest check-in time, free-form (e.g. &#x60;\&quot;15:00\&quot;&#x60;, &#x60;\&quot;3 PM\&quot;&#x60;, &#x60;\&quot;flexible\&quot;&#x60;). | [optional] |
| **check_in_time_end** | **String** | Latest check-in time. | [optional] |
| **check_out_time** | **String** | Check-out time. | [optional] |
| **min_nights** | **Integer** |  | [optional] |
| **max_nights** | **Integer** |  | [optional] |
| **advance_booking_days** | **Integer** | How far in advance bookings are allowed. | [optional] |
| **turnover_days** | **Integer** | Required gap (in days) between consecutive bookings. | [optional] |
| **wifi_network** | **String** |  | [optional] |
| **wifi_password** | **String** |  | [optional] |
| **house_manual** | **String** | Long-form house manual / welcome guide. | [optional] |
| **directions** | **String** | Long-form arrival directions. | [optional] |
| **property_size** | **Object** | Structured size info (JSON; e.g. &#x60;{ \&quot;value\&quot;: 65, \&quot;unit\&quot;: \&quot;sqm\&quot; }&#x60;). Shape evolves with the listings_details schema. | [optional] |
| **year_built** | **Integer** |  | [optional] |
| **number_of_floors** | **Integer** | Total floors in the building. | [optional] |
| **listing_floor** | **Integer** | Which floor the listing is on. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingDetails.new(
  property_type: null,
  property_type_category: null,
  room_type_category: null,
  bedrooms: null,
  bathrooms: null,
  beds: null,
  person_capacity: null,
  check_in_time_start: null,
  check_in_time_end: null,
  check_out_time: null,
  min_nights: null,
  max_nights: null,
  advance_booking_days: null,
  turnover_days: null,
  wifi_network: null,
  wifi_password: null,
  house_manual: null,
  directions: null,
  property_size: null,
  year_built: null,
  number_of_floors: null,
  listing_floor: null
)
```

