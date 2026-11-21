# Repull::GetVrboListingContent200ResponseSectionsVideosItemsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **file_name** | **String** |  | [optional] |
| **status** | **String** | Vrbo&#39;s processing / review status. | [optional] |
| **url** | **String** |  | [optional] |
| **thumbnail** | **String** |  | [optional] |
| **uploaded_time** | **String** |  | [optional] |
| **rejected_reasons** | **Object** | Why Vrbo&#39;s review refused the video. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingContent200ResponseSectionsVideosItemsInner.new(
  id: null,
  file_name: null,
  status: null,
  url: null,
  thumbnail: null,
  uploaded_time: null,
  rejected_reasons: null
)
```

