# Repull::GetListingIcal200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **url** | **String** | The feed address. Import it on any channel that reads iCal. |  |
| **calendar_name** | **String** | The calendar name the feed carries, and the name to give it when importing it by hand. |  |
| **enabled** | **Boolean** | False when the listing&#39;s feed was turned off; the address then answers 404. |  |
| **vrbo** | [**Array&lt;GetListingIcal200ResponseVrboInner&gt;**](GetListingIcal200ResponseVrboInner.md) | One entry per Vrbo unit mapped to the listing. |  |

## Example

```ruby
require 'repull'

instance = Repull::GetListingIcal200Response.new(
  listing_id: 1001,
  url: https://api.repull.dev/ical/4f9c2d7e1a8b3c6d5e0f9a2b7c4d1e8f3a6b9c2d5e8f1a4b7c0d3e6f9a2b5c8d.ics,
  calendar_name: null,
  enabled: null,
  vrbo: null
)
```

