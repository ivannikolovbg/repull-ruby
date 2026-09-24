# Repull::ListingContentUpdateRequestCheckoutTasksInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_type** | **String** | Any casing is accepted; stored lowercase. |  |
| **instructions** | **String** | Detail shown to the guest with the task, e.g. \&quot;Leave the keys on the kitchen counter\&quot;. | [optional] |
| **required** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingContentUpdateRequestCheckoutTasksInner.new(
  task_type: null,
  instructions: null,
  required: null
)
```

