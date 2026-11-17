# Repull::StartConnectionImportRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scope** | **String** | What to import. &#x60;listings&#x60; &#x3D; the account&#39;s listings. New listings come in with their calendar (pricing and availability); on a full-access connection, calendars of listings already in Repull are not re-read. The only scope; the full import runs when an account is connected. | [optional][default to &#39;listings&#39;] |

## Example

```ruby
require 'repull'

instance = Repull::StartConnectionImportRequest.new(
  scope: null
)
```

