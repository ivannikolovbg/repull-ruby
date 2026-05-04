# Repull::StudioErrorError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | Stable machine-readable error code (e.g. &#x60;bad_request&#x60;, &#x60;not_found&#x60;, &#x60;rate_limited&#x60;). |  |
| **message** | **String** | Human-readable description of what went wrong. |  |
| **fix** | **String** | Suggested next action for the caller (optional). | [optional] |
| **docs_url** | **String** | Link to the docs page that explains this error. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::StudioErrorError.new(
  code: null,
  message: null,
  fix: null,
  docs_url: null
)
```

