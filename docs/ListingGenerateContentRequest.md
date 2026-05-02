# Repull::ListingGenerateContentRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **photos** | **Array&lt;String&gt;** | Up to 8 reference photos. When present, Kimi K2 vision is used for grounded copy. | [optional] |
| **style** | **String** |  | [optional][default to &#39;warm&#39;] |
| **persist** | **Boolean** | Save the generated content to the listing (so subsequent publishes pick it up). | [optional][default to true] |

## Example

```ruby
require 'repull'

instance = Repull::ListingGenerateContentRequest.new(
  photos: null,
  style: null,
  persist: null
)
```

