# Repull::ReservationPrimaryGuest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Internal Repull guest ID. Use &#x60;GET /v1/guests/{id}&#x60; for the full profile. | [optional] |
| **first_name** | **String** |  | [optional] |
| **last_name** | **String** |  | [optional] |
| **email** | **String** | Primary email contact (or first non-primary if no primary set). | [optional] |
| **phone** | **String** | Primary phone contact (or first non-primary if no primary set). | [optional] |
| **language** | **String** | Guest&#39;s preferred language (BCP-47 / ISO 639-1). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationPrimaryGuest.new(
  id: null,
  first_name: null,
  last_name: null,
  email: null,
  phone: null,
  language: null
)
```

