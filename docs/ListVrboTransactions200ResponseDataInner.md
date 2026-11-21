# Repull::ListVrboTransactions200ResponseDataInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transaction_id** | **String** | Stable: the deposit&#39;s reference number on a Payout row; &#x60;&lt;reference&gt;:&lt;confirmationCode&gt;:&lt;n&gt;&#x60; on a line; &#x60;upcoming:&lt;confirmationCode&gt;:&lt;n&gt;&#x60; on a scheduled payout. | [optional] |
| **account_id** | **String** |  | [optional] |
| **account_name** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **type** | **String** | &#x60;Payout&#x60; (the bank deposit), &#x60;Reservation&#x60; (a booking it paid), &#x60;Adjustment&#x60; (money taken back from it). | [optional] |
| **is_payout** | **Boolean** |  | [optional] |
| **date** | **Date** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **amount** | **Float** | Signed: what this line adds to its deposit. On a Payout row, the amount deposited. | [optional] |
| **payout** | [**ListVrboTransactions200ResponseDataInnerPayout**](ListVrboTransactions200ResponseDataInnerPayout.md) |  | [optional] |
| **confirmation_code** | **String** |  | [optional] |
| **reservation_id** | **Integer** | The Repull reservation, when the booking is in the workspace. | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **vrbo_listing_number** | **String** |  | [optional] |
| **on_inactive_listing** | **Boolean** |  | [optional] |
| **guest_name** | **String** |  | [optional] |
| **upcoming_status** | **String** | On an UPCOMING line: Vrbo&#39;s status for the payout (&#x60;Scheduled&#x60;, &#x60;Blocked&#x60;, …). | [optional] |
| **unavailable_fields** | **Array&lt;String&gt;** |  | [optional] |
| **synced_at** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListVrboTransactions200ResponseDataInner.new(
  transaction_id: null,
  account_id: null,
  account_name: null,
  status: null,
  type: Reservation,
  is_payout: null,
  date: null,
  currency: null,
  amount: null,
  payout: null,
  confirmation_code: null,
  reservation_id: null,
  listing_id: null,
  vrbo_listing_number: null,
  on_inactive_listing: null,
  guest_name: null,
  upcoming_status: null,
  unavailable_fields: null,
  synced_at: null
)
```

