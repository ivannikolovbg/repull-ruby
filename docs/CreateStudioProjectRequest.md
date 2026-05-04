# Repull::CreateStudioProjectRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Human-readable project name. Used to derive the slug. |  |
| **prompt** | **String** | Initial prompt that seeds the project. Repull AI scaffolds the first generation from this. |  |
| **template_id** | **String** | Optional template to start from (e.g. &#x60;next-saas&#x60;). Omit to generate from prompt only. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateStudioProjectRequest.new(
  name: null,
  prompt: null,
  template_id: null
)
```

