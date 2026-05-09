# Repull::ListingPublishStatusConnection

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** | Channel name: airbnb, booking, vrbo, etc. | [optional] |
| **connected** | **Boolean** | True when the link is active (not disconnected/suspended). | [optional] |
| **sync_enabled** | **Boolean** | True when sync writes are enabled for this channel. | [optional] |
| **since** | **Time** | ISO timestamp the connection was first established. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPublishStatusConnection.new(
  channel: airbnb,
  connected: null,
  sync_enabled: null,
  since: null
)
```

