# Repull::DeleteAirbnbListingRoom200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **deleted** | **Boolean** |  | [optional] |
| **stored** | **Boolean** | Whether our own copy dropped the room too. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::DeleteAirbnbListingRoom200Response.new(
  deleted: true,
  stored: null
)
```

