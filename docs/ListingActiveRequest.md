# Repull::ListingActiveRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **active** | **Boolean** | Target active state. &#x60;false&#x60; deactivates (excludes) the listing; &#x60;true&#x60; reactivates it (subject to the plan-listings cap). |  |

## Example

```ruby
require 'repull'

instance = Repull::ListingActiveRequest.new(
  active: null
)
```

