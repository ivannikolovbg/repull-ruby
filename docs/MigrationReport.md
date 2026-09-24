# Repull::MigrationReport

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **String** |  | [optional] |
| **generated_at** | **Time** |  | [optional] |
| **capabilities** | **Hash&lt;String, Object&gt;** | Per source provider: what it can carry, per entity — &#x60;{ read: { listings: { level, notes } … }, write: { … } }&#x60;, level &#x60;full&#x60; | &#x60;partial&#x60; | &#x60;none&#x60;. | [optional] |
| **issues** | [**Array&lt;MigrationReportIssuesInner&gt;**](MigrationReportIssuesInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MigrationReport.new(
  workspace_id: null,
  generated_at: null,
  capabilities: null,
  issues: null
)
```

