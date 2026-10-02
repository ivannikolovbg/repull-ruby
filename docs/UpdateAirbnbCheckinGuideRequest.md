# Repull::UpdateAirbnbCheckinGuideRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **locale** | **String** | Language of the guide when one has to be created. Ignored when the listing already has a guide. | [optional] |
| **steps** | [**Array&lt;UpdateAirbnbCheckinGuideRequestStepsInner&gt;**](UpdateAirbnbCheckinGuideRequestStepsInner.md) | The guide&#39;s steps, in the order guests see them. |  |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbCheckinGuideRequest.new(
  locale: en,
  steps: null
)
```

