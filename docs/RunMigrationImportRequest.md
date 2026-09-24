# Repull::RunMigrationImportRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **entities** | **Array&lt;String&gt;** | Defaults to listings and reservations. | [optional] |
| **since** | **Time** | Only reservations changed after this. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::RunMigrationImportRequest.new(
  entities: null,
  since: null
)
```

