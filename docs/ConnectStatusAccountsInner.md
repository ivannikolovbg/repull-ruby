# Repull::ConnectStatusAccountsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **external_account_id** | **String** | Airbnb: the host id, as a string (it can exceed 2^53). Booking.com: the hotel id. Vrbo: Vrbo&#39;s own account id; &#x60;null&#x60; until it is captured at sign-in. Extranet: the Booking.com account id. PMS: the PMS account id. | [optional] |
| **connection_id** | **String** | Our connection record (&#x60;X-Account-Id&#x60;). Airbnb: the workspace&#39;s Airbnb connection. Vrbo: the workspace&#39;s Vrbo connection, &#x60;null&#x60; when it has none. | [optional] |
| **name** | **String** |  | [optional] |
| **picture_url** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **connected** | **Boolean** | True while the account is active and its authorization is usable. | [optional] |
| **email** | **String** | Vrbo only: the account email. | [optional] |
| **access_type** | [**ConnectionAccessType**](ConnectionAccessType.md) | What this account may do. Airbnb: the tier the host&#39;s token was granted with (&#x60;read_only&#x60;, &#x60;messaging&#x60;, &#x60;full_access&#x60;). Vrbo: &#x60;messaging&#x60; (bookings and messages, no calendar push) or &#x60;full_access&#x60; (also pushes prices and availability). &#x60;null&#x60; when unknown. | [optional] |
| **action** | **Object** | Booking.com: &#x60;{ required, reason: \&quot;needs_mapping\&quot;, message }&#x60; while a room of this hotel is matched to no listing (nothing syncs for that room). Null when nothing is needed. | [optional] |
| **fix_url** | **String** | Booking.com: a link that opens room mapping for this hotel (no new Connect session needed). Send the host to it when &#x60;action&#x60; is set. | [optional] |
| **notification_received_at** | **Time** | Vrbo only. When Vrbo&#39;s first notification reached &#x60;notificationEmail&#x60;, i.e. the host added it with notifications on. &#x60;null&#x60; until then. | [optional] |
| **notification_email** | **String** | Vrbo only. The address the host can add on Vrbo as a secondary email (with message and reservation notifications on) so new bookings, inquiries and messages arrive within a minute instead of at the scheduled check. Ask every host to add it: notifications are how Vrbo updates reach Repull, the scheduled check is the backup. Hosted Connect shows it on its mapping screen; show it in your own app when you create sessions with &#x60;mapping: \&quot;api\&quot;&#x60;. | [optional] |
| **import** | [**VrboImportStatus**](VrboImportStatus.md) | Vrbo only: where the account import stands. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectStatusAccountsInner.new(
  external_account_id: 79730216,
  connection_id: 135,
  name: Casey,
  picture_url: null,
  status: active,
  connected: true,
  email: null,
  access_type: null,
  action: null,
  fix_url: null,
  notification_received_at: null,
  notification_email: null,
  import: null
)
```

