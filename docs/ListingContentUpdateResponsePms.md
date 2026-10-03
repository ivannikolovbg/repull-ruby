# Repull::ListingContentUpdateResponsePms

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** |  | [optional] |
| **applied** | **Array&lt;String&gt;** | Sections the PMS applied. | [optional] |
| **errors** | [**Array&lt;ListingContentUpdateResponsePmsErrorsInner&gt;**](ListingContentUpdateResponsePmsErrorsInner.md) | Sections the PMS refused, with its reason. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingContentUpdateResponsePms.new(
  provider: guesty,
  applied: null,
  errors: null
)
```

