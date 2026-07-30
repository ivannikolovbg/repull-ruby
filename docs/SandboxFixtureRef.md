# Repull::SandboxFixtureRef

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ref** | **String** | Stable reference key — constant across re-seeds. |  |
| **id** | **String** | Synthetic id (&gt;&#x3D; 900,000,000). Reference it against GET /v1/listings, /v1/reservations, /v1/connect. |  |

## Example

```ruby
require 'repull'

instance = Repull::SandboxFixtureRef.new(
  ref: sbx-listing-oceanview,
  id: 900000101
)
```

