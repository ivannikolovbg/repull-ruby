# Repull::DeleteConnection200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **disconnected** | **Boolean** | Always &#x60;true&#x60; on success. |  |
| **provider** | **String** | The provider the account belonged to. |  |
| **account_id** | **String** | The account that was disconnected. &#x60;null&#x60; only when the workspace had a stale connection record with no account to name, which was cleared. |  |
| **listings_deactivated** | **Array&lt;String&gt;** | Ids of the listings this call deactivated. Listings still connected through another account or channel are not included and stay active. |  |

## Example

```ruby
require 'repull'

instance = Repull::DeleteConnection200Response.new(
  disconnected: null,
  provider: null,
  account_id: null,
  listings_deactivated: null
)
```

