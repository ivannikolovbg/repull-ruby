# Repull::AirbnbTransactionHostBreakdown

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accommodation_subtotal** | **Float** | Nightly rate × nights, net of stay-level discounts already applied by Airbnb. | [optional] |
| **cleaning_fee** | **Float** |  | [optional] |
| **host_service_fee_base** | **Float** | Airbnb host service fee, base component (negative &#x3D; deduction). | [optional] |
| **host_service_fee_vat** | **Float** | Airbnb host service fee, VAT component (negative &#x3D; deduction). | [optional] |
| **host_service_fee_total** | **Float** | Convenience sum of base + VAT. | [optional] |
| **airbnb_collected_tax** | **Float** |  | [optional] |
| **pass_through_tax** | **Float** |  | [optional] |
| **occupancy_tax** | **Float** |  | [optional] |
| **tax_withholding** | **Float** |  | [optional] |
| **host_payout** | **Float** | Expected/actual net payout to the host. |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbTransactionHostBreakdown.new(
  accommodation_subtotal: null,
  cleaning_fee: null,
  host_service_fee_base: null,
  host_service_fee_vat: null,
  host_service_fee_total: null,
  airbnb_collected_tax: null,
  pass_through_tax: null,
  occupancy_tax: null,
  tax_withholding: null,
  host_payout: null
)
```

