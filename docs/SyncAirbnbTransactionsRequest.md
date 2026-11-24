# Repull::SyncAirbnbTransactionsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** | Inclusive lower bound (YYYY-MM-DD). | [optional] |
| **end_date** | **Date** | Inclusive upper bound (YYYY-MM-DD). | [optional] |
| **transaction_type** | **String** | Airbnb&#39;s two buckets: &#x60;COMPLETED&#x60; refreshes paid-out lines only, &#x60;UPCOMING&#x60; every unpaid line (&#x60;RELEASED&#x60; and &#x60;UPCOMING&#x60;). Both when omitted. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SyncAirbnbTransactionsRequest.new(
  start_date: null,
  end_date: null,
  transaction_type: null
)
```

