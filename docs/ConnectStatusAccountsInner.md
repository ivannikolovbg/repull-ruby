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
| **notification_email** | **String** | Vrbo only. The address the host can add on Vrbo as a secondary email (with message and reservation notifications on) so new bookings, inquiries and messages arrive within a minute instead of at the scheduled check. Ask every host to add it: notifications are how Vrbo updates reach Repull, the scheduled check is the backup. Hosted Connect shows it on its mapping screen; show it in your own app when you create sessions with &#x60;mapping: \&quot;api\&quot;&#x60;. | [optional] |
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
  notification_email: null,
  import: null
)
```

