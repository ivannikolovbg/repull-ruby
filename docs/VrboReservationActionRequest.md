# Repull::VrboReservationActionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** |  |  |
| **reason** | **String** | &#x60;cancel&#x60;: Vrbo&#39;s cancel reason; &#x60;decline&#x60;: Vrbo&#39;s decline reason; &#x60;refund&#x60;: why. | [optional] |
| **message** | **String** | Sent to the guest. &#x60;cancel&#x60; 25–250 characters (required); &#x60;charge&#x60; ≤ 50 (required); &#x60;accept&#x60;/&#x60;decline&#x60; ≤ 250. | [optional] |
| **refund_level** | **String** | &#x60;cancel&#x60;: the refund Vrbo offers for the reason (default &#x60;FULL&#x60;). | [optional] |
| **block_dates** | **Boolean** | &#x60;decline&#x60;: also block the requested dates. | [optional] |
| **fee_type** | **String** | &#x60;charge&#x60;: Vrbo&#39;s fee type. | [optional] |
| **amount** | **Float** | &#x60;charge&#x60;/&#x60;refund&#x60;: the amount, in the booking&#39;s currency. | [optional] |
| **due_date** | **Date** | &#x60;charge&#x60;: when the guest must pay (default today). | [optional] |
| **preview** | **Boolean** | Vrbo&#39;s dry run only (cancel, charge, refund): nothing is changed. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::VrboReservationActionRequest.new(
  action: null,
  reason: null,
  message: null,
  refund_level: FULL,
  block_dates: null,
  fee_type: PARKING,
  amount: 25,
  due_date: null,
  preview: null
)
```

