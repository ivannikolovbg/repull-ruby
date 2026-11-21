# Repull::UpdateVrboListingProtectionRequestDamageDeposit

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::UpdateVrboListingProtectionRequestDamageDeposit.openapi_one_of
# =>
# [
#   :'Float',
#   :'UpdateVrboListingProtectionRequestDamageDepositOneOf'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::UpdateVrboListingProtectionRequestDamageDeposit.build(data)
# => #<Float:0x00007fdd4aab02a0>

Repull::UpdateVrboListingProtectionRequestDamageDeposit.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `Float`
- `UpdateVrboListingProtectionRequestDamageDepositOneOf`
- `nil` (if no type matches)

