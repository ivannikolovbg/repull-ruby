# Repull::WebhookEventAccount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull connection id. | [optional] |
| **provider** | **String** |  | [optional] |
| **external_account_id** | **String** | The provider&#39;s own account id. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::WebhookEventAccount.new(
  id: null,
  provider: airbnb,
  external_account_id: 79730216
)
```

