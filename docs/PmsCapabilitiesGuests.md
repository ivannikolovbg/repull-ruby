# Repull::PmsCapabilitiesGuests

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create** | **Boolean** | &#x60;POST /v1/guests&#x60; with &#x60;provider&#x60;. | [optional] |
| **update** | **Boolean** | &#x60;PATCH /v1/guests/{id}&#x60; on a guest linked to this PMS. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PmsCapabilitiesGuests.new(
  create: null,
  update: null
)
```

