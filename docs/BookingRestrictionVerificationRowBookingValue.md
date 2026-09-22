# Repull::BookingRestrictionVerificationRowBookingValue

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::BookingRestrictionVerificationRowBookingValue.openapi_one_of
# =>
# [
#   :'Boolean',
#   :'Integer'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::BookingRestrictionVerificationRowBookingValue.build(data)
# => #<Boolean:0x00007fdd4aab02a0>

Repull::BookingRestrictionVerificationRowBookingValue.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `Boolean`
- `Integer`
- `nil` (if no type matches)

