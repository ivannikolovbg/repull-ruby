# Repull::UpdateVrboListingPaymentTerms200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **vrbo_listing_number** | **String** |  |  |
| **property_id** | **String** | Vrbo&#39;s property id for the unit. |  |
| **section** | **String** |  |  |
| **written** | **Array&lt;String&gt;** | The fields this request sent. |  |
| **data** | [**UpdateVrboListingPaymentTerms200ResponseData**](UpdateVrboListingPaymentTerms200ResponseData.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingPaymentTerms200Response.new(
  listing_id: null,
  vrbo_listing_number: null,
  property_id: null,
  section: payment-terms,
  written: null,
  data: null
)
```

