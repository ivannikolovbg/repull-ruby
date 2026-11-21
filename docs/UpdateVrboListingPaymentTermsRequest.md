# Repull::UpdateVrboListingPaymentTermsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **percent_due_now** | **Float** |  |  |
| **payments** | [**Array&lt;UpdateVrboListingPaymentTermsRequestPaymentsInner&gt;**](UpdateVrboListingPaymentTermsRequestPaymentsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingPaymentTermsRequest.new(
  percent_due_now: null,
  payments: null
)
```

