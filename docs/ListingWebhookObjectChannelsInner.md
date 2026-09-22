# Repull::ListingWebhookObjectChannelsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **platform** | **String** |  | [optional] |
| **external_id** | **String** |  | [optional] |
| **active** | **Boolean** |  | [optional] |
| **sync_enabled** | **Boolean** |  | [optional] |
| **sync_category** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingWebhookObjectChannelsInner.new(
  platform: airbnb,
  external_id: 21466093,
  active: null,
  sync_enabled: null,
  sync_category: sync_all
)
```

