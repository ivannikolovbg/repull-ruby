# Repull::AirbnbPublishResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **published** | **Boolean** | True only when EVERY attempted section reached Airbnb. |  |
| **live** | **Boolean** | Whether the listing is active and bookable on Airbnb — that is, whether activation was actually performed and succeeded.  &#x60;published: true&#x60; with &#x60;live: false&#x60; is a real and common outcome: every content section landed, but the listing was never activated, because activation is skipped when instant-booking cannot be confirmed to be off. &#x60;warnings&#x60; says why.  **Absent is not &#x60;false&#x60;.** The field is omitted entirely when activation was never part of the operation — publishing to an already-mapped Airbnb listing updates content and activates nothing, so there is nothing to report. Only treat the listing as not-live when &#x60;live&#x60; is present and false. | [optional] |
| **sections** | **Array&lt;String&gt;** | Sections that landed on Airbnb. |  |
| **errors** | [**Array&lt;PublishSectionError&gt;**](PublishSectionError.md) | Per-section failures. Empty when &#x60;published&#x60; is true. |  |
| **warnings** | **Array&lt;String&gt;** | Steps that failed WITHOUT failing the publish — optional work the push carried on past, each in the push&#39;s own words. These used to be swallowed silently, so the only sign of one was a listing that was somehow not quite right afterwards. A publish can be &#x60;published: true&#x60; and still carry warnings; read them before concluding nothing needs doing. |  |
| **reason** | **String** | Set when the publish never started at all (no connection, address missing, subscription gate). | [optional] |
| **locked_fields** | **Array&lt;String&gt;** | Fields Airbnb will not let this listing change — collected from the failures above and from the &#x60;locked_attributes&#x60; Airbnb recorded for the listing. Sending them again returns success and changes nothing. |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbPublishResult.new(
  published: null,
  live: null,
  sections: [&quot;details&quot;,&quot;pricing&quot;,&quot;photos&quot;],
  errors: null,
  warnings: [&quot;instant booking could not be confirmed off — listing left inactive&quot;],
  reason: null,
  locked_fields: null
)
```

