# Repull::RefreshAirbnbResolutionsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Limit the refresh to one Airbnb host id. Omit for all connected accounts. | [optional] |
| **status** | **String** | Limit the refresh to one lifecycle. Omit for all. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::RefreshAirbnbResolutionsRequest.new(
  account_id: null,
  status: null
)
```

