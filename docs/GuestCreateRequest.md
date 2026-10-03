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
| **provider** | **String** | A connected PMS to create the guest in as well. The guest is created there FIRST; a PMS that cannot create guest profiles returns &#x60;422 pms_write_unsupported&#x60; and nothing is created. The PMS&#39;s guest id comes back as &#x60;pms.externalId&#x60;, and later &#x60;PATCH /v1/guests/{id}&#x60; changes reach it. | [optional] |

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
  is_business_traveler: null,
  provider: guesty
)
```

