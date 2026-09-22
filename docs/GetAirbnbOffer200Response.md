# Repull::GetAirbnbOffer200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb special-offer id. | [optional] |
| **thread_id** | **String** | Airbnb thread id the offer was sent on. | [optional] |
| **offer_type** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **listing_id** | **String** | Airbnb listing id (special offers only). | [optional] |
| **start_date** | **Date** |  | [optional] |
| **nights** | **Integer** |  | [optional] |
| **total_price** | **Float** |  | [optional] |
| **guest_details** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **expires_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbOffer200Response.new(
  id: null,
  thread_id: null,
  offer_type: null,
  status: null,
  listing_id: null,
  start_date: null,
  nights: null,
  total_price: null,
  guest_details: null,
  created_at: null,
  expires_at: null
)
```

