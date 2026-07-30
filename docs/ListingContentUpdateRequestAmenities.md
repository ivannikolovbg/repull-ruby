# Repull::ListingContentUpdateRequestAmenities

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::ListingContentUpdateRequestAmenities.openapi_one_of
# =>
# [
#   :'Array<ListingContentUpdateRequestAmenitiesOneOfInner>',
#   :'Array<String>'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::ListingContentUpdateRequestAmenities.build(data)
# => #<Array<ListingContentUpdateRequestAmenitiesOneOfInner>:0x00007fdd4aab02a0>

Repull::ListingContentUpdateRequestAmenities.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `Array<ListingContentUpdateRequestAmenitiesOneOfInner>`
- `Array<String>`
- `nil` (if no type matches)

