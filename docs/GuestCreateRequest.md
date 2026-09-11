# Repull::GuestCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **first_name** | **String** |  |  |
| **last_name** | **String** |  | [optional] |
| **email** | **String** |  | [optional] |
| **phone** | **String** | E.164 preferred. Stored normalised. | [optional] |
| **language** | **String** | BCP-47 tag. | [optional] |
| **currency** | **String** |  | [optional] |
| **is_business_traveler** | **Boolean** |  | [optional][default to false] |

## Example

```ruby
require 'repull'

instance = Repull::GuestCreateRequest.new(
  first_name: Ada,
  last_name: Lovelace,
  email: ada@example.com,
  phone: +14035551234,
  language: en-GB,
  currency: GBP,
  is_business_traveler: null
)
```

