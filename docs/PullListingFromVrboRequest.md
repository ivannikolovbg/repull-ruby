# Repull::PullListingFromVrboRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vrbo_listing_number** | **String** | The Vrbo listing number to pull, when the listing is linked to more than one Vrbo unit. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PullListingFromVrboRequest.new(
  vrbo_listing_number: null
)
```

