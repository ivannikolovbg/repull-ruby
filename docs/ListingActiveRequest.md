# Repull::ListingActiveRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **active** | **Boolean** | Target active state. &#x60;false&#x60; deactivates the listing and removes it from your billable listing count; &#x60;true&#x60; reactivates it. Free-tier workspaces are still subject to their listing cap. |  |

## Example

```ruby
require 'repull'

instance = Repull::ListingActiveRequest.new(
  active: null
)
```

