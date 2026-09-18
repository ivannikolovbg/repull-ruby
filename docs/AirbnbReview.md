# Repull::AirbnbReview

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **reservation_code** | **String** |  | [optional] |
| **account_id** | **String** | Which connected Airbnb account this row belongs to — the Airbnb host id, as a string (they exceed 2^53). The same value &#x60;?account_id&#x3D;&#x60; accepts and &#x60;GET /v1/connect/airbnb&#x60; returns as &#x60;accounts[].externalAccountId&#x60;. | [optional] |
| **account_name** | **String** | Display name of that connected Airbnb account. | [optional] |
| **rating** | **Integer** |  | [optional] |
| **comment** | **String** |  | [optional] |
| **response** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbReview.new(
  id: null,
  reservation_code: null,
  account_id: 1772489413932732258,
  account_name: Pomello,
  rating: null,
  comment: null,
  response: null,
  created_at: null
)
```

