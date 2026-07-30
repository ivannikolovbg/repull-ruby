# Repull::CreateAirbnbOfferRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Which kind of offer to create. |  |
| **thread_id** | **String** | Airbnb thread id. Required when &#x60;type&#x60; is &#x60;preapproval&#x60;. | [optional] |
| **block_instant_booking** | **Boolean** | For &#x60;preapproval&#x60; — whether to block instant booking. | [optional][default to false] |

## Example

```ruby
require 'repull'

instance = Repull::CreateAirbnbOfferRequest.new(
  type: null,
  thread_id: null,
  block_instant_booking: null
)
```

