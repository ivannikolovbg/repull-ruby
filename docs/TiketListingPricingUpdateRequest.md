# Repull::TiketListingPricingUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | &#x60;availability&#x60; — rooms to sell per room type. &#x60;rates&#x60; — prices per room type and rate plan. &#x60;restrictions&#x60; — stay and arrival rules per room type and rate plan. | [optional][default to &#39;rates&#39;] |
| **hotel_id** | **String** | tiket.com Hotel ID — only needed when the listing is mapped on more than one tiket.com property. | [optional] |
| **updates** | [**Array&lt;TiketAriUpdate&gt;**](TiketAriUpdate.md) |  |  |
| **verify** | **Boolean** | Read the nights back from tiket.com after the write and report &#x60;applied&#x60;. &#x60;false&#x60; skips the read-back (&#x60;applied: unverified&#x60;). | [optional][default to true] |

## Example

```ruby
require 'repull'

instance = Repull::TiketListingPricingUpdateRequest.new(
  type: null,
  hotel_id: null,
  updates: null,
  verify: null
)
```

