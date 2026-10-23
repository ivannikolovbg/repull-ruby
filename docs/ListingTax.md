# Repull::ListingTax

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | &#x60;vat&#x60;, &#x60;vat_gst&#x60;, &#x60;city_tax&#x60;, &#x60;transient_occupancy_tax&#x60;, … | [optional] |
| **name** | **String** |  | [optional] |
| **amount** | **Float** |  | [optional] |
| **amount_type** | **String** |  | [optional] |
| **charged_per** | [**ChargePer**](ChargePer.md) |  | [optional] |
| **applies_to** | **Array&lt;String&gt;** | What it is charged on (&#x60;accommodation&#x60;, &#x60;cleaning&#x60;, other fee types). &#x60;null&#x60;: the whole stay. | [optional] |
| **included** | **Boolean** | Already included in the price rather than added on top. | [optional] |
| **source** | **String** | &#x60;airbnb&#x60; (host-remitted), &#x60;airbnb_collected&#x60; (Airbnb collects and remits), &#x60;guesty&#x60;, … | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingTax.new(
  type: vat,
  name: VAT,
  amount: 20,
  amount_type: null,
  charged_per: null,
  applies_to: null,
  included: null,
  source: null
)
```

