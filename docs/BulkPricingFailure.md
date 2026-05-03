# Repull::BulkPricingFailure

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  | [optional] |
| **dates** | **Array&lt;Date&gt;** |  | [optional] |
| **error_code** | **String** |  | [optional] |
| **error** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BulkPricingFailure.new(
  listing_id: null,
  dates: null,
  error_code: not_owned,
  error: null
)
```

