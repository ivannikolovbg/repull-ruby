# Repull::TiketRatePlan

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rate_plan_id** | **String** | Repull id of the rate plan (used by &#x60;set-push-rate-plans&#x60;). | [optional] |
| **rate_plan_code** | **String** | tiket.com rate plan id. | [optional] |
| **name** | **String** |  | [optional] |
| **push_target** | **Boolean** | Prices and restrictions from the mapped listing&#39;s calendar are sent to this rate plan. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketRatePlan.new(
  rate_plan_id: null,
  rate_plan_code: null,
  name: null,
  push_target: null
)
```

