# Repull::RefreshAirbnbResolutions200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **synced** | **Boolean** |  |  |
| **count** | **Integer** | Resolutions upserted across all accounts. |  |
| **accounts** | [**Array&lt;RefreshAirbnbResolutions200ResponseAccountsInner&gt;**](RefreshAirbnbResolutions200ResponseAccountsInner.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::RefreshAirbnbResolutions200Response.new(
  synced: null,
  count: null,
  accounts: null
)
```

