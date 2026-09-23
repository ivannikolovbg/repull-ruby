# Repull::ListingAddressReadiness

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ready** | **Boolean** | True when the address satisfies this channel&#39;s create preflight. False means a publish would be refused for the address alone. | [optional] |
| **missing** | **Array&lt;String&gt;** | The address parts still needed, named as the REQUEST fields you send — &#x60;street&#x60;, &#x60;city&#x60;, &#x60;state&#x60;, &#x60;postalCode&#x60; — so the value can be acted on directly. Empty when &#x60;ready&#x60; is true. | [optional] |
| **have** | **String** | The address as currently resolved, for debugging. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingAddressReadiness.new(
  ready: null,
  missing: [&quot;state&quot;,&quot;postalCode&quot;],
  have: street&#x3D;123 Main St, city&#x3D;Miami Beach, state&#x3D;∅, postalCode&#x3D;∅, country&#x3D;US
)
```

