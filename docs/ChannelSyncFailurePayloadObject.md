# Repull::ChannelSyncFailurePayloadObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** |  |  |
| **customer_id** | **Integer** |  |  |
| **operation** | **String** | Which wire failed. A refused rate and a closed connection call for different responses. |  |
| **total** | **Boolean** | true when NO mapping accepted the push. false means some did — the more dangerous case, because the listing is live somewhere and inconsistent. |  |
| **from** | **Date** | Start of the date range the push covered, when the operation is date-scoped. | [optional] |
| **to** | **Date** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ChannelSyncFailurePayloadObject.new(
  listing_id: null,
  customer_id: null,
  operation: null,
  total: null,
  from: null,
  to: null
)
```

