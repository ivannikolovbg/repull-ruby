# Repull::PublishSectionError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **section** | **String** | Which part of the listing this failure is about. |  |
| **message** | **String** | Airbnb&#39;s own reason, verbatim, or ours when we refused to send an empty section. |  |
| **code** | **String** | &#x60;locked&#x60; — Airbnb refuses to change these fields on this listing; retrying cannot succeed and &#x60;lockedFields&#x60; names them. &#x60;no_content&#x60; — there was nothing canonical to send; write the content, then publish again. &#x60;rejected&#x60; — Airbnb refused the section as sent; fix the content and publish again. |  |
| **locked_fields** | **Array&lt;String&gt;** | For &#x60;code: locked&#x60; — the fields Airbnb dropped. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PublishSectionError.new(
  section: null,
  message: null,
  code: null,
  locked_fields: null
)
```

