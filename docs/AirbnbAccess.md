# Repull::AirbnbAccess

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **default_account** | **String** | The account that acts when none is named: the conversation&#39;s own account while connected, else the listing&#39;s owner, else a connected co-host. Null when none is connected. |  |
| **accounts** | [**Array&lt;AirbnbAccessAccountsInner&gt;**](AirbnbAccessAccountsInner.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbAccess.new(
  default_account: airbnb:483175841,
  accounts: null
)
```

