# Repull::ImportFromChannex200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **environment** | **String** |  | [optional] |
| **dry_run** | **Boolean** |  | [optional] |
| **complete** | **Boolean** | False when the time budget ran out; run the same request again to continue. | [optional] |
| **started_at** | **Time** |  | [optional] |
| **finished_at** | **Time** |  | [optional] |
| **summary** | [**ImportFromChannex200ResponseDataSummary**](ImportFromChannex200ResponseDataSummary.md) |  | [optional] |
| **properties** | [**Array&lt;ImportFromChannex200ResponseDataPropertiesInner&gt;**](ImportFromChannex200ResponseDataPropertiesInner.md) |  | [optional] |
| **room_types** | [**Array&lt;ImportFromChannex200ResponseDataPropertiesInner&gt;**](ImportFromChannex200ResponseDataPropertiesInner.md) |  | [optional] |
| **rate_plans** | [**Array&lt;ImportFromChannex200ResponseDataPropertiesInner&gt;**](ImportFromChannex200ResponseDataPropertiesInner.md) |  | [optional] |
| **webhooks** | [**Array&lt;ImportFromChannex200ResponseDataPropertiesInner&gt;**](ImportFromChannex200ResponseDataPropertiesInner.md) |  | [optional] |
| **signing_keys** | [**Array&lt;ImportFromChannex200ResponseDataPropertiesInner&gt;**](ImportFromChannex200ResponseDataPropertiesInner.md) |  | [optional] |
| **channels** | [**Array&lt;ImportFromChannex200ResponseDataChannelsInner&gt;**](ImportFromChannex200ResponseDataChannelsInner.md) |  | [optional] |
| **warnings** | **Array&lt;String&gt;** |  | [optional] |
| **next_steps** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ImportFromChannex200ResponseData.new(
  id: null,
  environment: null,
  dry_run: null,
  complete: null,
  started_at: null,
  finished_at: null,
  summary: null,
  properties: null,
  room_types: null,
  rate_plans: null,
  webhooks: null,
  signing_keys: null,
  channels: null,
  warnings: null,
  next_steps: null
)
```

