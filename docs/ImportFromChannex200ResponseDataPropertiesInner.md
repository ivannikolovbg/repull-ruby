# Repull::ImportFromChannex200ResponseDataPropertiesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channex_id** | **String** | The Channex id, which keeps resolving on &#x60;/channex/api/v1&#x60;. | [optional] |
| **title** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **detail** | **String** | How it was matched, or what to do. | [optional] |
| **repull_listing_id** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ImportFromChannex200ResponseDataPropertiesInner.new(
  channex_id: null,
  title: null,
  status: null,
  detail: null,
  repull_listing_id: null
)
```

