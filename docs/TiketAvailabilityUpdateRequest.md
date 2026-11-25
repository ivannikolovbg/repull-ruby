# Repull::TiketAvailabilityUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** | tiket.com Hotel ID. |  |
| **type** | **String** | &#x60;availability&#x60; — rooms to sell per room type. &#x60;rates&#x60; — prices per room type and rate plan. &#x60;restrictions&#x60; — stay and arrival rules per room type and rate plan. |  |
| **updates** | [**Array&lt;TiketAriUpdate&gt;**](TiketAriUpdate.md) |  |  |
| **verify** | **Boolean** | Read the nights back from tiket.com after the write and report &#x60;applied&#x60;. &#x60;false&#x60; skips the read-back (&#x60;applied: unverified&#x60;). | [optional][default to true] |

## Example

```ruby
require 'repull'

instance = Repull::TiketAvailabilityUpdateRequest.new(
  property_id: null,
  type: null,
  updates: null,
  verify: null
)
```

