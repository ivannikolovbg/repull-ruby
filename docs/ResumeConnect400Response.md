# Repull::ResumeConnect400Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error** | **String** |  |  |
| **reason** | **String** | Why the token was rejected (only with &#x60;invalid_resume_token&#x60;). | [optional] |
| **channel** | **String** | The token&#39;s channel (only with &#x60;unsupported_channel&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ResumeConnect400Response.new(
  error: null,
  reason: null,
  channel: null
)
```

