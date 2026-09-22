# Repull::PreapproveConversationRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **block_instant_booking** | **Boolean** | When &#x60;true&#x60;, the guest cannot Instant Book the listing and must book through this pre-approval. Leave &#x60;false&#x60; unless you need that. | [optional][default to false] |

## Example

```ruby
require 'repull'

instance = Repull::PreapproveConversationRequest.new(
  block_instant_booking: null
)
```

