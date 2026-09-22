# Repull::AcceptReservationRequest200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reservation_id** | **String** |  |  |
| **confirmation_code** | **String** |  |  |
| **channel** | **String** |  |  |
| **action** | **String** |  |  |
| **status** | **String** | What Airbnb was asked to do and did not refuse. The reservation itself moves when Airbnb’s own notification lands, usually within seconds — that is when &#x60;reservation.request.updated&#x60; fires (&#x60;requestStatus&#x60; &#x60;accepted&#x60; or &#x60;declined&#x60;), plus &#x60;reservation.created&#x60; for an accepted request. |  |
| **decline_reason** | **String** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::AcceptReservationRequest200Response.new(
  reservation_id: 236354,
  confirmation_code: HM9J2MFR3W,
  channel: null,
  action: null,
  status: null,
  decline_reason: null
)
```

