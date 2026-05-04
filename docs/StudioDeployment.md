# Repull::StudioDeployment

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **deployment_id** | **String** |  | [optional] |
| **project_id** | **String** |  | [optional] |
| **subdomain** | **String** | Subdomain assigned to this deployment (e.g. &#x60;my-app-a1b2c3&#x60;). | [optional] |
| **status** | **String** | Current deployment lifecycle status. | [optional] |
| **url** | **String** | Fully-qualified URL where the deployment is reachable when &#x60;status&#x60; is &#x60;live&#x60;. | [optional] |
| **created_at** | **Time** |  | [optional] |
| **suspended_at** | **Time** | Set when the deployment is paused via &#x60;/suspend&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::StudioDeployment.new(
  deployment_id: null,
  project_id: null,
  subdomain: null,
  status: null,
  url: null,
  created_at: null,
  suspended_at: null
)
```

