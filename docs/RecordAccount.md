# Repull::RecordAccount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** | airbnb, booking, booking_extranet, vrbo, or the PMS id (hostaway, cloudbeds, …). | [optional] |
| **external_account_id** | **String** | The platform&#39;s own account id: Airbnb host id; Booking.com hotel id (&#x60;booking&#x60;); the Booking.com account id behind the Extranet login (&#x60;booking_extranet&#x60;); Vrbo&#39;s account id (&#x60;vrbo&#x60;); the PMS&#39;s own account or company id. &#x60;null&#x60; when the platform id is not known yet (a Vrbo sign-in before its account id is captured, a PMS that does not expose one); never a Repull id. | [optional] |
| **connection_id** | **String** | Our connection record id: the &#x60;X-Account-Id&#x60; value, the same as &#x60;account.id&#x60;. &#x60;null&#x60; only when the account has no connection record (e.g. a Vrbo sign-in in a workspace with no Vrbo connection). A string, like every id in API responses. | [optional] |
| **hotel_id** | **String** | Booking.com only: the hotel (property) id the record belongs to. A &#x60;booking_extranet&#x60; account (a Booking.com account) can cover several hotels; this says which one. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::RecordAccount.new(
  provider: airbnb,
  external_account_id: 79730216,
  connection_id: 126,
  hotel_id: 10433861
)
```

