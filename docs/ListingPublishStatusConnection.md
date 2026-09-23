# Repull::ListingPublishStatusConnection

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** | Channel name: airbnb, booking, vrbo, etc. | [optional] |
| **connected** | **Boolean** | True when the link is active (not disconnected/suspended). | [optional] |
| **sync_enabled** | **Boolean** | True when sync writes are enabled for this channel. | [optional] |
| **since** | **Time** | ISO timestamp the connection was first established. | [optional] |
| **locked_fields** | **Array&lt;String&gt;** | Fields the channel will not let this listing change. **Airbnb only** — present on the &#x60;airbnb&#x60; entry and absent on every other channel, because no other channel has the concept.  Airbnb does not refuse a write to a locked field: the request returns 200, reports the field as locked, and applies nothing. So a write to one of these looks exactly like a write that worked. Read this before you let a user edit — it is here, rather than only on &#x60;GET /v1/channels/airbnb/listings/{id}&#x60;, because this is the endpoint a listing editor already calls.  Empty for a listing with nothing locked, and for one that has not synced since we began recording them — the two are not distinguished, because a caller acts the same way on both. This is what Airbnb last told us, not a promise: a lock can appear between syncs, which is why a publish result also reports &#x60;lockedFields&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPublishStatusConnection.new(
  channel: airbnb,
  connected: null,
  sync_enabled: null,
  since: null,
  locked_fields: [&quot;name&quot;,&quot;property_type_category&quot;]
)
```

