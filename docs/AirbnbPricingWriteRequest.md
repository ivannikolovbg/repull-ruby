# Repull::AirbnbPricingWriteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  |  |
| **operations** | [**Array&lt;AirbnbCalendarOperation&gt;**](AirbnbCalendarOperation.md) | Required when &#x60;type: \&quot;calendar\&quot;&#x60;. Batch of per-date price + restriction operations. | [optional] |
| **model_type** | **String** | Required when &#x60;type: \&quot;model\&quot;&#x60; — the pricing-availability model to switch the listing to. | [optional] |
| **settings** | **Hash&lt;String, Object&gt;** | Required for &#x60;type: \&quot;standard\&quot; | \&quot;rate-plan\&quot; | \&quot;fees\&quot;&#x60; — the pricing-settings object to PUT. | [optional] |
| **records** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | Required for &#x60;type: \&quot;los\&quot;&#x60; — length-of-stay records. | [optional] |
| **currency** | **String** | Required for &#x60;type: \&quot;currency\&quot;&#x60; — ISO 4217 code. | [optional] |
| **rule** | **Hash&lt;String, Object&gt;** | Required for &#x60;type: \&quot;rule\&quot;&#x60; — a single pricing rule appended to the listing. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbPricingWriteRequest.new(
  type: null,
  operations: null,
  model_type: null,
  settings: null,
  records: null,
  currency: null,
  rule: null
)
```

