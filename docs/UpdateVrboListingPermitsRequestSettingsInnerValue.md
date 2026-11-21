# Repull::UpdateVrboListingPermitsRequestSettingsInnerValue

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::UpdateVrboListingPermitsRequestSettingsInnerValue.openapi_one_of
# =>
# [
#   :'Boolean',
#   :'Float',
#   :'String'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::UpdateVrboListingPermitsRequestSettingsInnerValue.build(data)
# => #<Boolean:0x00007fdd4aab02a0>

Repull::UpdateVrboListingPermitsRequestSettingsInnerValue.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `Boolean`
- `Float`
- `String`
- `nil` (if no type matches)

