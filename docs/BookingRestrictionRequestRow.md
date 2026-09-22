# Repull::BookingRestrictionRequestRow

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **index** | **Integer** | Position of the update in the request &#x60;updates[]&#x60;. | [optional] |
| **room_id** | **String** |  | [optional] |
| **rate_id** | **String** |  | [optional] |
| **start** | **Date** | First night, inclusive. | [optional] |
| **_end** | **Date** | Last night, inclusive. | [optional] |
| **fields** | **Array&lt;String&gt;** | The restrictions stated for these nights. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRestrictionRequestRow.new(
  index: null,
  room_id: null,
  rate_id: null,
  start: null,
  _end: null,
  fields: null
)
```

