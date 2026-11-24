# Repull::StartConnectionImport202ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **connection** | **String** | The connection handle, e.g. &#x60;airbnb:1234567&#x60;. |  |
| **scope** | **String** |  |  |
| **status** | **String** |  |  |
| **queued_at** | **Time** |  |  |
| **import_id** | **String** | The import&#39;s id on &#x60;GET /v1/connections/{id}/imports&#x60; and in the &#x60;account.import.*&#x60; webhooks. |  |
| **replaced_import_id** | **String** | &#x60;full&#x60; only: an earlier import of this account that no worker had picked up, closed as &#x60;failed&#x60; (&#x60;did_not_start&#x60;) and replaced by this one. |  |

## Example

```ruby
require 'repull'

instance = Repull::StartConnectionImport202ResponseData.new(
  connection: null,
  scope: null,
  status: null,
  queued_at: null,
  import_id: null,
  replaced_import_id: null
)
```

