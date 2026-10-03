# Repull::GuestUpdateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **first_name** | **String** |  | [optional] |
| **last_name** | **String** |  | [optional] |
| **language** | **String** |  | [optional] |
| **contacts** | [**Array&lt;GuestUpdateResponseContactsInner&gt;**](GuestUpdateResponseContactsInner.md) |  | [optional] |
| **updated_at** | **Time** |  | [optional] |
| **pms** | [**Array&lt;GuestUpdateResponsePmsInner&gt;**](GuestUpdateResponsePmsInner.md) | Each PMS the change was written to first (the guest&#39;s linked PMSs), with the sections it applied. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GuestUpdateResponse.new(
  id: null,
  first_name: null,
  last_name: null,
  language: null,
  contacts: null,
  updated_at: null,
  pms: null
)
```

