# Repull::ListInquiries200ResponseDataInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull inquiry id. |  |
| **conversation_id** | **String** | Repull conversation id — pass it to &#x60;POST /v1/conversations/{id}/pre-approval&#x60; or &#x60;/special-offers&#x60;. |  |
| **listing_id** | **String** |  |  |
| **channel** | **String** |  |  |
| **status** | **String** | &#x60;open&#x60; — nobody has answered and the stay is still ahead; &#x60;pre_approved&#x60;; &#x60;special_offer_sent&#x60; (from the API, Vanio, or Airbnb’s own app); &#x60;booked&#x60; — the guest booked (&#x60;reservationId&#x60;); &#x60;expired&#x60; — the stay has started or Airbnb expired it; &#x60;declined&#x60;; &#x60;not_possible&#x60; — Airbnb says the dates cannot be booked. |  |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** |  |  |
| **guests** | [**ListInquiries200ResponseDataInnerGuests**](ListInquiries200ResponseDataInnerGuests.md) |  |  |
| **expected_payout** | [**ListInquiries200ResponseDataInnerExpectedPayout**](ListInquiries200ResponseDataInnerExpectedPayout.md) |  |  |
| **reservation_id** | **String** | The reservation the inquiry became, once booked. |  |
| **relayed_by** | **String** | A PMS (e.g. &#x60;hostaway&#x60;, &#x60;guesty&#x60;) this inquiry arrives through. When set, it cannot be pre-approved or offered from Repull — act on it in that PMS. |  |
| **respond_by** | **Time** | Airbnb’s response deadline for the host (it counts toward response rate). |  |
| **responded_at** | **Time** |  |  |
| **created_at** | **Time** |  |  |
| **updated_at** | **Time** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::ListInquiries200ResponseDataInner.new(
  id: 25173,
  conversation_id: 164743,
  listing_id: 23892,
  channel: airbnb,
  status: null,
  check_in: Wed Sep 23 00:00:00 UTC 2026,
  check_out: Sun Oct 11 00:00:00 UTC 2026,
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

