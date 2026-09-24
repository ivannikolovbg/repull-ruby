# Repull::MigrationCounts

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listings** | **Integer** |  | [optional] |
| **reservations** | **Integer** |  | [optional] |
| **upcoming_reservations** | **Integer** |  | [optional] |
| **guests** | **Integer** |  | [optional] |
| **conversations** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MigrationCounts.new(
  listings: null,
  reservations: null,
  upcoming_reservations: null,
  guests: null,
  conversations: null
)
```

