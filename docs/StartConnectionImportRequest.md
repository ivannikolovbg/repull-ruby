# Repull::StartConnectionImportRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scope** | **String** | What to import. &#x60;listings&#x60; &#x3D; the account&#39;s listings and their calendars (pricing and availability). The only scope; the full import runs when an account is connected. | [optional][default to &#39;listings&#39;] |

## Example

```ruby
require 'repull'

instance = Repull::StartConnectionImportRequest.new(
  scope: null
)
```

