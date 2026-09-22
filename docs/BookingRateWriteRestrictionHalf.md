# Repull::BookingRateWriteRestrictionHalf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **requested** | **Integer** | How many updates carried a restriction. &#x60;0&#x60; when none did. | [optional] |
| **fields** | **Array&lt;String&gt;** | Every restriction asked for, across all updates. | [optional] |
| **dates** | [**Array&lt;BookingRestrictionRequestRow&gt;**](BookingRestrictionRequestRow.md) | Per update, the nights and the restrictions asked for them — so a partial result names exactly what did and did not change. | [optional] |
| **applied** | **String** | &#x60;not_requested&#x60; means no update carried a restriction and nothing was sent. | [optional] |
| **verification** | [**BookingRestrictionVerification**](BookingRestrictionVerification.md) |  | [optional] |
| **errors** | **Array&lt;Hash&lt;String, Object&gt;&gt;** |  | [optional] |
| **rejection** | [**BookingUpstreamFailure**](BookingUpstreamFailure.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRateWriteRestrictionHalf.new(
  requested: null,
  fields: null,
  dates: null,
  applied: null,
  verification: null,
  errors: null,
  rejection: null
)
```

