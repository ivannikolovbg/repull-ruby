# Repull::ReservationAccessCodeLocksInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The lock&#39;s id in the PMS. |  |
| **name** | **String** |  |  |
| **provider** | **String** | The lock brand, as the PMS names it. |  |

## Example

```ruby
require 'repull'

instance = Repull::ReservationAccessCodeLocksInner.new(
  id: 64f0c1aa2b3c4d5e6f708192,
  name: Front door,
  provider: schlage
)
```

