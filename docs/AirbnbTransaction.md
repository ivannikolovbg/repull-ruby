# Repull::AirbnbTransaction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transaction_id** | **String** | Stable id. A Payout row: Airbnb&#39;s payout id. A settled line: &#x60;&lt;payoutId&gt;:&lt;type&gt;:&lt;confirmationCode&gt;:&lt;n&gt;&#x60;. An upcoming line: &#x60;upcoming:&lt;accountId&gt;:&lt;type&gt;:&lt;confirmationCode&gt;:&lt;date&gt;:&lt;n&gt;&#x60;. Identical on every refresh; upsert on it. |  |
| **account_id** | **String** | The connected Airbnb account (host id, as a string — they exceed 2^53). | [optional] |
| **account_name** | **String** |  | [optional] |
| **status** | **String** | &#x60;COMPLETED&#x60;: settled in a payout. &#x60;UPCOMING&#x60;: expected, not paid out yet. |  |
| **type** | **String** | Airbnb&#39;s line type, verbatim: &#x60;Payout&#x60;, &#x60;Reservation&#x60;, &#x60;Adjustment&#x60;, &#x60;Resolution Payout&#x60;, &#x60;Resolution Adjustment&#x60;, &#x60;Cancellation Fee&#x60;, &#x60;Pass Through Tot&#x60;, … |  |
| **is_payout** | **Boolean** | &#x60;true&#x60; on the Payout row itself. |  |
| **date** | **Date** | The line&#39;s date as Airbnb reports it. Can be the day before its payout&#39;s date. | [optional] |
| **currency** | **String** |  | [optional] |
| **amount** | **Float** | Signed amount this line contributes to its payout, after Airbnb&#39;s host service fee. On a Payout row, the amount paid out. | [optional] |
| **gross_amount** | **Float** | Before Airbnb&#39;s host service fee: &#x60;amount - fees.hostServiceFee&#x60;. | [optional] |
| **fees** | [**AirbnbTransactionFees**](AirbnbTransactionFees.md) |  |  |
| **payout** | [**AirbnbTransactionPayout**](AirbnbTransactionPayout.md) |  |  |
| **confirmation_code** | **String** |  | [optional] |
| **reservation_id** | **String** | Repull reservation id when the confirmation code matches a reservation in this workspace; &#x60;null&#x60; when it does not (explicitly unlinked). | [optional] |
| **listing_id** | **String** | Airbnb listing id. | [optional] |
| **listing_name** | **String** |  | [optional] |
| **on_inactive_listing** | **Boolean** | &#x60;true&#x60; when the line is on a listing that is inactive in Repull. Still returned, so the payout reconciles. |  |
| **guest_name** | **String** |  | [optional] |
| **nights** | **Integer** |  | [optional] |
| **reservation_start_date** | **Date** |  | [optional] |
| **description** | **String** | Airbnb&#39;s description: the stay dates, the resolution, or on a Payout row the payout method. | [optional] |
| **reference** | **String** | The resolution id on resolution payouts and adjustments; else &#x60;null&#x60;. | [optional] |
| **unavailable_fields** | **Array&lt;String&gt;** | What Airbnb&#39;s transaction history does not carry, so it is never filled in: &#x60;taxes&#x60; (those Airbnb remits itself; pass-through tax paid to the host arrives as &#x60;Pass Through Tot&#x60; lines), &#x60;guest_paid_total&#x60;, &#x60;original_transaction_id&#x60;, &#x60;currency_conversion&#x60;, &#x60;management_fee&#x60;. |  |
| **synced_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbTransaction.new(
  transaction_id: M-HQLLNSWKUWK7R:reservation:HMRQ8FC4YN:1,
  account_id: 10000001,
  account_name: Seaside Stays,
  status: null,
  type: Reservation,
  is_payout: null,
  date: null,
  currency: USD,
  amount: 40.6,
  gross_amount: 48.05,
  fees: null,
  payout: null,
  confirmation_code: HMRQ8FC4YN,
  reservation_id: null,
  listing_id: null,
  listing_name: null,
  on_inactive_listing: null,
  guest_name: null,
  nights: null,
  reservation_start_date: null,
  description: null,
  reference: CLSF-06472635,
  unavailable_fields: null,
  synced_at: null
)
```

