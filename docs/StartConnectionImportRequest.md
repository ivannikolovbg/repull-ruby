# Repull::StartConnectionImportRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scope** | **String** | What to import. &#x60;full&#x60; &#x3D; the first-connect import again (listings, calendars, reservations, payouts, reviews, conversations), for an account that has never fully imported. &#x60;listings&#x60; &#x3D; the account&#39;s listings with their calendars. Omit to let Repull choose: &#x60;full&#x60; for an account that has never fully imported, else &#x60;listings&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::StartConnectionImportRequest.new(
  scope: null
)
```

