# Repull::ListingPublishStatusResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  | [optional] |
| **address_readiness** | [**Hash&lt;String, ListingAddressReadiness&gt;**](ListingAddressReadiness.md) | Address readiness per channel, keyed by channel name (&#x60;airbnb&#x60; today). Airbnb requires &#x60;street&#x60; and &#x60;city&#x60; for every country and additionally &#x60;state&#x60; and &#x60;postalCode&#x60; for a **US** property — and a listing with no &#x60;countryCode&#x60; behaves as US. Check this BEFORE calling a publish endpoint: an incomplete address is refused at the create preflight and never reaches the channel.  It sits here rather than inside &#x60;channels[]&#x60; because &#x60;channels&#x60; reports sync activity and is empty for a listing that has never been pushed — exactly the listing whose address blocker you need to see. Repair a gap with &#x60;PUT /v1/listings/{id}/content&#x60;, sending only the missing parts under &#x60;address&#x60;. An empty object means readiness was not reported; it never means ready. | [optional] |
| **channels** | [**Array&lt;ListingPublishStatusChannel&gt;**](ListingPublishStatusChannel.md) | Sync activity per channel — empty if the listing has never been pushed/pulled. Empty does NOT mean \&quot;not connected\&quot;; check &#x60;connections&#x60; for that. | [optional] |
| **connections** | [**Array&lt;ListingPublishStatusConnection&gt;**](ListingPublishStatusConnection.md) | Connection state per channel. Populated even when &#x60;channels&#x60; is empty so callers can distinguish \&quot;owned, never pushed\&quot; from \&quot;owned, never connected\&quot;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPublishStatusResponse.new(
  listing_id: null,
  address_readiness: {&quot;airbnb&quot;:{&quot;ready&quot;:false,&quot;missing&quot;:[&quot;state&quot;,&quot;postalCode&quot;]}},
  channels: null,
  connections: null
)
```

