# Repull::GetVrboListingAvailability200ResponseDataOneOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **job_id** | **Integer** |  | [optional] |
| **status** | **String** |  | [optional] |
| **nights** | **Integer** |  | [optional] |
| **queued_at** | **String** |  | [optional] |
| **finished_at** | **String** |  | [optional] |
| **error** | **String** |  | [optional] |
| **stats** | **Hash&lt;String, Object&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingAvailability200ResponseDataOneOf.new(
  job_id: null,
  status: done,
  nights: null,
  queued_at: null,
  finished_at: null,
  error: null,
  stats: null
)
```

