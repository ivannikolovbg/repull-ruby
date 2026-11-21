# Repull::GetVrboReservation200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reservation_code** | **String** |  | [optional] |
| **reservation_uuid** | **String** |  | [optional] |
| **state** | **String** |  | [optional] |
| **check_in** | **String** |  | [optional] |
| **check_out** | **String** |  | [optional] |
| **adults** | **Integer** |  | [optional] |
| **children** | **Integer** |  | [optional] |
| **pets** | **Integer** |  | [optional] |
| **guest_name** | **String** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **guest_lines** | [**Array&lt;CreateVrboAlteration200ResponseDataPaymentLinesInner&gt;**](CreateVrboAlteration200ResponseDataPaymentLinesInner.md) |  | [optional] |
| **host_lines** | [**Array&lt;CreateVrboAlteration200ResponseDataPaymentLinesInner&gt;**](CreateVrboAlteration200ResponseDataPaymentLinesInner.md) |  | [optional] |
| **total_guest_payment** | **Float** |  | [optional] |
| **payout** | **Float** |  | [optional] |
| **cancellation_policy** | **String** |  | [optional] |
| **damage_deposit** | **Float** |  | [optional] |
| **available_actions** | [**Array&lt;GetVrboReservation200ResponseDataAvailableActionsInner&gt;**](GetVrboReservation200ResponseDataAvailableActionsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboReservation200ResponseData.new(
  reservation_code: null,
  reservation_uuid: null,
  state: null,
  check_in: null,
  check_out: null,
  adults: null,
  children: null,
  pets: null,
  guest_name: null,
  currency: null,
  guest_lines: null,
  host_lines: null,
  total_guest_payment: null,
  payout: null,
  cancellation_policy: null,
  damage_deposit: null,
  available_actions: null
)
```

