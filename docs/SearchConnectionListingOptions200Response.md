# Repull::SearchConnectionListingOptions200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;SearchConnectSessionListingOptions200ResponseDataInner&gt;**](SearchConnectSessionListingOptions200ResponseDataInner.md) |  | [optional] |
| **total** | **Integer** | How many listings match &#x60;q&#x60; in total. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SearchConnectionListingOptions200Response.new(
  data: null,
  total: null
)
```

