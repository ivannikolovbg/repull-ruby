# Repull::ListingCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | New listing ID — use for follow-up generate-content / publish calls | [optional] |
| **calendar_days_seeded** | **Integer** | Nights of calendar written from the price you stated. &#x60;0&#x60; means the listing has no calendar and a publish will send no availability — state &#x60;defaultDailyPrice&#x60; on the create, or set it later with &#x60;PUT /v1/listings/{id}/content&#x60; under &#x60;pricing&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingCreateResponse.new(
  id: null,
  calendar_days_seeded: null
)
```

