# Repull::AirbnbThread

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **account_id** | **String** | Which connected Airbnb account this row belongs to — the Airbnb host id, as a string (they exceed 2^53). The same value &#x60;?account_id&#x3D;&#x60; accepts and &#x60;GET /v1/connect/airbnb&#x60; returns as &#x60;accounts[].externalAccountId&#x60;. | [optional] |
| **account_name** | **String** | Display name of that connected Airbnb account. | [optional] |
| **guest_name** | **String** |  | [optional] |
| **last_message_at** | **Time** |  | [optional] |
| **unread_count** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbThread.new(
  id: null,
  listing_id: null,
  account_id: 1772489413932732258,
  account_name: Pomello,
  guest_name: null,
  last_message_at: null,
  unread_count: null
)
```

