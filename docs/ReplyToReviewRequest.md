# Repull::ReplyToReviewRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | Reply text. &#x60;response&#x60; is accepted as an alias. |  |
| **name** | **String** | VRBO: the name the response is signed with (the connected account&#39;s host name otherwise). Ignored on other channels. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReplyToReviewRequest.new(
  message: null,
  name: null
)
```

