# Repull::ConnectStatusAccountsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **external_account_id** | **String** | Airbnb host ID, as a string (it can exceed 2^53). | [optional] |
| **name** | **String** |  | [optional] |
| **picture_url** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **connected** | **Boolean** | True while the account is active and its authorization is usable. | [optional] |
| **email** | **String** | Vrbo only: the account email. | [optional] |
| **access_type** | **String** | Vrbo only. | [optional] |
| **import** | [**VrboImportStatus**](VrboImportStatus.md) | Vrbo only: where the account import stands. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectStatusAccountsInner.new(
  external_account_id: 79730216,
  name: Casey,
  picture_url: null,
  status: active,
  connected: true,
  email: null,
  access_type: null,
  import: null
)
```

