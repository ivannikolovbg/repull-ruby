# Repull::GuestCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Pass to &#x60;GET /v1/guests/{id}&#x60; for the full profile. | [optional] |
| **created** | **Boolean** | &#x60;true&#x60; when a new guest was written, &#x60;false&#x60; when an existing guest matched on email/phone plus name. Read this rather than assuming a 2xx means a new record. | [optional] |
| **first_name** | **String** |  | [optional] |
| **last_name** | **String** |  | [optional] |
| **language** | **String** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **is_business_traveler** | **Boolean** |  | [optional] |
| **contacts** | [**Array&lt;GuestCreateResponseContactsInner&gt;**](GuestCreateResponseContactsInner.md) | One entry per stored contact. Email and phone are separate records. | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GuestCreateResponse.new(
  id: 91234,
  created: null,
  first_name: null,
  last_name: null,
  language: null,
  currency: null,
  is_business_traveler: null,
  contacts: null,
  created_at: null
)
```

