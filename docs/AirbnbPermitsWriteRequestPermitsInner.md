# Repull::AirbnbPermitsWriteRequestPermitsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **regulatory_body** | **String** | As named by the GET, e.g. the city or registry asking. |  |
| **regulation_type** | **String** |  |  |
| **answers** | [**Array&lt;AirbnbPermitsWriteRequestPermitsInnerAnswersInner&gt;**](AirbnbPermitsWriteRequestPermitsInnerAnswersInner.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbPermitsWriteRequestPermitsInner.new(
  regulatory_body: null,
  regulation_type: null,
  answers: null
)
```

