# Repull::BookingAvailabilityUpdateRequestUpdatesInner

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::BookingAvailabilityUpdateRequestUpdatesInner.openapi_one_of
# =>
# [
#   :'BookingAvailabilityUpdate',
#   :'BookingPricingRateUpdate'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::BookingAvailabilityUpdateRequestUpdatesInner.build(data)
# => #<BookingAvailabilityUpdate:0x00007fdd4aab02a0>

Repull::BookingAvailabilityUpdateRequestUpdatesInner.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `BookingAvailabilityUpdate`
- `BookingPricingRateUpdate`
- `nil` (if no type matches)

