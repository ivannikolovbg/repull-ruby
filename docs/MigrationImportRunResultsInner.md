# Repull::MigrationImportRunResultsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **entity_type** | **String** |  | [optional] |
| **processed** | **Integer** |  | [optional] |
| **errors** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MigrationImportRunResultsInner.new(
  entity_type: listings,
  processed: null,
  errors: null
)
```

