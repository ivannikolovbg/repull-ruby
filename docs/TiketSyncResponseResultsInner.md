# Repull::TiketSyncResponseResultsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **step** | **String** |  | [optional] |
| **ok** | **Boolean** |  | [optional] |
| **skipped** | **String** | &#x60;listing_inactive&#x60; — an inactive listing is not sold, so its calendar is not sent. | [optional] |
| **result** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **error** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketSyncResponseResultsInner.new(
  property_id: null,
  listing_id: null,
  step: null,
  ok: null,
  skipped: null,
  result: null,
  error: null
)
```

