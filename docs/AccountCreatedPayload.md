# Repull::AccountCreatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **String** |  | [optional] |
| **account_id** | **String** |  | [optional] |
| **provider** | **String** | PMS or channel provider id (e.g. airbnb, booking, hostaway). | [optional] |
| **access_type** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AccountCreatedPayload.new(
  workspace_id: 47f8883d-28c2-4d2c-b020-c7cef1aff62c,
  account_id: acc_01HX5XPQ2K,
  provider: airbnb,
  access_type: full_access,
  created_at: 2026-05-01T12:00Z
)
```

