# Repull::StudioProject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Project UUID. | [optional] |
| **slug** | **String** | URL-safe slug (unique within your account). Used for the deployment subdomain. | [optional] |
| **name** | **String** | Human-readable project name. | [optional] |
| **prompt** | **String** | Initial prompt that seeded the project. | [optional] |
| **template_id** | **String** | Template the project was scaffolded from, if any. | [optional] |
| **status** | **String** | Current project lifecycle status. | [optional] |
| **customer_id** | **Integer** | Owning Repull account ID. | [optional] |
| **created_at** | **Time** |  | [optional] |
| **last_active_at** | **Time** | Updated whenever a file, generation, or deployment is touched. | [optional] |
| **deleted_at** | **Time** | Soft-delete timestamp. &#x60;null&#x60; for live projects. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::StudioProject.new(
  id: null,
  slug: null,
  name: null,
  prompt: null,
  template_id: null,
  status: null,
  customer_id: null,
  created_at: null,
  last_active_at: null,
  deleted_at: null
)
```

