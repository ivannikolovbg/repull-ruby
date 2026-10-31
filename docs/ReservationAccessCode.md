# Repull::ReservationAccessCode

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | The code to enter on the lock. |  |
| **type** | **String** | &#x60;guest&#x60;: the code to give the guest. &#x60;backup&#x60;: give it only if the guest code fails; Guesty may change a backup code read before check-in day. |  |
| **status** | **String** | The PMS&#39;s status for the code, lower-cased. |  |
| **valid_from** | **Time** | When the code starts working. &#x60;null&#x60; when the PMS gives no window. |  |
| **valid_until** | **Time** | When the code stops working. &#x60;null&#x60; when the PMS gives no window. |  |
| **locks** | [**Array&lt;ReservationAccessCodeLocksInner&gt;**](ReservationAccessCodeLocksInner.md) | The locks the code opens. |  |
| **source** | **String** | The PMS the code was read from. |  |
| **updated_at** | **Time** | When the codes were last read from the PMS. |  |

## Example

```ruby
require 'repull'

instance = Repull::ReservationAccessCode.new(
  code: 482913,
  type: guest,
  status: active,
  valid_from: 2026-11-01T20:00Z,
  valid_until: 2026-11-05T15:00Z,
  locks: null,
  source: guesty,
  updated_at: 2026-10-31T14:30Z
)
```

