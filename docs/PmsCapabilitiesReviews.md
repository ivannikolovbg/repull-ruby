# Repull::PmsCapabilitiesReviews

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **read** | **Boolean** | Its reviews appear in &#x60;GET /v1/reviews&#x60; (with &#x60;pms&#x60; set). | [optional] |
| **reply** | **Boolean** | &#x60;POST /v1/reviews/{id}/reply&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PmsCapabilitiesReviews.new(
  read: null,
  reply: null
)
```

