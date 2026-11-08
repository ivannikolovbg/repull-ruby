# Repull::BookingRateWriteVerification

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ran** | **Boolean** | Whether the read-back happened. | [optional] |
| **skipped_reason** | **String** | Why it did not: &#x60;not_requested&#x60; (you sent &#x60;verify: false&#x60;), &#x60;all_dates_beyond_booking_horizon&#x60;, &#x60;read_back_failed&#x60;, &#x60;nothing_to_verify&#x60;. Every night of a write is read back, however long the range (a year is read in 31-day chunks, in parallel). | [optional] |
| **matched** | **Integer** |  | [optional] |
| **mismatched** | **Integer** |  | [optional] |
| **rows** | [**Array&lt;BookingRateWriteVerificationRow&gt;**](BookingRateWriteVerificationRow.md) | One row per night. When a write covers more than 62 rows, only the nights that did NOT match are listed and &#x60;rowsOmitted&#x60; counts the rest — &#x60;matched&#x60; and &#x60;mismatched&#x60; always cover every night. | [optional] |
| **rows_omitted** | **Integer** | Matching nights left out of &#x60;rows&#x60; on a long write. Absent when every row is listed. | [optional] |
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
  rows_omitted: null,
  error: null
)
```

