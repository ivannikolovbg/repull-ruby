# Repull::SubmitCiirusCredentials200ResponseAccountInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **supplier_id** | **String** | The CiiRUS supplier (management company) id the connection reads. | [optional] |
| **account_name** | **String** | The supplier&#39;s company name. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitCiirusCredentials200ResponseAccountInfo.new(
  supplier_id: 42330,
  account_name: null
)
```

