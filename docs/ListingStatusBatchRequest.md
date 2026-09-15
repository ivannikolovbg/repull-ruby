# Repull::ListingStatusBatchRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_ids** | **Array&lt;String&gt;** | Listing ids to change, 1 to 500, each at most once. Send them as returned by &#x60;GET /v1/listings&#x60; (strings); plain integers are accepted too. |  |
| **active** | **Boolean** | &#x60;false&#x60; deactivates every listing in &#x60;listingIds&#x60;; &#x60;true&#x60; activates them. Active listings count toward your plan&#39;s listing limit. |  |

## Example

```ruby
require 'repull'

instance = Repull::ListingStatusBatchRequest.new(
  listing_ids: null,
  active: null
)
```

