# Repull::GetVrboConnection200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional] |
| **account_count** | **Integer** |  | [optional] |
| **accounts** | [**Array&lt;GetVrboConnection200ResponseDataAccountsInner&gt;**](GetVrboConnection200ResponseDataAccountsInner.md) |  | [optional] |
| **fix_url** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboConnection200ResponseData.new(
  status: null,
  account_count: null,
  accounts: null,
  fix_url: null
)
```

