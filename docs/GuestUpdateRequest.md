# Repull::GuestUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **first_name** | **String** |  | [optional] |
| **last_name** | **String** |  | [optional] |
| **email** | **String** | Added as the guest&#39;s newest email; earlier ones are kept. | [optional] |
| **phone** | **String** | E.164 preferred. Added as the guest&#39;s newest phone; earlier ones are kept. | [optional] |
| **language** | **String** | BCP-47 tag. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GuestUpdateRequest.new(
  first_name: null,
  last_name: null,
  email: null,
  phone: null,
  language: null
)
```

