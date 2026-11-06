# Repull::AirbnbAccessAccountsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account** | **String** | What &#x60;account&#x60; on a send takes. |  |
| **name** | **String** |  |  |
| **role** | **String** |  |  |
| **state** | **String** | &#x60;connected&#x60; can act now; &#x60;disconnected&#x60; was connected to this workspace; &#x60;never_connected&#x60; is on the listing but was never connected here. |  |
| **disconnected_at** | **Time** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbAccessAccountsInner.new(
  account: airbnb:228981432,
  name: Team Co-Host,
  role: null,
  state: null,
  disconnected_at: null
)
```

