# Repull::UpdateBookingAvailability200Response

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::UpdateBookingAvailability200Response.openapi_one_of
# =>
# [
#   :'BookingDerivedPricingWriteResponse',
#   :'BookingPricingUpdateResponse',
#   :'BookingRestrictionWriteResponse'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::UpdateBookingAvailability200Response.build(data)
# => #<BookingDerivedPricingWriteResponse:0x00007fdd4aab02a0>

Repull::UpdateBookingAvailability200Response.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `BookingDerivedPricingWriteResponse`
- `BookingPricingUpdateResponse`
- `BookingRestrictionWriteResponse`
- `nil` (if no type matches)

