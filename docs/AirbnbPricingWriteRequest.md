# Repull::AirbnbPricingWriteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  |  |
| **operations** | [**Array&lt;AirbnbCalendarOperation&gt;**](AirbnbCalendarOperation.md) | Required when &#x60;type: \&quot;calendar\&quot;&#x60;. Batch of per-date price + restriction operations. | [optional] |
| **model_type** | **String** | Required when &#x60;type: \&quot;model\&quot;&#x60; — the pricing-availability model to switch the listing to. | [optional] |
| **settings** | **Hash&lt;String, Object&gt;** | Required for &#x60;type: \&quot;standard\&quot; | \&quot;rate-plan\&quot;&#x60; — the pricing-settings object to PUT. With &#x60;type: \&quot;fees\&quot;&#x60; it is the raw alternative to &#x60;fees&#x60;: &#x60;{\&quot;standard_fees\&quot;: [...]}&#x60; **replaces every fee** on the listing (Airbnb does not merge), so send the complete list. Prefer &#x60;fees&#x60;. | [optional] |
| **fees** | [**Array&lt;AirbnbPricingWriteRequestFeesInner&gt;**](AirbnbPricingWriteRequestFeesInner.md) | With &#x60;type: \&quot;fees\&quot;&#x60; — the fee changes to apply. **Merged by &#x60;fee_type&#x60;**: fees you do not mention are kept, the ones you send are set, and &#x60;amount: null&#x60; removes that fee. (Airbnb itself replaces the whole fee list on every write, so Repull reads the listing&#39;s current fees, applies your changes and writes the full set.) The response is the listing&#39;s fees as Airbnb holds them afterwards.  **Units — the same as &#x60;GET …/pricing&#x60; returns:** a &#x60;flat&#x60; fee is the amount in the listing currency × 1,000,000 (&#x60;160000000&#x60; &#x3D; 160.00); a &#x60;percent&#x60; fee is a whole percent of the rent (&#x60;10&#x60; &#x3D; 10%).  Example — add a 10% management fee and keep everything else: &#x60;{\&quot;type\&quot;:\&quot;fees\&quot;,\&quot;fees\&quot;:[{\&quot;fee_type\&quot;:\&quot;PASS_THROUGH_MANAGEMENT_FEE\&quot;,\&quot;amount\&quot;:10,\&quot;amount_type\&quot;:\&quot;percent\&quot;}]}&#x60;. Remove the pet fee: &#x60;{\&quot;type\&quot;:\&quot;fees\&quot;,\&quot;fees\&quot;:[{\&quot;fee_type\&quot;:\&quot;PASS_THROUGH_PET_FEE\&quot;,\&quot;amount\&quot;:null}]}&#x60;. | [optional] |
| **records** | [**Array&lt;AirbnbPricingWriteRequestRecordsInner&gt;**](AirbnbPricingWriteRequestRecordsInner.md) | Required for &#x60;type: \&quot;los\&quot;&#x60; — length-of-stay records. | [optional] |
| **currency** | **String** | Required for &#x60;type: \&quot;currency\&quot;&#x60; — ISO 4217 code in capitals, e.g. &#x60;USD&#x60;. | [optional] |
| **rule** | **Hash&lt;String, Object&gt;** | Required for &#x60;type: \&quot;rule\&quot;&#x60; — a single pricing rule appended to the listing. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbPricingWriteRequest.new(
  type: null,
  operations: null,
  model_type: null,
  settings: null,
  fees: null,
  records: null,
  currency: null,
  rule: null
)
```

