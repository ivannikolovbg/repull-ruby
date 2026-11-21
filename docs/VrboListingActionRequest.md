# Repull::VrboListingActionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** |  |  |
| **vrbo_listing_number** | **String** | &#x60;push&#x60; / &#x60;unlist&#x60; / &#x60;relist&#x60;: the Vrbo listing, when the listing is linked to several. | [optional] |
| **sections** | **Array&lt;String&gt;** | &#x60;push&#x60;: only these sections (as for &#x60;POST /v1/listings/{id}/publish/vrbo&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::VrboListingActionRequest.new(
  action: null,
  vrbo_listing_number: null,
  sections: null
)
```

