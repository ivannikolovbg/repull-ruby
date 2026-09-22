# Repull::ListInquiries200ResponseDataInnerGuests

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total** | **Integer** |  | [optional] |
| **adults** | **Integer** |  | [optional] |
| **children** | **Integer** |  | [optional] |
| **infants** | **Integer** |  | [optional] |
| **pets** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListInquiries200ResponseDataInnerGuests.new(
  total: 2,
  adults: 2,
  children: 0,
  infants: 0,
  pets: 0
)
```

