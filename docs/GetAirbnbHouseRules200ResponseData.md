# Repull::GetAirbnbHouseRules200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **check_in_time** | **String** | Earliest check-in, &#x60;HH:00&#x60; or &#x60;FLEXIBLE&#x60;. | [optional] |
| **check_in_time_end** | **String** | Latest check-in (Airbnb only). | [optional] |
| **check_out_time** | **String** |  | [optional] |
| **max_guests** | **Integer** |  | [optional] |
| **children** | [**GetAirbnbHouseRules200ResponseDataChildren**](GetAirbnbHouseRules200ResponseDataChildren.md) |  | [optional] |
| **infants** | [**GetAirbnbHouseRules200ResponseDataChildren**](GetAirbnbHouseRules200ResponseDataChildren.md) |  | [optional] |
| **pets** | [**GetAirbnbHouseRules200ResponseDataChildren**](GetAirbnbHouseRules200ResponseDataChildren.md) |  | [optional] |
| **smoking** | [**GetAirbnbHouseRules200ResponseDataChildren**](GetAirbnbHouseRules200ResponseDataChildren.md) |  | [optional] |
| **events** | [**GetAirbnbHouseRules200ResponseDataChildren**](GetAirbnbHouseRules200ResponseDataChildren.md) |  | [optional] |
| **expectations** | **Array&lt;Hash&lt;String, Object&gt;&gt;** |  | [optional] |
| **house_rules** | [**Array&lt;GetAirbnbHouseRules200ResponseDataHouseRulesInner&gt;**](GetAirbnbHouseRules200ResponseDataHouseRulesInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbHouseRules200ResponseData.new(
  check_in_time: 16:00,
  check_in_time_end: 22:00,
  check_out_time: 11:00,
  max_guests: null,
  children: null,
  infants: null,
  pets: null,
  smoking: null,
  events: null,
  expectations: null,
  house_rules: null
)
```

