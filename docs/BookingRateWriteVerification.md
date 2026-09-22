# Repull::BookingRateWriteVerification

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ran** | **Boolean** | Whether the read-back happened. | [optional] |
| **skipped_reason** | **String** | Why it did not: &#x60;not_requested&#x60; (you sent &#x60;verify: false&#x60;), &#x60;span_too_long&#x60;, &#x60;all_dates_beyond_booking_horizon&#x60;, &#x60;read_back_failed&#x60;, &#x60;nothing_to_verify&#x60;. | [optional] |
| **matched** | **Integer** |  | [optional] |
| **mismatched** | **Integer** |  | [optional] |
| **rows** | [**Array&lt;BookingRateWriteVerificationRow&gt;**](BookingRateWriteVerificationRow.md) |  | [optional] |
| **error** | **String** | Present when the read itself failed. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRateWriteVerification.new(
  ran: null,
  skipped_reason: null,
  matched: null,
  mismatched: null,
  rows: null,
  error: null
)
```

