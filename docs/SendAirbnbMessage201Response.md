# Repull::SendAirbnbMessage201Response

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::SendAirbnbMessage201Response.openapi_one_of
# =>
# [
#   :'Hash<String, Object>',
#   :'SendMessageResponse'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::SendAirbnbMessage201Response.build(data)
# => #<Hash<String, Object>:0x00007fdd4aab02a0>

Repull::SendAirbnbMessage201Response.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `Hash<String, Object>`
- `SendMessageResponse`
- `nil` (if no type matches)

