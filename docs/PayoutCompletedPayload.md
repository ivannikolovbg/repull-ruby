# Repull::PayoutCompletedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  |  |
| **account_id** | **String** | The Airbnb account (host id) that was paid. |  |
| **account_name** | **String** |  | [optional] |
| **payout** | [**AirbnbTransaction**](AirbnbTransaction.md) |  |  |
| **lines** | [**Array&lt;AirbnbTransaction&gt;**](AirbnbTransaction.md) | In payout order (&#x60;payout.lineIndex&#x60;). |  |

## Example

```ruby
require 'repull'

instance = Repull::PayoutCompletedPayload.new(
  channel: null,
  account_id: 10000001,
  account_name: null,
  payout: null,
  lines: null
)
```

