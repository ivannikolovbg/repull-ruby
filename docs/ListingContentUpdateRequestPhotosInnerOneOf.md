# Repull::ListingContentUpdateRequestPhotosInnerOneOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** | Hosted image URL (http/https). |  |
| **thumbnail_url** | **String** |  | [optional] |
| **caption** | **String** |  | [optional] |
| **category** | **String** |  | [optional][default to &#39;property&#39;] |
| **width** | **Integer** |  | [optional] |
| **height** | **Integer** |  | [optional] |
| **sort_order** | **Integer** | Explicit position; defaults to the array index. | [optional] |
| **source_url** | **String** | Provenance URL; defaults to &#x60;url&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingContentUpdateRequestPhotosInnerOneOf.new(
  url: null,
  thumbnail_url: null,
  caption: null,
  category: null,
  width: null,
  height: null,
  sort_order: null,
  source_url: null
)
```

