# Repull::BookingSetupRequestLegalEntity

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **company_name** | **String** |  |  |
| **legal_contact_name** | **String** |  |  |
| **legal_contact_email** | **String** |  |  |
| **country** | **String** |  | [optional] |
| **city** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingSetupRequestLegalEntity.new(
  company_name: null,
  legal_contact_name: null,
  legal_contact_email: null,
  country: null,
  city: null
)
```

