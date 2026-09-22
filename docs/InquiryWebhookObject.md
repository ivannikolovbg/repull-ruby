# Repull::InquiryWebhookObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull inquiry id. |  |
| **conversation_id** | **String** | Pass to &#x60;POST /v1/conversations/{id}/pre-approval&#x60; or &#x60;/special-offers&#x60;. | [optional] |
| **listing_id** | **String** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **status** | **String** | Same vocabulary as &#x60;GET /v1/inquiries&#x60;: &#x60;open&#x60; needs an answer; &#x60;booked&#x60; means the guest booked (&#x60;reservationId&#x60;). |  |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **guests** | [**InquiryWebhookObjectGuests**](InquiryWebhookObjectGuests.md) |  | [optional] |
| **expected_payout** | [**InquiryWebhookObjectExpectedPayout**](InquiryWebhookObjectExpectedPayout.md) |  | [optional] |
| **reservation_id** | **String** | The reservation the inquiry became, once booked. | [optional] |
| **relayed_by** | **String** | A PMS that relays this inquiry; when set, answer it in that PMS. | [optional] |
| **respond_by** | **Time** |  | [optional] |
| **responded_at** | **Time** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::InquiryWebhookObject.new(
  id: 25173,
  conversation_id: 164743,
  listing_id: 23892,
  channel: airbnb,
  status: open,
  check_in: Fri Oct 23 00:00:00 UTC 2026,
  check_out: Wed Nov 11 00:00:00 UTC 2026,
  guests: null,
  expected_payout: null,
  reservation_id: null,
  relayed_by: null,
  respond_by: null,
  responded_at: null,
  created_at: null,
  updated_at: null
)
```

