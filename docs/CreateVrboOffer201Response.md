# Repull::CreateVrboOffer201Response

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::CreateVrboOffer201Response.openapi_one_of
# =>
# [
#   :'CreateVrboOffer201ResponseOneOf',
#   :'GetVrboOffer200Response'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::CreateVrboOffer201Response.build(data)
# => #<CreateVrboOffer201ResponseOneOf:0x00007fdd4aab02a0>

Repull::CreateVrboOffer201Response.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `CreateVrboOffer201ResponseOneOf`
- `GetVrboOffer200Response`
- `nil` (if no type matches)

