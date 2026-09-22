# Repull::ListingWebhookObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **customer_id** | **Integer** |  |  |
| **channel** | **String** |  | [optional] |
| **external_listing_id** | **String** | The channel&#39;s own listing id. Airbnb&#39;s exceed 2^53, so always a string. | [optional] |
| **name** | **String** |  | [optional] |
| **active** | **Boolean** |  | [optional] |
| **status** | **String** |  | [optional] |
| **address** | [**ListingWebhookObjectAddress**](ListingWebhookObjectAddress.md) |  | [optional] |
| **thumbnail_url** | **String** |  | [optional] |
| **channels** | [**Array&lt;ListingWebhookObjectChannelsInner&gt;**](ListingWebhookObjectChannelsInner.md) | Which channels this listing is on and whether each still accepts writes. &#x60;syncEnabled: false&#x60; means the channel refuses every write for this listing — the difference between a failing integration and a suspended listing. | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingWebhookObject.new(
  id: 6250,
  customer_id: 1,
  channel: airbnb,
  external_listing_id: 1234567890123456789,
  name: R-Sable 1302 — Radium Hot Springs,
  active: true,
  status: active,
  address: null,
  thumbnail_url: null,
  channels: null,
  created_at: null,
  updated_at: null
)
```

