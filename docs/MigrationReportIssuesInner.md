# Repull::MigrationReportIssuesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **severity** | **String** |  | [optional] |
| **entity** | **String** |  | [optional] |
| **code** | **String** |  | [optional] |
| **message** | **String** |  | [optional] |
| **count** | **Integer** |  | [optional] |
| **sample_ids** | **Array&lt;Integer&gt;** | Up to 10 affected listing / reservation ids. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MigrationReportIssuesInner.new(
  severity: null,
  entity: reservations,
  code: reservation_missing_guest_contact,
  message: null,
  count: null,
  sample_ids: null
)
```

