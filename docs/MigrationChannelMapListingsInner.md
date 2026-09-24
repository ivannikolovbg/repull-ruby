# Repull::MigrationChannelMapListingsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** | The property in this workspace, when it came across. | [optional] |
| **name** | **String** |  | [optional] |
| **provider** | **String** |  | [optional] |
| **external_listing_id** | **String** | The listing id in the source PMS. | [optional] |
| **airbnb** | [**MigrationChannelMapListingsInnerAirbnb**](MigrationChannelMapListingsInnerAirbnb.md) |  | [optional] |
| **booking** | [**MigrationChannelMapListingsInnerBooking**](MigrationChannelMapListingsInnerBooking.md) |  | [optional] |
| **vrbo** | [**MigrationChannelMapListingsInnerAirbnb**](MigrationChannelMapListingsInnerAirbnb.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MigrationChannelMapListingsInner.new(
  listing_id: null,
  name: null,
  provider: null,
  external_listing_id: null,
  airbnb: null,
  booking: null,
  vrbo: null
)
```

