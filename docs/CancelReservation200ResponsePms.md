# Repull::CancelReservation200ResponsePms

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** |  | [optional] |
| **applied** | **Array&lt;String&gt;** |  | [optional] |
| **errors** | [**Array&lt;CancelReservation200ResponsePmsErrorsInner&gt;**](CancelReservation200ResponsePmsErrorsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CancelReservation200ResponsePms.new(
  provider: mews,
  applied: null,
  errors: null
)
```

