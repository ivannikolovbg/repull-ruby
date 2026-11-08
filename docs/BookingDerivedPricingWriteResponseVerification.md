# Repull::BookingDerivedPricingWriteResponseVerification

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ran** | **Boolean** |  | [optional] |
| **skipped_reason** | **String** |  | [optional] |
| **matched** | **Integer** |  | [optional] |
| **mismatched** | **Integer** |  | [optional] |
| **rows** | [**Array&lt;BookingDerivedPricingWriteResponseVerificationRowsInner&gt;**](BookingDerivedPricingWriteResponseVerificationRowsInner.md) |  | [optional] |
| **error** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingDerivedPricingWriteResponseVerification.new(
  ran: null,
  skipped_reason: null,
  matched: null,
  mismatched: null,
  rows: null,
  error: null
)
```

