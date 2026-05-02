# Repull::GuestFlag

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Severity / category (e.g. &#x60;info&#x60;, &#x60;warning&#x60;, &#x60;block&#x60;). | [optional] |
| **note** | **String** | Reason text when present. | [optional] |
| **is_active** | **Boolean** |  | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GuestFlag.new(
  type: null,
  note: null,
  is_active: null,
  created_at: null
)
```

