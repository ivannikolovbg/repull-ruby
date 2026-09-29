# Repull::ListConnectionUnits200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **connection_id** | **String** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **units** | [**Array&lt;ListConnectionUnits200ResponseUnitsInner&gt;**](ListConnectionUnits200ResponseUnitsInner.md) |  | [optional] |
| **listing_options** | [**Array&lt;ListConnectionUnits200ResponseListingOptionsInner&gt;**](ListConnectionUnits200ResponseListingOptionsInner.md) |  | [optional] |
| **missing_capabilities** | **Array&lt;String&gt;** |  | [optional] |
| **listing_options_total** | **Integer** | How many listings the workspace has to map to. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListConnectionUnits200Response.new(
  connection_id: null,
  channel: null,
  status: null,
  units: null,
  listing_options: null,
  missing_capabilities: null,
  listing_options_total: null
)
```

