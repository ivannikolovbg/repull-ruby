# Repull::AvailabilityWriteResultSynced

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **attempted** | **Integer** |  | [optional] |
| **succeeded** | **Integer** |  | [optional] |
| **failed** | **Integer** |  | [optional] |
| **auth_errors** | **Integer** | Channels whose token has expired — these need reconnecting, not retrying. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AvailabilityWriteResultSynced.new(
  attempted: null,
  succeeded: null,
  failed: null,
  auth_errors: null
)
```

