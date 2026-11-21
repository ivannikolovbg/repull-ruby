# Repull::UpdateVrboListingRoomRequestAmenities

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::UpdateVrboListingRoomRequestAmenities.openapi_one_of
# =>
# [
#   :'Array<UpdateVrboListingRoomRequestAmenitiesOneOfInner>',
#   :'Hash<String, Object>'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::UpdateVrboListingRoomRequestAmenities.build(data)
# => #<Array<UpdateVrboListingRoomRequestAmenitiesOneOfInner>:0x00007fdd4aab02a0>

Repull::UpdateVrboListingRoomRequestAmenities.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `Array<UpdateVrboListingRoomRequestAmenitiesOneOfInner>`
- `Hash<String, Object>`
- `nil` (if no type matches)

