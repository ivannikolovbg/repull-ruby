# Repull::BookingRestrictionVerification

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ran** | **Boolean** |  | [optional] |
| **skipped_reason** | **String** | &#x60;not_requested&#x60; (no restrictions were sent, &#x60;verify: false&#x60;, or Booking.com refused them), &#x60;all_dates_beyond_booking_horizon&#x60;, &#x60;read_back_failed&#x60;, &#x60;nothing_to_verify&#x60;. | [optional] |
| **matched** | **Integer** |  | [optional] |
| **mismatched** | **Integer** |  | [optional] |
| **unreported** | **Integer** | Restrictions Booking.com&#39;s read-back did not mention either way. Counted apart from &#x60;mismatched&#x60;: an unknown is not a failure. | [optional] |
| **rows** | [**Array&lt;BookingRestrictionVerificationRow&gt;**](BookingRestrictionVerificationRow.md) | One row per (night, restriction). Above 62 rows only the non-matching ones are listed; &#x60;rowsOmitted&#x60; counts the rest. | [optional] |
| **rows_omitted** | **Integer** | Matching rows left out of &#x60;rows&#x60; on a long write. | [optional] |
| **error** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRestrictionVerification.new(
  ran: null,
  skipped_reason: null,
  matched: null,
  mismatched: null,
  unreported: null,
  rows: null,
  rows_omitted: null,
  error: null
)
```

