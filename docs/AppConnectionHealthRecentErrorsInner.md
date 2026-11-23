# Repull::AppConnectionHealthRecentErrorsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **at** | **Time** |  | [optional] |
| **method** | **String** |  | [optional] |
| **endpoint** | **String** |  | [optional] |
| **status_code** | **Integer** |  | [optional] |
| **message** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AppConnectionHealthRecentErrorsInner.new(
  at: null,
  method: PUT,
  endpoint: /calendar/batch/4118,
  status_code: 404,
  message: null
)
```

