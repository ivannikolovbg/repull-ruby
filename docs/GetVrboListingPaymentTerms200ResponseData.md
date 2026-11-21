# Repull::GetVrboListingPaymentTerms200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **percent_due_now** | **Float** |  | [optional] |
| **payments** | [**Array&lt;GetVrboListingContent200ResponseSectionsPaymentTermsPaymentsInner&gt;**](GetVrboListingContent200ResponseSectionsPaymentTermsPaymentsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingPaymentTerms200ResponseData.new(
  percent_due_now: null,
  payments: null
)
```

