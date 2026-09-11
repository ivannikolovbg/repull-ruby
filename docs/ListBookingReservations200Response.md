# Repull::ListBookingReservations200Response

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::ListBookingReservations200Response.openapi_one_of
# =>
# [
#   :'BookingReservation',
#   :'Hash<String, Object>'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::ListBookingReservations200Response.build(data)
# => #<BookingReservation:0x00007fdd4aab02a0>

Repull::ListBookingReservations200Response.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `BookingReservation`
- `Hash<String, Object>`
- `nil` (if no type matches)

