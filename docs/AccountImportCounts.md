# Repull::AccountImportCounts

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listings** | **Integer** |  | [optional] |
| **reservations** | **Integer** |  | [optional] |
| **conversations** | **Integer** |  | [optional] |
| **messages** | **Integer** |  | [optional] |
| **reviews** | **Integer** |  | [optional] |
| **payments** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AccountImportCounts.new(
  listings: null,
  reservations: null,
  conversations: null,
  messages: null,
  reviews: null,
  payments: null
)
```

