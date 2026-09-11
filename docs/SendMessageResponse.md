# Repull::SendMessageResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull message id for the row that was recorded. | [optional] |
| **conversation_id** | **Integer** |  | [optional] |
| **external_message_id** | **String** | The channel&#39;s own message id, when it returns one. | [optional] |
| **channel** | **String** | The channel the message actually went out on. | [optional] |
| **status** | **String** |  | [optional] |
| **direction** | **String** |  | [optional] |
| **content_rewritten** | **Boolean** | TRUE when the channel altered the text before delivery — today that means Airbnb stripped a link, an email address or a phone number and the remainder was re-sent. When true, the guest did NOT receive &#x60;submittedContent&#x60;; they received &#x60;deliveredContent&#x60;. | [optional] |
| **submitted_content** | **String** | The text you sent. | [optional] |
| **delivered_content** | **String** | The text the guest actually received. Differs from &#x60;submittedContent&#x60; exactly when &#x60;contentRewritten&#x60; is true. | [optional] |
| **status_reason** | **String** | The channel&#39;s verbatim note, when it gave one — including the refusal that triggered a rewrite. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SendMessageResponse.new(
  id: null,
  conversation_id: null,
  external_message_id: null,
  channel: null,
  status: sent,
  direction: null,
  content_rewritten: null,
  submitted_content: null,
  delivered_content: null,
  status_reason: null
)
```

