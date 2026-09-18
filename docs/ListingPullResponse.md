# Repull::ListingPullResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **connection_id** | **String** | The channel connection the values came from. | [optional] |
| **external_id** | **String** | The listing id on the channel (the Airbnb listing id). | [optional] |
| **refreshed_from_channel** | **Boolean** | True when Airbnb itself answered and our stored copy was rewritten from that answer. False means Airbnb could not be read this time (expired grant, read-only host, upstream error) and the projection ran off the copy we already held — nothing is wrong with your data, it simply is not newer than it was. Check &#x60;GET /v1/listings/{id}/publish-status&#x60; when this is false. | [optional] |
| **sections** | **Array&lt;String&gt;** | Slabs that changed, e.g. &#x60;[\&quot;details\&quot;,\&quot;description\&quot;,\&quot;photos\&quot;,\&quot;rooms\&quot;,\&quot;amenities\&quot;,\&quot;policies\&quot;,\&quot;pricing\&quot;]&#x60;. An empty array means Airbnb agreed with everything we already held. | [optional] |
| **pulled_at** | **Time** | When this refresh completed. | [optional] |
| **next_pull_available_at** | **Time** | Earliest time another pull of this listing is accepted. Calling before then returns &#x60;429&#x60;. | [optional] |
| **min_interval_seconds** | **Integer** | Minimum seconds between pulls of one listing. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPullResponse.new(
  listing_id: null,
  channel: null,
  connection_id: null,
  external_id: null,
  refreshed_from_channel: null,
  sections: [&quot;details&quot;,&quot;description&quot;,&quot;photos&quot;,&quot;amenities&quot;],
  pulled_at: null,
  next_pull_available_at: null,
  min_interval_seconds: 900
)
```

