# Repull::AirbnbTransaction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transaction_id** | **String** | Upstream Airbnb transaction id. |  |
| **type** | **String** | Transaction kind. | [optional] |
| **reference** | **String** |  | [optional] |
| **date** | **Date** | Transaction date. | [optional] |
| **confirmation_code** | **String** | Airbnb confirmation code — links this transaction to a reservation. | [optional] |
| **reservation_id** | **Integer** | Resolved Vanio reservation id when the confirmation code matched a reservation in this workspace; null otherwise. | [optional] |
| **account_id** | **String** | Which connected Airbnb account this transaction belongs to — the Airbnb host id, as a string (they exceed 2^53). &#x60;null&#x60; on rows that name no listing (payouts). | [optional] |
| **account_name** | **String** | Display name of that connected Airbnb account. | [optional] |
| **listing_id** | **String** | Airbnb listing id. | [optional] |
| **thread_id** | **String** |  | [optional] |
| **nights** | **Integer** |  | [optional] |
| **reservation_start_date** | **Date** |  | [optional] |
| **booked_at** | **Time** |  | [optional] |
| **check_in** | **Time** |  | [optional] |
| **check_out** | **Time** |  | [optional] |
| **time_zone** | **String** |  | [optional] |
| **guest_name** | **String** |  | [optional] |
| **status** | **String** | Payout status signal: COMPLETED (settled) vs UPCOMING (expected). | [optional] |
| **status_type** | **String** |  | [optional] |
| **payout** | [**AirbnbTransactionPayout**](AirbnbTransactionPayout.md) |  |  |
| **currency** | **String** |  | [optional] |
| **host_currency** | **String** |  | [optional] |
| **amount** | **Float** | Top-level transaction amount. | [optional] |
| **host_breakdown** | [**AirbnbTransactionHostBreakdown**](AirbnbTransactionHostBreakdown.md) |  |  |
| **guest_breakdown** | [**AirbnbTransactionGuestBreakdown**](AirbnbTransactionGuestBreakdown.md) |  |  |
| **unavailable_fields** | **Array&lt;String&gt;** | Fields Airbnb does not expose (never fabricated), e.g. &#x60;management_fee&#x60;, &#x60;itemized_discounts&#x60;. |  |
| **standard_fees** | **Object** | Raw Airbnb standard-fees array. | [optional] |
| **tax_details** | **Object** | Raw Airbnb tax-details object. | [optional] |
| **synced_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbTransaction.new(
  transaction_id: null,
  type: null,
  reference: null,
  date: null,
  confirmation_code: null,
  reservation_id: null,
  account_id: 1772489413932732258,
  account_name: Pomello,
  listing_id: null,
  thread_id: null,
  nights: null,
  reservation_start_date: null,
  booked_at: null,
  check_in: null,
  check_out: null,
  time_zone: null,
  guest_name: null,
  status: null,
  status_type: null,
  payout: null,
  currency: null,
  host_currency: null,
  amount: null,
  host_breakdown: null,
  guest_breakdown: null,
  unavailable_fields: null,
  standard_fees: null,
  tax_details: null,
  synced_at: null
)
```

