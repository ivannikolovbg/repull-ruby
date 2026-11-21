# Repull::VrboReservationAction200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** |  | [optional] |
| **preview** | **Boolean** |  | [optional] |
| **committed** | **Boolean** |  | [optional] |
| **reservation_code** | **String** |  | [optional] |
| **refund_to_guest** | **String** | &#x60;cancel&#x60;: what the guest gets back. | [optional] |
| **penalties** | [**VrboReservationAction200ResponseDataPenalties**](VrboReservationAction200ResponseDataPenalties.md) |  | [optional] |
| **terms** | [**Array&lt;VrboReservationAction200ResponseDataTermsInner&gt;**](VrboReservationAction200ResponseDataTermsInner.md) |  | [optional] |
| **payment** | [**VrboReservationAction200ResponseDataPayment**](VrboReservationAction200ResponseDataPayment.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::VrboReservationAction200ResponseData.new(
  action: null,
  preview: null,
  committed: null,
  reservation_code: null,
  refund_to_guest: null,
  penalties: null,
  terms: null,
  payment: null
)
```

