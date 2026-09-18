# Repull::AirbnbSafetyDisclosuresResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **disclosures** | [**Array&lt;AirbnbSafetyDisclosure&gt;**](AirbnbSafetyDisclosure.md) | Every supported disclosure type, including the ones this listing has not declared (&#x60;value: false&#x60;), so \&quot;does this property have cameras?\&quot; has an answer rather than a missing key. Types Airbnb returns that are not in the documented set are passed through, never dropped. | [optional] |
| **declared** | **Array&lt;String&gt;** | Just the types that are true of this property. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbSafetyDisclosuresResponse.new(
  disclosures: null,
  declared: null
)
```

