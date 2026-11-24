# Repull::AccountImport

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The import id — the &#x60;importId&#x60; on &#x60;account.import.*&#x60; webhooks. | [optional] |
| **status** | **String** |  | [optional] |
| **trigger** | **String** |  | [optional] |
| **outcome** | **String** | &#x60;completed&#x60; imports only: &#x60;partial&#x60; when some units failed (see &#x60;stages&#x60;). | [optional] |
| **reason** | **String** | &#x60;failed&#x60; imports only: why it stopped — e.g. &#x60;needs_permissions&#x60;, &#x60;duplicate_account&#x60;, &#x60;stalled&#x60; (stopped reporting progress), &#x60;did_not_start&#x60; (queued, but no worker picked it up within 10 minutes: start it again with &#x60;POST /v1/connections/{id}/imports&#x60;), &#x60;queue_failed&#x60; (could not be queued). | [optional] |
| **started_at** | **Time** |  | [optional] |
| **last_activity_at** | **Time** |  | [optional] |
| **completed_at** | **Time** |  | [optional] |
| **stages** | [**Array&lt;AccountImportStage&gt;**](AccountImportStage.md) |  | [optional] |
| **counts** | [**AccountImportCounts**](AccountImportCounts.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AccountImport.new(
  id: null,
  status: null,
  trigger: null,
  outcome: null,
  reason: null,
  started_at: null,
  last_activity_at: null,
  completed_at: null,
  stages: null,
  counts: null
)
```

