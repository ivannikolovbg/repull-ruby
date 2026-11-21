# Repull::UpdateVrboListingTaxesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tax** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **stay_tax** | [**UpdateVrboListingTaxesRequestStayTax**](UpdateVrboListingTaxesRequestStayTax.md) |  | [optional] |
| **partner_tax_settings** | [**UpdateVrboListingTaxesRequestPartnerTaxSettings**](UpdateVrboListingTaxesRequestPartnerTaxSettings.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingTaxesRequest.new(
  tax: null,
  stay_tax: null,
  partner_tax_settings: null
)
```

