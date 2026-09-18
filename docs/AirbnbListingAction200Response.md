# Repull::AirbnbListingAction200Response

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::AirbnbListingAction200Response.openapi_one_of
# =>
# [
#   :'AirbnbListingAction200ResponseOneOf',
#   :'AirbnbListingAction200ResponseOneOf1',
#   :'AirbnbListingLifecycleResponse'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::AirbnbListingAction200Response.build(data)
# => #<AirbnbListingAction200ResponseOneOf:0x00007fdd4aab02a0>

Repull::AirbnbListingAction200Response.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `AirbnbListingAction200ResponseOneOf`
- `AirbnbListingAction200ResponseOneOf1`
- `AirbnbListingLifecycleResponse`
- `nil` (if no type matches)

