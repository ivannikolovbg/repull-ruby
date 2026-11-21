# Repull::GetVrboReservation200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**GetVrboReservation200ResponseData**](GetVrboReservation200ResponseData.md) |  | [optional] |
| **confirmation_code** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **data_freshness** | [**GetVrboReservation200ResponseDataFreshness**](GetVrboReservation200ResponseDataFreshness.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboReservation200Response.new(
  data: null,
  confirmation_code: null,
  listing_id: null,
  data_freshness: null
)
```

