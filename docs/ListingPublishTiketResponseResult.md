# Repull::ListingPublishTiketResponseResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pushed** | **Boolean** | &#x60;true&#x60; when every section landed. | [optional] |
| **reason** | **String** | Why nothing was sent, when &#x60;pushed&#x60; is &#x60;false&#x60; and no section was tried. | [optional] |
| **sections** | **Array&lt;String&gt;** | Sections tiket.com accepted (for example the property, each room type, each rate plan). | [optional] |
| **errors** | **Hash&lt;String, String&gt;** | Sections that did not land, with tiket.com&#39;s reason. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPublishTiketResponseResult.new(
  pushed: null,
  reason: null,
  sections: null,
  errors: null
)
```

