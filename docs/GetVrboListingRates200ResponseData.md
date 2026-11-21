# Repull::GetVrboListingRates200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start** | **String** |  | [optional] |
| **_end** | **String** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **days** | [**Array&lt;GetVrboListingContent200ResponseSectionsRatesDaysInner&gt;**](GetVrboListingContent200ResponseSectionsRatesDaysInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingRates200ResponseData.new(
  start: null,
  _end: null,
  currency: null,
  days: null
)
```

