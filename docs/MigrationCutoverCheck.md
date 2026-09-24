# Repull::MigrationCutoverCheck

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **String** |  | [optional] |
| **checked_at** | **Time** |  | [optional] |
| **matched** | **Integer** |  | [optional] |
| **missing** | [**Array&lt;MigrationReservationRef&gt;**](MigrationReservationRef.md) | Upcoming in the source, absent from the destination. | [optional] |
| **extra** | [**Array&lt;MigrationReservationRef&gt;**](MigrationReservationRef.md) | In the destination, not an upcoming reservation in the source. | [optional] |
| **mismatched** | [**Array&lt;MigrationCutoverCheckMismatchedInner&gt;**](MigrationCutoverCheckMismatchedInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MigrationCutoverCheck.new(
  workspace_id: null,
  checked_at: null,
  matched: null,
  missing: null,
  extra: null,
  mismatched: null
)
```

