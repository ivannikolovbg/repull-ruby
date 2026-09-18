# Repull::AirbnbPermitsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **permits** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | The live permit flows from Airbnb — present only with &#x60;?source&#x3D;live&#x60;, &#x60;null&#x60; otherwise. Each flow names its &#x60;regulatory_body&#x60;, &#x60;regulation_type&#x60;, &#x60;status&#x60;, and the &#x60;question_key&#x60; / &#x60;answer_type&#x60; / &#x60;options&#x60; of every question you have to answer, plus the answers already on file. | [optional] |
| **cached** | [**Array&lt;AirbnbPermitsResponseCachedInner&gt;**](AirbnbPermitsResponseCachedInner.md) | Permits as last mirrored by the sync worker: body, type, status, number. The RESULT of a permit, not the questions. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbPermitsResponse.new(
  permits: null,
  cached: null
)
```

