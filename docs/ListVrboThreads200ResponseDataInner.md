# Repull::ListVrboThreads200ResponseDataInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull conversation id — the &#x60;{id}&#x60; of &#x60;/v1/conversations/{id}&#x60;. | [optional] |
| **external_thread_id** | **String** | The Vrbo conversation id (&#x60;vrbo:&lt;uuid&gt;&#x60;), the &#x60;{threadId}&#x60; of these routes. | [optional] |
| **listing_id** | **String** |  | [optional] |
| **reservation_id** | **String** |  | [optional] |
| **account_id** | **String** | The Vrbo account the conversation belongs to (&#x60;vrbo:…&#x60;). | [optional] |
| **account_name** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListVrboThreads200ResponseDataInner.new(
  id: null,
  external_thread_id: null,
  listing_id: null,
  reservation_id: null,
  account_id: null,
  account_name: null,
  created_at: null,
  updated_at: null
)
```

