# Repull::RecordAccount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** | airbnb, booking, booking_extranet, vrbo, or the PMS id (hostaway, cloudbeds, …). | [optional] |
| **external_account_id** | **String** | The provider&#39;s own account id — Airbnb host id, Booking.com hotel id, Extranet login, Vrbo account, or the PMS account. | [optional] |
| **connection_id** | **String** | Repull connection id (&#x60;X-Account-Id&#x60;), when the account has one. A string, like every id in API responses. | [optional] |
| **hotel_id** | **String** | Booking.com only: the hotel (property) id the record belongs to. On a &#x60;booking_extranet&#x60; account, &#x60;externalAccountId&#x60; is the login, which can cover several hotels. | [optional] |

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

