# Repull::GetVrboListingAvailability200ResponseData

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::GetVrboListingAvailability200ResponseData.openapi_one_of
# =>
# [
#   :'Array<GetVrboListingAvailability200ResponseDataOneOfInner>',
#   :'GetVrboListingAvailability200ResponseDataOneOf'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::GetVrboListingAvailability200ResponseData.build(data)
# => #<Array<GetVrboListingAvailability200ResponseDataOneOfInner>:0x00007fdd4aab02a0>

Repull::GetVrboListingAvailability200ResponseData.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `Array<GetVrboListingAvailability200ResponseDataOneOfInner>`
- `GetVrboListingAvailability200ResponseDataOneOf`
- `nil` (if no type matches)

