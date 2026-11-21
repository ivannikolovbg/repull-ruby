# Repull::GetVrboListingAvailability200ResponseDataOneOfInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** |  | [optional] |
| **available** | **Boolean** |  | [optional] |
| **blocked_by** | **String** |  | [optional] |
| **reservation_ref** | **String** |  | [optional] |
| **nightly_rate** | **Float** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **min_stay** | **Integer** |  | [optional] |
| **check_in** | **Boolean** |  | [optional] |
| **check_out** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingAvailability200ResponseDataOneOfInner.new(
  date: null,
  available: null,
  blocked_by: null,
  reservation_ref: null,
  nightly_rate: null,
  currency: null,
  min_stay: null,
  check_in: null,
  check_out: null
)
```

