# Repull::ListingCreatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **title** | **String** |  | [optional] |
| **address** | [**ListingCreatedPayloadAddress**](ListingCreatedPayloadAddress.md) |  | [optional] |
| **bedrooms** | **Integer** |  | [optional] |
| **bathrooms** | **Float** |  | [optional] |
| **max_guests** | **Integer** |  | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingCreatedPayload.new(
  id: 6250,
  title: Lakeview Loft — Example City,
  address: null,
  bedrooms: 2,
  bathrooms: 2,
  max_guests: 6,
  created_at: 2026-05-01T12:00Z
)
```

