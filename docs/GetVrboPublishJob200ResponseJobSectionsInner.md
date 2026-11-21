# Repull::GetVrboPublishJob200ResponseJobSectionsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **section** | **String** |  | [optional] |
| **status** | **String** | &#x60;rejected&#x60;: Vrbo refused something (its message in &#x60;errors&#x60;); &#x60;failed&#x60;: the write did not complete (e.g. Vrbo paused the account). | [optional] |
| **sent** | **Hash&lt;String, Object&gt;** | The partial section input sent — the body &#x60;PUT /v1/channels/vrbo/listings/{id}/{section}&#x60; takes. | [optional] |
| **errors** | [**Array&lt;GetVrboPublishJob200ResponseJobSectionsInnerErrorsInner&gt;**](GetVrboPublishJob200ResponseJobSectionsInnerErrorsInner.md) |  | [optional] |
| **data** | **Object** | What Vrbo has stored for the section after the write. | [optional] |
| **finished_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboPublishJob200ResponseJobSectionsInner.new(
  section: house-rules,
  status: null,
  sent: null,
  errors: null,
  data: null,
  finished_at: null
)
```

