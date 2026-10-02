# Repull::GetBookingExtranetLoginStatus200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The connection id (numeric string, like every &#x60;*Id&#x60; on the wire). | [optional] |
| **status** | **String** |  | [optional] |
| **error_message** | **String** |  | [optional] |
| **friendly_error** | **String** |  | [optional] |
| **completed** | **Boolean** |  | [optional] |
| **awaiting_mapping** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetBookingExtranetLoginStatus200Response.new(
  account_id: null,
  status: null,
  error_message: null,
  friendly_error: null,
  completed: null,
  awaiting_mapping: null
)
```

