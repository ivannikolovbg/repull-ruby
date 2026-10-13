# Repull::SelectProviderResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** |  | [optional] |
| **provider** | **String** |  | [optional] |
| **pattern** | **String** |  | [optional] |
| **next_url** | **String** | Where to send the user next — OAuth consent, credentials form, activation checklist, claim form, or (for a &#x60;request-only&#x60; PMS) the request form. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SelectProviderResponse.new(
  session_id: null,
  provider: airbnb,
  pattern: null,
  next_url: null
)
```

