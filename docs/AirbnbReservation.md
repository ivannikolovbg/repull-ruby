# Repull::AirbnbReservation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **confirmation_code** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **account_id** | **String** | Which connected Airbnb account this row belongs to — the Airbnb host id, as a string (they exceed 2^53). The same value &#x60;?account_id&#x3D;&#x60; accepts and &#x60;GET /v1/connect/airbnb&#x60; returns as &#x60;accounts[].externalAccountId&#x60;. | [optional] |
| **account_name** | **String** | Display name of that connected Airbnb account. | [optional] |
| **status** | **String** |  | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **guest_name** | **String** |  | [optional] |
| **guest_count** | **Integer** |  | [optional] |
| **total_price** | **Float** |  | [optional] |
| **currency** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbReservation.new(
  confirmation_code: HMABC12345,
  listing_id: null,
  account_id: 1772489413932732258,
  account_name: Pomello,
  status: accepted,
  check_in: null,
  check_out: null,
  guest_name: null,
  guest_count: null,
  total_price: null,
  currency: null
)
```

