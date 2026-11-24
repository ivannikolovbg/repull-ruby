# Repull::StartConnectionImportRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scope** | **String** | What to import. &#x60;listings&#x60; &#x3D; the account&#39;s listings; new listings come in with their calendar (pricing and availability); on a full-access connection, calendars of listings already in Repull are not re-read. &#x60;reservations&#x60; &#x3D; the account&#39;s reservations, stays from the last month and every future one. The full import runs when an account is connected. | [optional][default to &#39;listings&#39;] |

## Example

```ruby
require 'repull'

instance = Repull::StartConnectionImportRequest.new(
  scope: null
)
```

