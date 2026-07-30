# Repull::SandboxSeedResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **customer_id** | **String** |  |  |
| **seeded_at** | **Time** |  |  |
| **listings** | [**Array&lt;SandboxFixtureRef&gt;**](SandboxFixtureRef.md) | 3 sample listings. |  |
| **reservations** | [**Array&lt;SandboxFixtureRef&gt;**](SandboxFixtureRef.md) | 5 reservations across the lifecycle: created, modified, cancelled, date-changed, pending. |  |
| **connections** | [**Array&lt;SandboxFixtureRef&gt;**](SandboxFixtureRef.md) | 2 fake connected provider accounts: Airbnb + Booking.com. |  |

## Example

```ruby
require 'repull'

instance = Repull::SandboxSeedResult.new(
  customer_id: 1,
  seeded_at: null,
  listings: null,
  reservations: null,
  connections: null
)
```

