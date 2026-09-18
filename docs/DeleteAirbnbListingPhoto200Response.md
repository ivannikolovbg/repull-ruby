# Repull::DeleteAirbnbListingPhoto200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **deleted** | **Boolean** |  | [optional] |
| **stored** | **Boolean** | Whether our own copy dropped the photo too. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::DeleteAirbnbListingPhoto200Response.new(
  deleted: true,
  stored: null
)
```

